#----------------------
# Variables
#----------------------

# the project folder:
projDir <- "/home/ubuntu/Course_Materials/scRNAseq"
# the working directory, where the cellranger output is stored:
wrkDir <- sprintf("%s/CaronBourque2020/grch38300", projDir)
# the output folder, wher we would write files for that analysis:
outDirBit <- "AnaWiSce/Attempt1"
# the output folder, wher we would write files:
qcPlotDirBit <- "QcPlots_SRR9264344"
# change directory to the project folder:
setwd(projDir)

#----------------------
# Packages
#----------------------

library(scran)
library(scater)
library(DropletUtils)
library(ggplot2)
library(SingleCellExperiment)
library(igraph)
library(Matrix)
library(biomaRt)
library(irlba)
library(DT)
library(dplyr)

#----------------------
# Sample sheet
#----------------------

# Caron set
cb_sampleSheetFn <- file.path(projDir, "Data/CaronBourque2020/SraRunTable.txt")
# Human Cell Atlas Census set
hca_sampleSheetFn <- file.path(projDir, "Data/Hca/accList_Hca.txt")

# read sample sheets in:
splShtColToKeep <- c("Run", "Sample.Name", "source_name") # columns to keep
cb_sampleSheet <- read.table(cb_sampleSheetFn, header=T, sep=",") # the CaronBourque set 
hca_sampleSheet <- read.table(hca_sampleSheetFn, header=F, sep=",") # the hca set
# add some columns to the hca sheet to merge with the Caran sheet:
colnames(hca_sampleSheet) <- "Sample.Name"
hca_sampleSheet$Run <- hca_sampleSheet$Sample.Name
hca_sampleSheet$source_name <- "ABMMC" # adult BMMC
# combine the two sheets into one:
sampleSheet <- rbind(cb_sampleSheet[,splShtColToKeep], hca_sampleSheet[,splShtColToKeep])
# check:
sampleSheet

#----------------------
# Cell calling for droplet data
#----------------------

# molecule info file
#----------------------

i <- 2
mol.info.file <- sprintf("%s/%s/%s/outs/molecule_info.h5", wrkDir, sampleSheet[i,"Run"], sampleSheet[i,"Run"])
mol.info <- read10xMolInfo(mol.info.file)

# Distribution of UMI counts:
#----------------------

dd <- mol.info$data %>% data.frame()
libSizeDf <- dd %>% group_by(cell) %>%
	summarise(nUmis = n(), totReads=sum(reads)) %>%
	data.frame()

ggplot(libSizeDf, aes(x=log10(nUmis))) + geom_histogram(bins = 50)

# Barcode rank plot

barcode_rank <- rank(-libSizeDf$nUmis)
plot(barcode_rank, libSizeDf$nUmis, xlim=c(1,10000), ylab="library size")

log10_lib_size <- log10(libSizeDf$nUmis)
plot(barcode_rank, log10_lib_size, xlim=c(1,10000))
plot(log10(barcode_rank), log10_lib_size, xlim=c(1,5))

# Inflection point

# order barcode by lib size
o <- order(barcode_rank)
# order data by decreasing order of lib size:
log10_lib_size <- log10_lib_size[o]
barcode_rank <- barcode_rank[o]
# 
rawdiff <- diff(log10_lib_size)/diff(barcode_rank)
inflection <- which(rawdiff == min(rawdiff[100:length(rawdiff)], na.rm=TRUE))

plot(barcode_rank, log10_lib_size, xlim=c(1,10000))
abline(v=inflection, col="red", lwd=2)

plot(log10(barcode_rank), log10_lib_size, xlim=c(1,5))
abline(v=log10(inflection), col="red", lwd=2)

# Cellranger v1 and v2

n_cells <- 2500
# CellRanger
totals <- sort(libSizeDf$nUmis, decreasing = TRUE)
# 99th percentile of top n_cells divided by 10
thresh = totals[round(0.01*n_cells)]/10
plot(log10(totals), xlim=c(1,10000))
abline(h=log10(thresh), col="red", lwd=2)

# Testing for empty droplets.
#----------------------

# read in raw matrix 

