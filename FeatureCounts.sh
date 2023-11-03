#!/usr/bin/env/ bash

#Usage: FeatureCount.sh

echo "Loading Environment"
module load miniconda3/23.5.2
source activate binf6430
#conda install -c bioconda subread


# Define Dirs and files
InputDir=/scratch/mohammad.ni/BINF6430/Projectwork/hisat2/bam/
OutputDir=/scratch/mohammad.ni/BINF6430/Projectwork/FeatureCounts/
mkdir -p "$OutputDir"
AnnotationFile=/scratch/mohammad.ni/BINF6430/Projectwork/data/ncbi_dataset/data/GCF_000001635.27/genomic.gtf


for file in "$InputDir"*.bam
do
    # Extract the sample name from the BAM file
    SampleName=$(basename "$file" .bam)
    echo " $SampleName "

    # Run FeatureCounts for read counting
    featureCounts -a "$AnnotationFile" -o "$OutputDir$SampleName.counts.txt" "$file"

    echo "FeatureCounts completed for $SampleName"
done

echo "All FeatureCounts are complete"

