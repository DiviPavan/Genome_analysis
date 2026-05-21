#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH -J trim_Serum
#SBATCH --output=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.out
#SBATCH --error=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.err

module load Trimmomatic

cd /home/padi4950/uppmax/efaecium_E745

ADAPTER="/sw/generic/pixi-envs/shovill-1.4.2/.pixi/envs/default/share/trimmomatic-0.40-0/adapters/TruSeq3-PE.fa"

sample=$1

trimmomatic PE -threads 2 \
data/raw_data/RNA_Serum/${sample}_1.fastq.gz \
data/raw_data/RNA_Serum/${sample}_2.fastq.gz \
data/trimmed_data/RNA_Serum/${sample}_1_paired.fq.gz \
data/trimmed_data/RNA_Serum/${sample}_1_unpaired.fq.gz \
data/trimmed_data/RNA_Serum/${sample}_2_paired.fq.gz \
data/trimmed_data/RNA_Serum/${sample}_2_unpaired.fq.gz \
ILLUMINACLIP:${ADAPTER}:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