i <- 2
sample.path <- sprintf("%s/%s/%s/outs/raw_feature_bc_matrix/", wrkDir, sampleSheet[i,"Run"], sampleSheet[i,"Run"])
sce.raw <- read10xCounts(sample.path, col.names=TRUE)
sce.raw

# DropletUtils and EmptyDrops

my.counts <- counts(sce.raw)
br.out <- barcodeRanks(my.counts)
plot(br.out$rank, br.out$total, log="xy", xlab="Rank", ylab="Total UMI count")
o <- order(br.out$rank)
lines(br.out$rank[o], br.out$fitted[o], col="red")

abline(h=metadata(br.out)$knee, col="dodgerblue", lty=2)
abline(h=metadata(br.out)$inflection, col="forestgreen", lty=2)
legend("bottomleft", lty=2, col=c("dodgerblue", "forestgreen"), 
    legend=c("knee", "inflection"))


# significance is computed by simulation so we set a seed for reproducibility
set.seed(100)
# run analysis:
# (a bit 'slow')
e.out <- emptyDrops(counts(sce.raw))
e.out

# Get summary:
summary(e.out$FDR <= 0.001)

# check outcome
table(Sig=e.out$FDR <= 0.001, Limited=e.out$Limited)

set.seed(100)
limit <- 100   
all.out <- emptyDrops(counts(sce.raw), lower=limit, test.ambient=TRUE)
hist(all.out$PValue[all.out$Total <= limit & all.out$Total > 0],
    xlab="P-value", main="", col="grey80") 

is.cell <- e.out$FDR <= 0.001
#is.cell <- e.out$FDR <= 0.01
sum(is.cell, na.rm=TRUE)

# plot
plot(e.out$Total, -e.out$LogProb, col=ifelse(is.cell, "red", "black"),
	xlab="Total UMI count", ylab="-Log Probability",
	xlim=c(1,3000),
	ylim=c(1,6000)
)

# compare cell calling by library size (knee and inflection) and by expression profile methods:
# copy emptyDrops outcome filtering out background droplets
ddtmp <- data.frame(e.out) %>% filter(!is.na(is.cell))
# label for emptyDrops:
ddtmp$is.cell <- ifelse(ddtmp$FDR <= 0.001, TRUE, FALSE)
ddtmp$dropType <- ifelse(ddtmp$is.cell, "WiCell", "WoCell")
# label for knee:
ddtmp$kneeType <- ifelse(ddtmp$Total < metadata(br.out)$knee, "kneeLo", "kneeHi")
# label for inflection:
ddtmp$infexType <- ifelse(ddtmp$Total < metadata(br.out)$inflection, "inflexLo", "inflexHi")

# check overlap of cell class:
table(ddtmp$kneeType, ddtmp$dropType)
table(ddtmp$infexType, ddtmp$dropType)

# check FDR for droplets selected with inflection but not emptyDrops:
summary(ddtmp$FDR[ddtmp$infexType=="inflexHi" & ddtmp$dropType == "WoCell"])
hist(ddtmp$FDR[ddtmp$infexType=="inflexHi" & ddtmp$dropType == "WoCell"])

p <- ggplot(ddtmp, aes(x=Total, y=-LogProb)) + geom_point()
p + facet_grid(infexType~dropType) +
	coord_cartesian(xlim = c(0, 1000), ylim = c(0, 5000))

#----------------------
# QC
#----------------------

# read in filtered matrix

i <- 2
sample.path <- sprintf("%s/%s/%s/outs/filtered_feature_bc_matrix/", wrkDir, sampleSheet[i,"Run"], sampleSheet[i,"Run"])
sce <- read10xCounts(sample.path, col.names=TRUE)
sce

# keep code working
colData(sce)$Run <- sampleSheet[i,"Run"]
colData(sce) <- colData(sce) %>%
	data.frame %>%
	left_join(sampleSheet[,splShtColToKeep], "Run") %>%
	DataFrame
sce$source_name <- factor(sce$source_name)
sce$block <- sce$source_name
sce$setName <- ifelse(grepl("ABMMC", sce$source_name), "Hca", "Caron")

