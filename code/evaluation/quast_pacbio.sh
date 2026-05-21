#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J quast_pacbio
#SBATCH -o /home/padi4950/uppmax/efaecium_E745/logs/quast_pacbio.out
#SBATCH -e /home/padi4950/uppmax/efaecium_E745/logs/quast_pacbio.err

module load QUAST

quast.py \
/home/padi4950/uppmax/efaecium_E745/results/canu/pacbio/efaecium.contigs.fasta \
-o /home/padi4950/uppmax/efaecium_E745/results/new_results/quast
