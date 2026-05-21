#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J busco_pacbio
#SBATCH -o /home/padi4950/uppmax/efaecium_E745/logs/busco_pacbio.out
#SBATCH -e /home/padi4950/uppmax/efaecium_E745/logs/busco_pacbio.err

module load BUSCO

busco \
-i /home/padi4950/uppmax/efaecium_E745/results/canu/pacbio/efaecium.contigs.fasta \
-l bacteria_odb10 \
-o busco_pacbio \
--out_path /home/padi4950/uppmax/efaecium_E745/results/new_results/busco \
-m genome \
--cpu 2
