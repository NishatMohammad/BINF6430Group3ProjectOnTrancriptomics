#!/bin/bash
#SBATCH --job-name=sbatch_prefetch
#SBATCH --partition=short
#SBATCH -N 1 
#SBATCH -c 16
#SBATCH --mem 64G
#SBATCH -t 8:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=/scratch/long.kae/6430_SRA/logs/%x_%j.log
#SBATCH --error=/scratch/long.kae/6430_SRA/logs/%x_%j.err

prefetch -O PRJNA507759/ --option-file alist.txt
