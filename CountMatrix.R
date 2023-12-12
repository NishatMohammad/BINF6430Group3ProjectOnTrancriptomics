# Read the featureCounts output file
FeatureCountsData <- read.table("/scratch/mohammad.ni/BINF6430/Projectwork/FeatureCounts2/FeatureCounts2.tsv", header = TRUE, sep = "\t")

# Extract the specified columns
SelectedData <- FeatureCountsData[, c(1, 7:16)]

# Read the list of sample names
SampleNames <- readLines("/scratch/mohammad.ni/BINF6430/Projectwork/FCFileNames.txt")

# Ensure correct number of sample names in "SampleNames"
if (length(SampleNames) != 10) {
  stop("The number of sample names in 'FCFileNames.txt' does not match the expected count (10).")
}

# Rename the columns
colnames(SelectedData) <- c("Geneid", SampleNames)

# Create a data frame
Finaldf <- as.data.frame(SelectedData)
head(Finaldf)
write.table(Finaldf, "/scratch/mohammad.ni/BINF6430/Projectwork/CountMatrix.tsv", sep = "\t", quote = FALSE, row.names = FALSE)

