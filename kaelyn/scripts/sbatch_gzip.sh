#!/bin/bash
#SBATCH --job-name=sbatch_gzip
#SBATCH --partition=short
#SBATCH -N 1 
#SBATCH -c 16
#SBATCH --mem 64G
#SBATCH -t 8:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=.gzip.log
#SBATCH --error=.gzip.err

gzip *.fastq
