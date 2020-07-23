library(tidyverse)
library(DESeq2)

load("RNAseq/Robjects/preprocessing.RData")
ls()
dim(countdata)
sampleinfo

design <- as.formula(~ Status)

modelMatrix <- model.matrix(design, data = sampleinfo)
modelMatrix

sampleinfo$Status <- factor(sampleinfo$Status, levels = c("virgin","pregnant","lactate"))
modelMatrix <- model.matrix(design, data = sampleinfo)
modelMatrix

# build deseq2 object

ddsObj.raw <- DESeqDataSetFromMatrix(countData = countdata,
                                     colData = sampleinfo,
                                     design = design)
# size factors

ddsObj <- estimateSizeFactors(ddsObj.raw)
colData(ddsObj.raw)
colData(ddsObj)

logcounts <- log2(countdata + 1)
limma::plotMA(logcounts)
abline(h=0, col="red")

normalisedCounts <- counts(ddsObj, normalized = TRUE)
logNormalisedCounts <- log2(normalisedCounts + 1)

limma::plotMA(logNormalisedCounts)
abline(h=0, col="red")

# dispersion estimates

ddsObj <- estimateDispersions(ddsObj)
plotDispEsts(ddsObj)

# GLM and Wald test
ddsObj <- nbinomWaldTest(ddsObj)

# DESeq cmd
ddsObj <- DESeq(ddsObj.raw)

# getting results

res <- results(ddsObj, alpha = 0.05)
res

modelMatrix
resLvV <- res
rm(res)

resultsNames(ddsObj)
resPvV <- results(ddsObj, alpha = 0.05, name = "Status_pregnant_vs_virgin")
resPvV

sum(resPvV$padj < 0.05, na.rm = TRUE)

topGenePvV <- as.data.frame(resPvV) %>%
  rownames_to_column("GeneID") %>%
  arrange(padj) %>%
  head(100)

# Exercise 1

design <- as.formula(~ CellType + Status)
ddsObj.raw <- DESeqDataSetFromMatrix(countData = countdata,
                                     colData = sampleinfo,
                                     design = design)
ddsObj <- DESeq(ddsObj.raw)
resLvV <- results(ddsObj, alpha = 0.05)
resLvV

resultsNames(ddsObj)
resLvB <- results(ddsObj, alpha = 0.05, name = "CellType_luminal_vs_basal")
resLvB

sum(resLvB$padj < 0.05 & resLvB$log2FoldChange > 0, na.rm = TRUE)

resPvL <- results(ddsObj, alpha = 0.05, 
                  contrast = c("Status", "pregnant", "lactate"))
resPvL

#More complex models

vstcounts <- vst(ddsObj.raw, blind = TRUE)
plotPCA(vstcounts, intgroup = c("Status", "CellType"))

design.reduced <- as.formula(~ CellType)
ddsObj_C <- DESeq(ddsObj, test = "LRT", reduced = design.reduced)

resCvCS <- results(ddsObj_C, alpha = 0.05)
resCvCS

sum(resCvCS$padj < 0.05, na.rm = TRUE)

#Exercise 2

design <- as.formula(~ CellType * Status)
ddsObj2.raw <- DESeqDataSetFromMatrix(countData = countdata,
                                      colData = sampleinfo,
                                      design = design)
design.reduced <- as.formula(~ CellType + Status)
ddsObj_C <- DESeq(ddsObj2.raw, test = "LRT", reduced = design.reduced)
resCSvCxS <- results(ddsObj_C, alpha = 0.05)
table(resCSvCxS$padj < 0.05)

