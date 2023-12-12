# Usage DeSeq2.R

# Load package
library(DESeq2)

# Read the count matrix from the file
CountMatrix <- read.table("/scratch/mohammad.ni/BINF6430/Projectwork/CountMatrix.tsv", header = TRUE, row.names = 1, sep = "\t")


# Create a factor for treatment groups
SampleNames <- colnames(CountMatrix)

TreatmentFactor <- factor(
  ifelse(grepl("doxo", SampleNames), "DoxorubicinTreated", "control")
)
TreatmentFactor

# Create a factor for biological groups (null, het, wt) regardless of treatment
BioFactor <- factor(
  ifelse(grepl("null", SampleNames), "Homozygous",
         ifelse(grepl("het", SampleNames), "Heterozygous",
                ifelse(grepl("wt", SampleNames), "WildType", "Other"))
  )
)
BioFactor

#Create a NotWT factor
NotWTFactor <- factor(ifelse(grepl("wt", SampleNames), "WildType", "Other"))
NotWTFactor


# Create a colData2 object with sample names and the 'treatment_factor',  'biological_group_factor', and NotWT
colData2 <- data.frame(sampleName = SampleNames,
                       Treatment = TreatmentFactor,
                       BioGroup = BioFactor,
                       NotWT = NotWTFactor)
colData2

# Design formula
design <- ~ Treatment + BioGroup
# Create DESeqDataSet object for all samples
ddsAll <- DESeqDataSetFromMatrix(countData = CountMatrix, colData = colData2, design = design )
ddsAll <- DESeq(ddsAll)
AllGrpsResults <- results(ddsAll)
AllGrpsResults
SortedAllGrpRes <- AllGrpsResults[order(AllGrpsResults$pvalue, decreasing = TRUE), ]
SortedAllGrpRes
AllGenes <- as.data.frame(SortedAllGrpRes)
write.table(AllGenes, "/scratch/mohammad.ni/BINF6430/Projectwork/results/Deseq2Results/Deseq2AllGenes.tsv", sep = "\t", quote = FALSE, row.names = FALSE)


# Create DESeqDataSet object for treatment samples
dds <- DESeqDataSetFromMatrix(countData = CountMatrix, colData = colData2, design = ~Treatment)
dds <- DESeq(dds)
RxResults <- results(dds)
RxResults
SortedRxRes <- RxResults[order(RxResults$pvalue, decreasing = TRUE), ]
SortedRxRes
RxGenes <- as.data.frame(SortedRxRes)
write.table(RxGenes, "/scratch/mohammad.ni/BINF6430/Projectwork/results/Deseq2Results/Deseq2RxGenes.tsv", sep = "\t", quote = FALSE, row.names = FALSE)


# Create DESeqDataSet object for Biological groups samples
dds2 <- DESeqDataSetFromMatrix(countData = CountMatrix, colData = colData2, design = ~BioGroup)
dds2 <- DESeq(dds2)
BioGrpResults <- results(dds2)
BioGrpResults
SortedBioGrpRes <- BioGrpResults[order(BioGrpResults$pvalue, decreasing = TRUE), ]
SortedBioGrpRes
BioGrpGenes <- as.data.frame(SortedBioGrpRes)
write.table(BioGrpGenes, "/scratch/mohammad.ni/BINF6430/Projectwork/results/Deseq2Results/Deseq2BioGrpGenes.tsv", sep = "\t", quote = FALSE, row.names = FALSE)


# Create DESeqDataSet object for Biological Groups focusing on WT vs Homozygous samples
ddsCol2 <- DESeqDataSetFromMatrix(countData = CountMatrix, colData = colData2, design = ~BioGroup)
ddsCol2 <- DESeq(ddsCol2)
BioGrpCol2WtHomoResults <- results(ddsCol2, contrast=c("BioGroup","WildType","Homozygous"))
BioGrpCol2WtHomoResults
BioGrpCol2WtHomoRes <- BioGrpCol2WtHomoResults[order(BioGrpCol2WtHomoResults$pvalue, decreasing = TRUE), ]
BioGrpCol2WtHomoRes
WTHomoGenes <- as.data.frame(BioGrpCol2WtHomoRes)
WTHomoGenes
write.table(WTHomoGenes, "/scratch/mohammad.ni/BINF6430/Projectwork/results/Deseq2Results/Deseq2WTHomoGenes.tsv", sep = "\t", quote = FALSE, row.names = FALSE)

# For WT vs Homo and Het
ddsCol3 <- DESeqDataSetFromMatrix(countData = CountMatrix, colData = colData2, design = ~NotWT)
#view(colData2)
ddsCol3 <- DESeq(ddsCol3)
BioGrpCol2WtAllResults <- results(ddsCol3, contrast=c("NotWT","Other","WildType"))
BioGrpCol2WtAllResults
BioGrpCol2WtAllRes <- BioGrpCol2WtAllResults[order(BioGrpCol2WtAllResults$pvalue, decreasing = TRUE), ]
BioGrpCol2WtAllRes
WtOtherGenes <- as.data.frame(BioGrpCol2WtAllRes)
WtOtherGenes
write.table(WtOtherGenes, "/scratch/mohammad.ni/BINF6430/Projectwork/results/Deseq2Results/Deseq2WtOtherGenes.tsv", sep = "\t", quote = FALSE, row.names = FALSE)




