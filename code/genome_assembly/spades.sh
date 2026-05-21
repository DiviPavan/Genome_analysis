#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 12:00:00
#SBATCH -J spades_hybrid
#SBATCH --output=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.out
#SBATCH --error=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.err

module load SPAdes

cd /home/padi4950/uppmax/efaecium_E745

spades.py \
-1 data/raw_data/DNA_Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
-2 data/raw_data/DNA_Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
--nanopore data/raw_data/DNA_Nanopore/E745_all.fasta.gz \
-k 77 \
--only-assembler \
-t 4 \
-o /home/padi4950/uppmax/efaecium_E745/results/spades
