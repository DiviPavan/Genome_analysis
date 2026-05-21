#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J mummer_illumina
#SBATCH --output=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.out
#SBATCH --error=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.err

module load MUMmer

mkdir -p /home/padi4950/uppmax/efaecium_E745/results/mummer/illumina

cd /home/padi4950/uppmax/efaecium_E745/results/mummer/illumina

nucmer \
/home/padi4950/uppmax/efaecium_E745/reference_genome/GCF_009734005.1_ASM973400v2_genomic.fna \
/home/padi4950/uppmax/efaecium_E745/results/spades/contigs.fasta \
-p illumina_vs_reference

mummerplot \
--png \
-R /home/padi4950/uppmax/efaecium_E745/reference_genome/GCF_009734005.1_ASM973400v2_genomic.fna \
-Q /home/padi4950/uppmax/efaecium_E745/results/spades/contigs.fasta \
illumina_vs_reference.delta
