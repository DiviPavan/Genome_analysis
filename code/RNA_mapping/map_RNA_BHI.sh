#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 08:00:00
#SBATCH -J map_BHI
#SBATCH --output=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.out
#SBATCH --error=/home/padi4950/uppmax/efaecium_E745/logs/%x_%j.err

module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.22-GCC-13.3.0

cd /home/padi4950/uppmax/efaecium_E745

sample=$1

bwa mem -t 4 \
results/canu/efaecium.contigs.fasta \
data/trimmed_data/RNA_BHI/${sample}_1_paired.fq.gz \
data/trimmed_data/RNA_BHI/${sample}_2_paired.fq.gz \
| samtools sort -@ 4 \
-o results/RNA_mapping/${sample}_sorted.bam

samtools index results/RNA_mapping/${sample}_sorted.bam
