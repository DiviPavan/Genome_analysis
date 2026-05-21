#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 08:00:00
#SBATCH -J htseq_count
#SBATCH --output=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.out
#SBATCH --error=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.err

module load HTSeq

cd /home/padi4950/uppmax/efaecium_E745

sample=$1

htseq-count \
-f bam \
-r pos \
-s no \
-t CDS \
-i ID \
results/RNA_mapping/${sample}_sorted.bam \
results/HTSeq/efaecium_clean.gff \
> results/HTSeq/${sample}_counts.txt
