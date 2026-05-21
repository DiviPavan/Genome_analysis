#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J trim_DNA_Illumina
#SBATCH -o /home/padi4950/uppmax/efaecium_E745/logs/trim_DNA_Illumina.out
#SBATCH -e /home/padi4950/uppmax/efaecium_E745/logs/trim_DNA_Illumina.err

module load Trimmomatic

cd ~/uppmax/efaecium_E745

ADAPTER="/sw/generic/pixi-envs/shovill-1.4.2/.pixi/envs/default/share/trimmomatic-0.40-0/adapters/TruSeq3-PE.fa"

# DNA Illumina sample (single pair)
trimmomatic PE \
data/raw_data/DNA_Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
data/raw_data/DNA_Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
data/trimmed_data/DNA_Illumina/E745_1_paired.fq.gz \
data/trimmed_data/DNA_Illumina/E745_1_unpaired.fq.gz \
data/trimmed_data/DNA_Illumina/E745_2_paired.fq.gz \
data/trimmed_data/DNA_Illumina/E745_2_unpaired.fq.gz \
ILLUMINACLIP:${ADAPTER}:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
