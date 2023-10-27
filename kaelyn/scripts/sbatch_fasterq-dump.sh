#!/bin/bash
#SBATCH --job-name=sbatch_fasterq-dump
#SBATCH --partition=short
#SBATCH -N 1 
#SBATCH -c 16
#SBATCH --mem 64G
#SBATCH -t 8:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=long.kae@northeastern.edu
#SBATCH --out=/scratch/long.kae/6430_SRA/logs/%x_%j.log
#SBATCH --error=/scratch/long.kae/6430_SRA/logs/%x_%j.err

ALIST=/scratch/long.kae/6430_SRA/alist.txt
SRADIR=/scratch/long.kae/6430_SRA/PRJNA507759
OUTDIR=/courses/BINF6430.202410/students/long.kae/final_project/data/GSE123168

cd ${SRADIR}
cat ${ALIST} | xargs fasterq-dump --outdir ${OUTDIR} | gzip
