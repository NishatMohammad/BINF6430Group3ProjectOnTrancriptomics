#!/bin/bash
#SBATCH --job-name=hisat2_align
#SBATCH --partition=courses
#SBATCH -N 1 
#SBATCH -c 16
#SBATCH --mem 180G
#SBATCH -t 10:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.log
#SBATCH --error=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.err

# Setup environment
module load miniconda3/23.5.2
source activate binf6430
module load hisat2/2.2.0

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Setup environment variables
BASE_DIR=/courses/BINF6430.202410/students/long.kae/final_project
DATA_DIR=${BASE_DIR}/data/GSE123168/merged
GENOME_DIR=${BASE_DIR}/data/hisat2/mus_index

OUTPUT_DIR=${BASE_DIR}/data/hisat2/bam
mkdir -p ${OUTPUT_DIR}

# Align all samples with HISAT2
for FILE in ${DATA_DIR}/*
do
    FNAME=$(basename ${FILE} .fastq.gz)
    hisat2 \
        -x ${GENOME_DIR}/mus_musculus_index \
        -U ${FILE} \
        -S ${OUTPUT_DIR}/${FNAME}.sam \
        -p 16 \
        -t
done