# percentage of counts per gene
#----------------------
rel_expression <- t( t(counts(sce)) / Matrix::colSums(counts(sce))) * 100
rownames(rel_expression) <- rowData(sce)$Symbol
most_expressed <- sort(Matrix::rowSums( rel_expression ),T)[20:1] / ncol(sce)

boxplot( as.matrix(t(rel_expression[names(most_expressed),])),cex=.1, las=1, xlab="% total count per cell",col=scales::hue_pal()(20)[20:1],horizontal=TRUE)

# annotation
#----------------------
# to know which genes are on the mitochondrial genome 

gene.info <- rowData(sce)
# setup the biomaRt connection to Ensembl using the correct species genome (hsapiens_gene_ensembl)
ensembl <- useEnsembl(biomart='ensembl', dataset='hsapiens_gene_ensembl')
# retrieve the attributes of interest from biomaRt using the Ensembl gene ID as the key
# beware that this will only retrieve information for matching IDs
gene_symbol <- getBM(attributes=c('ensembl_gene_id', 'external_gene_name', 'chromosome_name', 'start_position', 'end_position', 'strand'),
                     filters='ensembl_gene_id', mart=ensembl,
                     values=gene.info[, 1])

# create a new data frame of the feature information
gene.merge <- merge(gene_symbol, gene.info, by.x=c('ensembl_gene_id'), by.y=c('ID'), all.y=TRUE)
rownames(gene.merge) <- gene.merge$ensembl_gene_id
# set the order for the same as the original gene information
gene.merge <- gene.merge[gene.info[, 1], ]

# reset the row data on the SCE object to contain all of this information
rowData(sce) <- gene.merge

# mitochondrial genes
is.mito <- which(rowData(sce)$chromosome_name=="MT")

# Calculate and store QC metrics
#----------------------
# for genes with addPerFeatureQC() and for cells with addPerCellQC().

# for genes
sce <- addPerFeatureQC(sce)
# colnames(rowData(sce))
head(rowData(sce)) %>%
    as.data.frame() %>%
    datatable(rownames = TRUE)

# for cells
sce <- addPerCellQC(sce, subsets=list(Mito=is.mito))
# colnames(colData(sce))
head(colData(sce)) %>%
    as.data.frame() %>%
    datatable(rownames = TRUE)

# distribution of library size - histogram
hist(log10(sce$sum), breaks=20, col="grey80", xlab="Log-total UMI count", main="")
# disribution of mito. content - histogram
hist(sce$subsets_Mito_percent, breaks=20, col="grey80", xlab="Proportion of reads in mitochondrial genes", main="")

# distribution of library size - violin
# (split by block, of which we only have one here.)
p <- plotColData(sce, x="block", y="sum",
        other_fields="setName") + #facet_wrap(~setName) + 
        scale_y_log10() + ggtitle("Total count")
p
# distribution of mito. content - violin
p <- plotColData(sce, x="block", y="subsets_Mito_percent",
        other_fields="setName") + #facet_wrap(~setName) + 
        scale_y_log10() + ggtitle("Mitocondrial percent")
p

# filter with adaptive threshold
#----------------------

# library size
qc.lib <- isOutlier(sce$sum, log=TRUE, type="lower")
table(qc.lib)
attr(qc.lib, "thresholds")

# number of genes detected
qc.nexprs <- isOutlier(sce$detected, log=TRUE, type="lower")
table(qc.nexprs)
attr(qc.nexprs, "thresholds")

# mito. content
qc.mito <- isOutlier(sce$subsets_Mito_percent, type="higher")
table(qc.mito)
attr(qc.mito, "thresholds")

# identify cells to discard:
discard <- qc.lib | qc.nexprs | qc.mito

# Summarize the number of cells removed for each reason.
DataFrame(LibSize=sum(qc.lib),
	  NExprs=sum(qc.nexprs),
	  MitoProp=sum(qc.mito),
	  Total=sum(discard))

# or all at once:
reasons <- quickPerCellQC(sce,
			  percent_subsets=c("subsets_Mito_percent"))
colSums(as.matrix(reasons))

# store reasons for discarding cells:
sce$discard <- reasons$discard

# plot mito contetn against lib size or number of genes detected
plotColData(sce, x="sum", y="subsets_Mito_percent", colour_by="discard")
