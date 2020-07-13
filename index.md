# CRUK Bioinformatics Summer School 2020: Functional Genomics
<img src="CRUK_CC_web.jpg" alt="CRUK Cambdridge Centre" width="200" align="right"/>.  
**22nd - 28th July 2020: Zoom virtual school, University of Cambridge**

Site short-cut: https://tinyurl.com/crukss2020

## Overview

Functional genomics looks at the dynamic aspects of how the genome functions within cells,
particularly in the form of gene expression (transcription) and gene regulation. This workshop surveys
current methods for functional genomics using high-throughput technologies. 

High-throughput technologies such as next generation sequencing (NGS) can routinely produce massive amounts of data. However, such datasets pose new challenges in the way the data have to be analyzed, annotated and interpreted which are not trivial and are daunting to the wet-lab biologist. This course covers state-of-the-art and best-practice tools for bulk RNA-seq and ChIP-seq data analysis, and will also introduce approaches in prognostic gene signatures.

**[Outline timetable here](timetable.md)**.   

### Audience

Enthusiastic and motivated wet-lab biologists who want to gain more of an understanding of NGS data and eventually progress to analysing their own data

### Pre-requisites

**The course will include a great deal of hands-on work in R and at the command line. In order for you to make the most of the course we <u>strongly recommend</u> that you take an introductory course, or have sufficient experience in the following areas:**

- R
- Unix
- Introductory statistics

**More specific requirements and references can be found [here](Pre-requisites.md)**   

 # (**Data files for course are [here](https://www.dropbox.com/sh/l1qhs5tqwdxe81w/AAA2KGKXuMAPUwW1a9DGMS5la?dl=0). There is a zip-file for each course and a sizes.txt file with zip sizes **   )

### Instructors & helpers

