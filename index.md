# CRUK Bioinformatics Summer School 2019: Functional Genomics
<img src="CRUK_CC_web.jpg" alt="CRUK Cambdridge Centre" width="200" align="right"/>.  
**15th - 19th July 2019: Craik-Marshall Room, Downing Site, University of Cambridge**

## Overview

Functional genomics looks at the dynamic aspects of how the genome functions within cells,
particularly in the form of gene expression (transcription) and gene regulation. This workshop surveys
current methods for functional genomics using high-throughput technologies. 

High-throughput technologies such as next generation sequencing (NGS) can routinely produce massive amounts of data. However, such datasets pose new challenges in the way the data have to be analyzed, annotated and interpreted which are not trivial and are daunting to the wet-lab biologist. This course covers state-of-the-art and best-practice tools for bulk RNA-seq and ChIP-seq data analysis, and will also introduce approaches for analysing data arising from single-cell RNA-seq studies.

### Audience

Enthusiastic and motivated wet-lab biologists who want to gain more of an understanding of NGS data and eventually progress to analysing their own data

### Pre-requisites

**The course will include a great deal of hands-on work in R and at the command line. In order for you to make the most of the course we <u>strongly recommend</u> that you take an introductory course, or have sufficient experience in the following areas:**

- R
- Unix
- Introductory statistics

**More specific requirements and references can be found [here](Pre-requisites.md)**   

