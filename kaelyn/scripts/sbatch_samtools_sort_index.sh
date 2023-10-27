#!/bin/bash
#SBATCH --job-name=samtools_sort_index
#SBATCH --partition=short
#SBATCH -N 1 
#SBATCH -c 16
#SBATCH --mem 36G
#SBATCH -t 8:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.log
#SBATCH --error=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.err

# Setup environment
module load miniconda3/23.5.2
source activate binf6430
module load samtools/1.10

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Setup environment variables
BASE_DIR=/courses/BINF6430.202410/students/long.kae/final_project
BAM_DIR=${BASE_DIR}/data/hisat2/bam

cd ${BAM_DIR}

# Convert .sam to .sorted.bam
for FILE in ${BAM_DIR}/*
do
    FNAME=$(basename ${FILE} .sam)
    samtools sort ${FILE} > ${FNAME}.sorted.bam --threads 16
    samtools index ${FNAME}.sorted.bam -@ 16
done
