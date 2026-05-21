#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_raw_BHI
#SBATCH -o /home/padi4950/uppmax/efaecium_E745/logs/fastqc_raw_BHI.out
#SBATCH -e /home/padi4950/uppmax/efaecium_E745/logs/fastqc_raw_BHI.err

module load FastQC

fastqc \
/home/padi4950/uppmax/efaecium_E745/data/raw_data/RNA_BHI/*.fastq.gz \
-o /home/padi4950/uppmax/efaecium_E745/results/fastqc/RNA/RNA_BHI
