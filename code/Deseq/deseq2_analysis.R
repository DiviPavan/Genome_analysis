setwd("/Users/pavandivi/Desktop/Notes/Period_4/Genome_analysis/project/HTSeq")
library(DESeq2)

# Find HTSeq files
files <- list.files(pattern="*_counts.txt")

# Read all files
count_list <- lapply(files, function(f) {
  read.table(
    f,
    header = FALSE,
    sep = "\t",
    stringsAsFactors = FALSE,
    col.names = c("gene","count")
  )
})

# Use gene column as rownames
for(i in seq_along(count_list)) {
  rownames(count_list[[i]]) <- count_list[[i]]$gene
}

# Extract only count columns
counts <- do.call(cbind,
                  lapply(count_list, function(x) x$count))

# Preserve rownames
rownames(counts) <- rownames(count_list[[1]])

# Convert to matrix
counts <- as.matrix(counts)
storage.mode(counts) <- "integer"

# Remove HTSeq summary rows
counts <- counts[!grepl("^__", rownames(counts)), ]

# Check
dim(counts)
head(counts)
sum(counts)

# Assign sample names
colnames(counts) <- c(
  "serum1","serum2","serum3",
  "BHI1","BHI2","BHI3"
)

# Metadata
condition <- factor(c(
  "serum","serum","serum",
  "BHI","BHI","BHI"
))

coldata <- data.frame(
  row.names = colnames(counts),
  condition
)

# Create DESeq2 object
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = coldata,
  design = ~ condition
)

# Run DESeq2
dds <- DESeq(dds)

# Results
res <- results(dds)

# Order by adjusted p-value
resOrdered <- res[order(res$padj), ]

# Significant genes
sig <- subset(resOrdered,
              padj < 0.05 & abs(log2FoldChange) > 1)

# Save
write.csv(as.data.frame(resOrdered),
          "DESeq2_all_results.csv")

write.csv(as.data.frame(sig),
          "DESeq2_significant_genes.csv")

summary(res)
head(sig)

annotation <- read.table("efaecium.tsv", sep="\t", header=TRUE)
sig_annotated <- merge(as.data.frame(sig), annotation, 
                       by.x="row.names", by.y="locus_tag")
write.csv(sig_annotated, "significant_DEGs_annotated.csv")

library(ggplot2)

results_df <- as.data.frame(res)

results_df$significant <- results_df$padj < 0.1 & 
  abs(results_df$log2FoldChange) > 1

ggplot(results_df, aes(x=log2FoldChange, y=-log10(padj), 
                       color=significant)) +
  geom_point(alpha=0.5) +
  scale_color_manual(values=c("grey", "red")) +
  geom_vline(xintercept=c(-1,1), linetype="dashed") +
  geom_hline(yintercept=-log10(0.1), linetype="dashed") +
  labs(title="Volcano Plot: Serum vs BHI",
       x="log2 Fold Change", 
       y="-log10(adjusted p-value)") +
  theme_classic()

#Biological interpretation- 
results_df <- results_df[!is.na(results_df$padj),]

# Get top 20 upregulated genes in serum
top_up <- head(results_df[order(results_df$log2FoldChange, decreasing=TRUE),], 20)

# Get top 20 downregulated genes in serum
top_down <- head(results_df[order(results_df$log2FoldChange),], 20)

# Save both to CSV
write.csv(top_up, "top20_upregulated.csv")
write.csv(top_down, "top20_downregulated.csv")

# Also save ALL significant genes
sig <- results_df[results_df$padj < 0.05 & abs(results_df$log2FoldChange) > 1,]
write.csv(sig, "all_significant_DEGs.csv")