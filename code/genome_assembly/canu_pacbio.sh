#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J canu_assembly
#SBATCH -o /home/padi4950/uppmax/efaecium_E745/logs/canu.out
#SBATCH -e /home/padi4950/uppmax/efaecium_E745/logs/canu.err

module load canu
module load samtools

cd /home/padi4950/uppmax/efaecium_E745

canu \
  -p efaecium \
  -d results/canu/pacbio \
  genomeSize=3m \
  useGrid=true \
  maxThreads=4 \
  corOutCoverage=80 \
  corMinCoverage=4 \
  corOverlapper=ovl \
  ovsMemory=8 \
  redMemory=16 \
  gridOptions="-A uppmax2026-1-61" \
  -pacbio data/raw_data/DNA_PacBio/*.fastq.gz
