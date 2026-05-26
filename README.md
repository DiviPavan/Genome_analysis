# Genome Analysis of Enterococcus faecium E745
# Summary
This project is based on Zhang et al. (2017) - Paper I from the 
Genome Analysis course at Uppsala University (2026).

## What This Project Is About

Enterococcus faecium E745 is a vancomycin-resistant bacterium 
isolated from a Dutch hospital VRE outbreak in 2000. While it 
normally lives harmlessly in the gut, it can cause serious 
bloodstream infections in hospitalised and immunocompromised 
patients. The goal of this project was to reproduce the 
computational analyses from the paper- assembling the E745 
genome and identifying which genes change expression when the 
bacterium grows in human serum compared to rich laboratory medium.

## What Was Done

The project has two main parts. First, the genome was assembled 
using PacBio long reads with Canu, evaluated with QUAST and BUSCO, 
and annotated with Prokka and EggNOG-mapper. As an extra analysis, 
a hybrid assembly was also performed using SPAdes with Nanopore and 
Illumina reads. Second, RNA-seq data from bacteria grown in BHI 
rich medium and heat-inactivated human serum was analysed using 
BWA-MEM for alignment, HTSeq for read counting, and DESeq2 for 
differential expression analysis.

## Key Findings

The Canu assembly produced a high quality genome- 9 contigs, 
N50 of 2.76 Mb, and BUSCO completeness of 98.4% with zero missing 
genes. Prokka identified 3,118 coding sequences, with 96% receiving 
functional annotation from EggNOG-mapper.

The RNA-seq analysis found 2,389 significantly differentially 
expressed genes between serum and BHI conditions- 79% of the 
genome. The most strongly upregulated genes in serum were involved 
in pyrimidine biosynthesis (pyrK_2, pyrC, pyrB) and glucose uptake 
(glcU_1, pbuO), consistent with the nutrient-poor environment of 
human blood. The most strongly downregulated genes were involved 
in fructose and tagatose metabolism (fruA_1, lacC_1)- sugars 
absent in serum. These results support the conclusion that 
E. faecium undergoes a fundamental metabolic shift when entering 
the bloodstream, switching from nutrient absorption to active 
nutrient synthesis.
