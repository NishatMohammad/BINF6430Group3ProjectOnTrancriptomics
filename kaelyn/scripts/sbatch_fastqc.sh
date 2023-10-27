#!/bin/bash
#SBATCH --job-name=bam_fastqc
#SBATCH --partition=short
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem 32G
#SBATCH -t 8:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.log
#SBATCH --error=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.err

### Environment ###
module load OpenJDK/19.0.1 # This is needed to run fastqc
module load fastqc         # Now we have access to fastqc

### VARIABLES ###
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Full path to the input file directory
INPUT_DIR=/courses/BINF6430.202410/students/long.kae/final_project/data/hisat2/bam

# Full path to the output directory.
OUTPUT_DIR=/courses/BINF6430.202410/students/long.kae/final_project/data/fastqc/sorted_bam
#mkdir -p ${OUTPUT_DIR}

fastqc --outdir=${OUTPUT_DIR} -t ${SLURM_CPUS_PER_TASK} ${INPUT_DIR}/*.sorted.bam
