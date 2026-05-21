#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J illumina_assembly
#SBATCH -o /home/padi4950/uppmax/efaecium_E745/logs/illumina_assembly.out
#SBATCH -e /home/padi4950/uppmax/efaecium_E745/logs/illumina_assembly.err

module load shovill

OUTDIR=/home/padi4950/uppmax/efaecium_E745/results/canu/illumina

mkdir -p $OUTDIR

shovill \
--R1 /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
--R2 /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
--outdir $OUTDIR \
--depth 100 \
--cpus 4
