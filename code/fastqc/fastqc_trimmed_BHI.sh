#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J fastqc_BHI_trim
#SBATCH --output=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.out
#SBATCH --error=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.err

module load FastQC

cd /home/padi4950/uppmax/efaecium_E745

fastqc \
data/trimmed_data/RNA_BHI/*_paired.fq.gz \
--outdir /home/padi4950/uppmax/efaecium_E745/results/fastqc_trimmed/RNA/trimmed_BHI