- [Mark Fernandes (CRUK CI)](https://www.cruk.cam.ac.uk/author/mark-fernandes). 
- [Rory Stark (CRUK CI)](https://www.cruk.cam.ac.uk/author/rory-stark).  
- [Shoko Hirosue (MRC CU)](https://www.samarajiwa-lab.org/shokohirosue). 
- [Joanna Krupka (MRC CU)](https://www.samarajiwa-lab.org/joannakrupka).  
- [Ashley Sawle (CRUK CI)](https://www.cruk.cam.ac.uk/author/ashley-sawle).  
- [Abigail Edwards (CRUK CI](https://www.cruk.cam.ac.uk/author/abigail-edwards).  
- [Stephane Ballereau (CRUK CI)](https://www.cruk.cam.ac.uk/author/stephane-ballereau).     
- [Dominique-Laurent Couturier(CRUK CI)](https://www.cruk.cam.ac.uk/author/dominique-laurent-couturier).   
- [Zeynep Kalender Atak(CRUK CI)](http://www.miller-lab.org/cv_zka.html).  
- [Chandra Sekhar Reddy Chilamakuri]().  
- [Gordon Brown]().  

### Support

Craik-Marshall team.  
- Alexia   
- Cathy.  
- Paul.  
CRUK Cambridge Centre.  
- Louisa   
- Justin   



### Aims
During this course you will learn about:-

- How aligned sequencing reads, genome sequences and genomic regions are represented in R.
- How to handle NGS data and read sequencing data with R, perform quality assessment and execute standard pipelines for (bulk) RNA-Seq, ChIP-Seq and ATAC-seq analysis
- How to do downstream analysis of transcription factor (TF) and epigenomic (histone mark) ChIP-seq data.  

### Objectives
After the course you should be able to:-

- Know what tools are available in Bioconductor for HTS analysis and understand the basic object-types that are utilised.
- Process and quality control short read sequencing data 
- Given a set of gene identifiers, find out whereabouts in the genome they are located, and vice-versa 
- Produce a list of differentially expressed genes from an RNA-Seq experiment.
- Import a set of ChIP-Seq or ATAC-seq peaks and investigate their biological context.

# Day 0 (July 21st )

**SOCIAL
18:00 - ..
Informal get-together on Zoom with optional pub-quiz. Meet fellow attendees and some of your trainers.    

School etherpad (E-whiteboard) is [here](https://public.etherpad-mozilla.org/p/2019-07-15-functional-genomics) **

# Day 1 (July 22nd)

__Zoom Virtual Training room__.  
- 09:30 [Course Introduction](Introduction/Session1-intro.html)
- 09:30 - 10:30; [Introduction to Functional Genomics](Introduction/Functional_Genomics_Overview.pdf)
- 10:30 - 12:30; [Introduction to Bioconductor](Introduction/bioc-intro.html).  
- [Bioconductor answers](Introduction/bioc-intro.solutions.html).  
  + [source](Introduction/bioc-intro.Rmd)
  + [Source with solutions](Introduction/bioc-intro.solutions.Rmd).  
  
- 12:30 - 13:30; LUNCH
- 13:30 - 14:30 [Principles of Experimental Design](Introduction/Experimental_Design.pdf)
- 14:30 - 17:00;
- Data processing for Next Generation Sequencing
  + Lecture 1: [Introduction to next generation sequencing](Introduction/SS_DB/Materials/Lectures/L1-Introduction_to_NGS_JK.pdf) (2.30- 2.45pm)
  + Lecture 2: [Brief introduction to file formats](Introduction/SS_DB/Materials/Lectures/L2_fileFormats_DB.pdf) (2.45- 3.00pm)
  + Lecture 3: [Quality control and artefact removal](Introduction/SS_DB/Materials/Lectures/L3_qualityControl_artefactRemoval_DB.pdf) (3.00- 3.45pm)
  + Practical 1: [learn to use FastQC and Cutadapt](Introduction/SS_DB/Materials/Practicals/Practical1_fastQC_DB.html) (20 min) on a sample dataset
  + Lecture 4: [Short read alignment and Quality Control](Introduction/SS_DB/Materials/Lectures/L4-shortread_Alignment_JK.pdf) (3.45-5.00pm)
  + Practical 2: [Alignment of a ChIP-seq dataset to a reference genome using BWA OR Bowtie2 and a RNA-seq dataset to STAR](Introduction/SS_DB/Materials/Practicals/Practical2_alignment_JK.html) (45 min)
 **July 22nd - 28th 2020**
# Day 1

- 09:00 - 09:40; Welcome & Introduction to Functional Genomics (Mark & Rory?)
- 09:40 - 10:15; Introduction (Recap) of R (Mark?)
- 10:15 - 12:30; Data Processing for Next Generation Sequencing (Joanna & Shoko)
    + Introduction to next generation sequencing ()
    + A brief Introduction to genomic file formats ()
    + Quality control and artefact removal ()
    + Practical - Learn to use FastQC and Cutadapt on a sample dataset
    + Short Read alignment and quality control ()
    + Practical - Alignment to reference genomes using BWA and STAR
    
- 12:30 - 13:30; LUNCH BREAK

- 13:30 - 17:00; Bulk RNAseq (Ash, Abi & Dom?) 
    
<hr>
 
# Day 2 (July 23rd)

- 09:30 - 10:00; 
  + [Introduction to RNA-seq](RNAseq/html/00_Introduction_to_RNAseq_Analysis_in_R.html)
- 10:00 - 11:30; 
  + [Counting](RNAseq/html/01_Read_Counts_with_Subread.html)
  + [Importing and QC of RNA-seq data](RNAseq/html/02_Preprocessing_Data.html)
    + [Challenge Solutions](RNAseq/Course_Materials/solutions/02_Preprocessing_Data.Solutions.html)
  + [Supplementary Material: Obtaining raw reads from SRA](RNAseq/Supplementary_Materials/S1_Getting_raw_reads_from_SRA.html)
- 11:30 - 12:30 Linear models & differential expression
  + [Slides](RNAseq/html/03-Statistical_Models.pdf)
  + [Annotated Slides](RNAseq/html/03-Statistical_Models_Annotated.pdf)  
  + [Linear models html nb](RNAseq/Course_Materials/03-Statistical_Models.Rmd)
- 12:30 - 13:30; LUNCH
- 13.30 - 15:00; Linear models & differential expression (cont)
- 15:00 - 17:30 
  + [Differential expression analysis with DESeq2](RNAseq/html/04_DE_analysis_with_DESeq2.html)
    + [Challenge Solutions](RNAseq/Course_Materials/solutions/04_DE_analysis.Solutions.html)

# Day 2

- 09:30 - 17:00; Bulk RNAseq (Ash, Abi & Stephane)
- 12:30 - 13:30; LUNCH
<hr>

# Day 3 (July 24th)

- 09:30 - 11:00; 
  + [Annotation and Visualisation of Differential Expression](RNAseq/html/05_Annotation_and_Visualisation.html)
    + [Challenge Solutions](RNAseq/Course_Materials/solutions/05_Annotation_and_Visualisation.Solutions.html)
  + [Supplementary Material: Further visualistations](RNAseq/Supplementary_Materials/S3_Annotation_and_Visualisation.nb.html)
- 11:00 - 12:30; 
  + [Gene set analysis and Gene Ontology testing](RNAseq/html/06_Gene_set_testing.html)
    + [Challenge Solutions](RNAseq/Course_Materials/solutions/06_Gene_set_testing.Solutions.html)

- 12:30 - 13:30; LUNCH
- 13:30 -14:00; 


**SOCIAL: Zoom Talk: "Perspectives in AI for Cancer Bioinformatics by Rory Stark". **     

# Day 3

- 09:30 - 11:00; Bulk RNAseq (cont.) (Ash & Abi)
- 12:30 - 13:30; LUNCH BREAK
- 13:30 - 17:00; Single Cell RNAseq (Stephane & Zeynep)

<hr>
# Weekend - recharge your batteries!

# Day 4 (July 27th)

- ChIP-seq data analysis
    + Lecture 1a: [Introduction to ChIP-seq](ChIPSeq/Materials/Lectures/Day4/L1.1_Introduction_to_ChIP-seq_SS.pdf) (9.30-9.45am)
    + Lecture 1b: [Introduction to Peak Calling](ChIPSeq/Materials/Lectures/Day4/L1.2_Peak_Calling_SS.pdf) (9.45-10.30am)
    + Practical 1: [Peak calling with MACS2](ChIPSeq/Materials/Practicals/Day4/Practical1_PeakCalling_SS.html) (10.30-11.00am)
    + Lecture 2: [Differential binding analysis](ChIPSeq/Materials/Lectures/Day4/L2_Differential_Binding_Analysis_DB.pdf) (11.00-11.30am)
    + Practical 2: [THOR (and Diffbind)](ChIPSeq/Materials/Practicals/Day4/Practical2_diffbind_practical_DB.html) (11.30-12.00pm)
    + Lecture 3: [Quality control methods for ChIP-seq](ChIPSeq/Materials/Lectures/Day4/L3_Quality_Control_Methods_for_ChIPseq_DB.pdf) (12.00-12.30pm)
  
   
    LUNCH (12.30-1.30pm)
    + Practical 3: [Integrative Genome Viewer](ChIPSeq/Materials/Practicals/Day4/Practical3_IGV_practical_DB.html) (1.30-2.00 min)
    + Lecture 4: [Downstream analysis of ChIP-seq](ChIPSeq/Materials/Lectures/Day4/L4_Downstream_Analysis_of_ChIPseq_SS.pdf) (2.00-2.30pm)
    + Practical 4: [Downstream analysis of ChIP-seq](ChIPSeq/Materials/Practicals/Day4/Practical4_Downstream_Analysis_of_ChIP-seq_SS.html) (2.30-3.15pm)
    + Lecture 5: [Introduction to (epi)Genomic data integration](ChIPSeq/Materials/Lectures/Day4/L5_Introduction_to_Genomic_data_integration_SS.pdf)(3.15-3.45pm)
    + Practical 5: [Data Integration for Genomics (TF direct targets & chromatin modifications)](ChIPSeq/Materials/Practicals/Day4/Practical5a_Rcade_SS.pdf) (3.45-5.00 min)
 
# Day 4

- 09:30 - 17:00; Single Cell RNAseq (cont.) (Stephane & Zeynep)
- 12:30 - 13:30; LUNCH BREAK
<hr>
# Day 5 (July 28th)

- 09:30 - 12:30; 
- Chromatin Accessibility
  + Lecture 1 [Chromatin accessibility and nucleosome occupancy with ATAC-seq](ChIPSeq/Materials/Lectures/Day5/L1_Introduction_to_ATAC-seq _SS.pdf) (9.30-10.00am)
  + Practical 1: [ATAC-seq analysis](ChIPSeq/Materials/Practicals/Day5/Practical01_ATAC-seq_analysis_SS.html) (10.00-11.00am)
  + Lecture 2: [Useful software utilities for the analysis of genomic data](ChIPSeq/Materials/Lectures/Day5/L2_Software_utilities_for_computational_genomics_SS.pdf) (11.00-11.30am)
  + Practical 2: [Useful software utilities for the analysis of genomic data](ChIPSeq/Materials/Practicals/Day5/Practical2_Useful_software_utilities_for_the_analysis_of_genomic_data_SS.html) (11.30-12.30pm)


- 12:30 - 13:30; LUNCH
- Some of you may now be going to the [CRUK Cambridge Centre Graduate Symposium](https://www.crukccgraduatesymposium.com/) Hope you enjoy it!    
- Have a safe Journey home (Thank you for participating in the Summer School).  
<img src="http://38.media.tumblr.com/tumblr_m9t31sX4ER1qgcra2o1_500.gif" width="100" align="left"/><img src="http://38.media.tumblr.com/tumblr_m9t31sX4ER1qgcra2o1_500.gif" width="100" align="right"/>
## Please don't forget to fill in the [survey]( https://www.surveymonkey.co.uk/r/SumSch2019)   


# Day 5 

- 09:30 - 17:00; ChIPseq (Joanna & Shoko)
- 12:30 - 13:30; LUNCH BREAK

<hr>

<!--
## Data
- Mouse mammary data (counts): [https://figshare.com/s/1d788fd384d33e913a2a](https://figshare.com/s/1d788fd384d33e913a2a)
-->
