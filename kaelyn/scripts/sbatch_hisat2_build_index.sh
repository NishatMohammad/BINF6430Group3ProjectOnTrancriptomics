#!/bin/bash
#SBATCH --job-name=hisat2_build_index
#SBATCH --partition=short
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
REF_DIR=${BASE_DIR}/data/mus_reference/ncbi_dataset/data/GCF_000001635.27
GENOME_DIR=${BASE_DIR}/data/hisat2
mkdir -p ${GENOME_DIR}

cd ${GENOME_DIR}

# Build index
hisat2-build \
   -p 16 \
   --exon ${REF_DIR}/genome.exon \
   --ss ${REF_DIR}/genome.ss \
   ${REF_DIR}/genome.fa \
   mus_musculus_index
