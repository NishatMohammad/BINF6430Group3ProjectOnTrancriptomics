# BINF 6430 Group 3 Project On Trancriptomics
# Transcriptomics Analysis for Sall2 Knock Out Genetically Engineered Mice
## Overview

This README document provides an overview of the transcriptomics analysis performed for the knocked-out gene in mice. The purpose of this analysis is to understand the gene's impact on the transcriptome and identify differentially expressed genes, pathways, and potential regulatory mechanisms in response to the gene knockout.


## Analysis Pipeline

1. Data Preprocessing
    Raw RNASeq fastq files were retrieved from GSE123168 data set.

    Raw RNA-seq data was quality-checked using FastQC and MultiQC.

    Reads were aligned to the mouse reference genome mm10 using HISAT2.

    HISAT output was sorted with SamTools sort, Indexed with SamTools Index

    Read counts were quantified using featurecounts

    R was used to make the Counts Matrix


3. Differential Expression Analysis
   
    Differential expression analysis was performed using DESeq2.

    The analysis compared knockout mice samples with control samples to identify upregulated and downregulated genes.

    Statistical significance was determined based on  DESeq2, with a predefined threshold adjusted p-value < 0.05.


4. Functional Enrichment Analysis

    Gene ontology (GO) and pathway enrichment analyses were carried out using KEGG Orthology, GSEA leveraging R Markdown to determine the biological functions and pathways associated with differentially expressed genes.

6. Visualization

    Results were visualized using various R packages in R Markdown to provide clear and interpretable graphics for data exploration and presentation.


## Results
The analysis identified a set of differentially expressed genes and revealed significant changes in specific biological processes and pathways. The results of this analysis will contribute to a deeper understanding of the gene's role in mouse physiology and potential implications in disease or other biological contexts. We noted Cdkn1a suppresion in Sall2 KO mice data through our transcritptomic analysis


## Usage
Researchers interested in replicating or extending this analysis should follow the provided pipeline and tools, ensuring compatibility with their specific RNA-seq data and gene knockout model. Detailed scripts, parameters, and specific tool versions used in the analysis are available in the provided documentation.


## Authors
Nishat Mohammad

Kaelyn Long

Dakota Jones 


## Contributors

Marcus Sherman BINF6430 Instructor Northeastern University


## References

Farkas, C., Fuentes-Villalobos, F., Rebolledo-Jaramillo, B. et al. Streamlined computational pipeline for genetic background characterization of genetically engineered mice based on next generation sequencing data. BMC Genomics 20, 131 (2019). https://doi.org/10.1186/s12864-019-5504-9

For any questions or further information, please contact Dr. Nishat Mohammad via email at mohammad.ni@northeastern.edu or dcnishat@gmail.com