[//]: # (**Data files for course are [here](https://www.dropbox.com/sh/s4qb83mtuxjelg7/AAB0HIXL5_NGE8r20UxjG1v5a?dl=0). There is a zip-file for each course and a sizes.txt file with zip sizes **   )

### Instructors

- [Mark Fernandes (CRUK CI)](https://www.cruk.cam.ac.uk/core-facilities/bioinformatics-core/mark-fernandes). 
- [Rory Stark (CRUK CI)](https://www.cruk.cam.ac.uk/core-facilities/bioinformatics-core/rory-stark)
- [Shamith Samarajiwa (MRC CU)](https://www.samarajiwa-lab.org/people). 
- [Dora Bihary (MRC CU)](https://www.samarajiwa-lab.org/people). 
- [Joanna Krupka (MRC CU)](https://www.samarajiwa-lab.org/people).  
- [Ashley Sawle (CRUK CI)](https://www.cruk.cam.ac.uk/core-facilities/bioinformatics-core/ash-sawle).   
- [Alistair Martin (CRUK CI)](http://www.cruk.cam.ac.uk/research-groups/caldas-group).   
- [Stephane Ballereau (CRUK CI)](https://www.cruk.cam.ac.uk/core-facilities/bioinformatics-core/stephane-ballereau).     
- [Dominique-Laurent Couturier(CRUK CI)](https://www.cruk.cam.ac.uk/core-facilities/bioinformatics-core/dominique-laurent-couturier).   



### Aims
During this course you will learn about:-

- To provide an understanding of how aligned sequencing reads, genome sequences and genomic regions are represented in R.
- To encourage confidence in reading sequencing reads into R, performing quality assessment and executing standard pipelines for (bulk) RNA-Seq, ChIP-Seq and ATAC-seq analysis 
- Analysis of transcription factor (TF) and epigenomic (histone mark) ChIP-seq data.  

### Objectives
After the course you should be able to:-

- Know what tools are available in Bioconductor for HTS analysis and understand the basic object-types that are utilised.
- Process and quality control short read sequencing data 
- Given a set of gene identifiers, find out whereabouts in the genome they are located, and vice-versa 
- Produce a list of differentially expressed genes from an RNA-Seq experiment.
- Import a set of ChIP-Seq peaks and investigate their biological context.

# Day 0 (July 14th )

**SOCIAL
18:00 - ..
Informal get-together at The Grain and Hop Store (close to accommodation in Downing College). Meet fellow attendees and some of your trainers.    
Join us for a drink and dinner (self-paying), and to meet your colleagues for the next few days
http://www.grainandhopstore-cambridge.co.uk/ 

**Note that the Training Room in Craik-Marshall building (1st Floor) will be open from 9am. 
School etherpad (E-whiteboard) is [here](https://public.etherpad-mozilla.org/p/2019-07-15-functional-genomics) **

# Day 1 (July 15th)

Breakfast at Downing College is at 8.45-9.15am.  
__C-M Training room__.  
- 09:30 [Course Introduction](Introduction/Session1-intro.html)
- 09:30 - 10:30; [Introduction to Functional Genomics](Introduction/Functional_Genomics_Overview.pdf)
- 10:30 - 12:30; [Introduction (Recap) of R and Bioconductor](Introduction/bioc-intro.nb.html)
  + [source](Introduction/bioc-intro.Rmd)
- 12:30 - 13:30; LUNCH
- 13:30 - 14:30 [Principles of Experimental Design](Introduction/Experimental_Design.pdf)
- 14:30 - 17:00;
- Data processing for Next Generation Sequencing
  + Lecture 1: [Introduction to next generation sequencing](Introduction/SS_DB/Materials/Lectures/L1_Introduction_to_Next_Generation_Sequencing_SS.pdf) (2.30- 2.45pm)
  + Lecture 2: [Brief introduction to file formats](Introduction/SS_DB/Materials/Lectures/L2_fileFormats_DB.pdf) (2.45- 3.00pm)
  + Lecture 3: [Quality control and artefact removal](Introduction/SS_DB/Materials/Lectures/L3_qualityControl_artefactRemoval_DB.pdf) (3.00- 3.45pm)
  + Practical 1: [learn to use FastQC and Cutadapt](Introduction/SS_DB/Materials/Practicals/Practical1_fastQC_DB.html) (20 min) on a sample dataset
  + Lecture 4: [Short read alignment and Quality Control](Introduction/SS_DB/Materials/Lectures/L4_Short_Read_Alignment_to_a_Reference-Genome_SS.pdf) (3.45-5.00pm)
  + Practical 2: [Alignment of a ChIP-seq dataset to a reference genome using BWA OR Bowtie2 and a RNA-seq dataset to STAR](Introduction/SS_DB/Materials/Practicals/Practical2_alignment_SS.html) (45 min)
    
# Day 2 (July 16th)

**Please note we use several Rstudio Notebook html files as material for the RNAseq course. To obtain the source code
(.Rmd file) you can simply click on the code button in the top right-hand corner).**

- 09:00 - 09:30; 
  + [Introduction to RNA-seq](RNASeq2018/html/00_Introduction_to_RNAseq_Analysis.html)
- 09:30 - 11:00; 
  + [Counting](RNASeq2018/html/01_Read_Counts_with_Subread.html)
  + [Importing and QC of RNA-seq data](RNASeq2018/html/02_Preprocessing_Data.nb.html)
- 11:00 - 12:30 Linear models & differential expression
  + [Slides](RNASeq2018/slides/LinearModels.pdf)
  + [Linear models html nb](RNASeq2018/html/03_Linear_Models.nb.html)
- 12:30 - 13:30; LUNCH
- 13:30 - 15:00; Linear models & differential expression
- 15:00 - 17:00 
  + [Differential expression analysis with DESeq2](RNASeq2018/html/04_DE_analysis_with_DESeq2.nb.html)

**SOCIAL: Punting trip - leave from Mill Lane punting site at 18:00 (~10 min walk from Craik-Marshall)**
[Google Map](https://www.google.com/maps/dir/Craik-Marshall+Building,+Cambridge/Scudamore's+Mill+Lane+Punting+Station,+Mill+Ln,+Cambridge+CB2+1RS/@52.2021771,0.1169979,17z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x47d8709788f7fb6b:0x117c3858ab077fb0!2m2!1d0.1224918!2d52.2019233!1m5!1m1!1s0x47d870a335f0f833:0xdb33dae59780b590!2m2!1d0.115892!2d52.201511!3e3). 
[Scudamore's Web-site & Mill lane map](https://www.scudamores.com/punting-mill-lane). 

# Day 3 (July 17th)

- 09:30 - 11:00; [Annotation and Visualisation of Differential Expression](RNASeq2018/html/05_Annotation_and_Visualisation.nb.html)
- 11:00 - 12:30; [Gene set analysis and Gene Ontology testing](RNASeq2018/html/06_Gene_set_testing.nb.html)

- 12:30 - 13:30; LUNCH
- 13:30 - 16:30; Prognostic Gene Signatures
1.      Prognostic Gene Signatures (RS) 13:30 -14:00
2.      Survival Analysis (DL) 14:00 – 14:30
3.      Practical: Deriving a Predictive Gene Signature from DEGs 14:30 – 15:00
4.      Issues with prognostic gene signatures (RS) 15:00 – 15:30
5.      Practical: Checking gene signatures with SigCheck 15:30 – 16:00

**SOCIAL: Summer School evening meal & Reception at the nearby Downing College at 18:00 to 22:30.. If you do not wish to attend this meal (free to attendees) then please let us know ASAP. Smart casual dress. http://www.dow.cam.ac.uk  Downing College, Regent Street, Cambridge, CB2 1DQ (Site map in link below)    
[Drinks Reception 18:00- 19:45 West Lodge    
Dinner 19:45 -22:30 Grace Howard Room](https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwiptLD_s7zcAhXEy4UKHU0CDgkQjRx6BAgBEAU&url=https%3A%2F%2Fwww.downing-conferences-cambridge.co.uk%2Fabout-us%2Fvisitor-map&psig=AOvVaw1kbZkL02AvKqsWtNfNzNTJ&ust=1532682124262374) **    

# Day 4 (July 18th)

- ChIP-seq data analysis
    + Lecture 1: [Introduction to ChIP-seq (and Peak Calling)](ChIP/Lectures/L5_Introduction_to_ChIP-seq_SS.pdf)(ChIP/Lectures/L6_Peak_Calling_SS.pdf)(9.30-10.30am)
    + Practical 1: [Peak calling with MACS2](ChIP/Practicals/Practical3_peakcalling_SS.html) (10.30-11.00am)
    + Lecture 2: [Differential binding analysis](ChIP/Lectures/L7_Differential_binding_analysis_DB.pdf) (11.00-11.30am)
    + Practical 2: [THOR (and Diffbind)](ChIP/Practicals/Practical4_differentialBinding_DB.html) (11.30-12.00pm)
    + Lecture 3: [Quality control methods for ChIP-seq](ChIP/Lectures/L8_Quality_control_methods_for_ChIP-seq_DB.pdf) (12.00-12.30pm)
  
   
    LUNCH (12.30-1.30pm)
     + Practical 4: [Integrative Genome Viewer](ChIP/Practicals/Practical6_IGV_DB.html) (1.30-2.00 min)
    + Lecture 4: [Downstream analysis of ChIP-seq](ChIP/Lectures/L9_Downstream_Analysis_of_ChIP-seq_data_SS.pdf) (2.00-2.30pm)
    + Practical 5: [Downstream analysis of ChIP-seq](ChIP/Practicals/Practical7_Downstream_Analysis_of_ChIP-seq_SS.html) (2.30-3.15pm)
    + Lecture 5: [Introduction to (epi)Genomic data integration](3.15-3.45pm)
    + Practical 6: [Data Integration for Genomics (TF direct targets & chromatin modifications)](ChIP/Practicals/Practical8_Rcade_SS.pdf) (3.45-5.00 min)
 

# Day 5 (July 19th)

- 09:30 - 12:30; **A room in C-M building will be available for storing your baggage (There will be signage)
- Chromatin Accessibility
  + Lecture 1 [Chromatin accessibility and nucleosome occupancy with ATAC-seq](ChIP/Lectures/L11_Introduction_to_ATAC-seq_SS.pdf) (9.30-10.00am)
  + Practical 1: [ATAC-seq analysis](ChIP/Practicals/Practical10_ATAC-seq_analysis_SS.html) (10.00-11.00am)
  + Lecture 2: [Useful software utilities for the analysis of genomic data](ChIP/Lectures/L10_Software_utilities_for_computational_genomics_SS.pdf) (11.00-11.30am)
  + Practical 2: [Useful software utilities for the analysis of genomic data](ChIP/Practicals/Practical9_Useful_software_utilities_for_the_analysis_of_genomic_data_SS.html) (11.30-12.30pm)


- 12:30 - 13:30; LUNCH
- Some of you may now be going to the [CRUK Cambridge Centre Graduate Symposium](https://www.crukccgraduatesymposium.com/) Hope you enjoy it!    
- Have a safe Journey home (Thank you for participating in the Summer School)
## Please don't forget to fill in the [survey]( https://www.surveymonkey.co.uk/r/SummerSchl)   

<!--
## Data
- Mouse mammary data (counts): [https://figshare.com/s/1d788fd384d33e913a2a](https://figshare.com/s/1d788fd384d33e913a2a)
-->
