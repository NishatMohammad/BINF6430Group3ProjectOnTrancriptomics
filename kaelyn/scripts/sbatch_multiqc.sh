#!/bin/bash
#SBATCH --job-name=bam_multiqc
#SBATCH --partition=short
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem 32G
#SBATCH -t 4:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.log
#SBATCH --error=/courses/BINF6430.202410/students/long.kae/final_project/logs/%x_%j.err

#### Environment ###
module load miniconda3/23.5.2
source activate
conda activate binf6430

### Variables ###
OUTPUT_DIR=/courses/BINF6430.202410/students/long.kae/final_project/results/bam_multiqc
mkdir -p ${OUTPUT_DIR}
INPUT_DIR=/courses/BINF6430.202410/students/long.kae/final_project/data/fastqc/sorted_bam

# multiqc
multiqc -o ${OUTPUT_DIR} ${INPUT_DIR}
