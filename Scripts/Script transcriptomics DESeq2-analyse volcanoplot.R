# setwd -> Transcriptomics
getwd()

#DESeq2-analyse

count_matrix_groot <- read.table("count_matrix.txt")
count_matrix_groot

# behandelingstabel maken("normaal", "normaal", "normaal", "normaal", "RA", "RA", "RA", "RA")
treatmentproject <- c("normaal", "normaal", "normaal", "normaal", "RA", "RA", "RA", "RA")
treatment_tableproject <- data.frame(treatmentproject)
rownames(treatment_tableproject) <- c("SRR4785819", "SRR4785820", "SRR4785828", "SRR4785831", "SRR4785979", "SRR4785980", "SRR4785986", "SRR4785988")
treatment_tableproject


colnames(count_matrix_groot)
rownames(treatment_tableproject) <- colnames(count_matrix_groot)
all(colnames(count_matrix_groot) == rownames(treatment_tableproject))

# packages
BiocManager::install("DESeq2", force = TRUE)
BiocManager::install("KEGGREST", force = TRUE)
a
library(DESeq2)
library(KEGGREST)

# Maak DESeqDataSet aan
head(count_matrix_groot)

#### count matrix bevat decimalen: chatgpt zegt afronden met:
count_matrix_groot <- round(count_matrix_groot)
treatment_tableproject$treatmentproject <- factor(treatment_tableproject$treatmentproject)


ddsproject <- DESeqDataSetFromMatrix(countData = round(count_matrix_groot),
                                     colData = treatment_tableproject,
                                     design = ~ treatmentproject)

# Voer analyse uit# Voer analyse uitcountscounts# Voer analyse uit# Voer analyse uitcounts
ddsproject <- DESeq(ddsproject)
resultatenproject <- results(ddsproject)
resultatenproject
# Resultaten opslaan in een bestand
#Bij het opslaan van je tabel kan je opnieuw je pad instellen met `setwd()` of het gehele pad waar je de tabel wilt opslaan opgeven in de code.

write.table(resultatenproject, file = 'Resultatenproject.csv', row.names = TRUE, col.names = TRUE)

# samenvatting significante genen
sum(resultatenproject$padj < 0.05 & resultatenproject$log2FoldChange > 1, na.rm = TRUE)
sum(resultatenproject$padj < 0.05 & resultatenproject$log2FoldChange < -1, na.rm = TRUE)

# opvallendste genen
hoogste_fold_changeproject <- resultatenproject[order(resultatenproject$log2FoldChange, decreasing = TRUE), ]
laagste_fold_changeproject <- resultatenproject[order(resultatenproject$log2FoldChange, decreasing = FALSE), ]
laagste_p_waardeproject<- resultatenproject[order(resultatenproject$padj, decreasing = FALSE), ]

# belangrijkste genen volgens analyse
head(laagste_p_waardeproject)

# visualisatie
# volcano plot
if (!requireNamespace("EnhancedVolcano", quietly = TRUE)) {
  BiocManager::install("EnhancedVolcano", force = TRUE)
}
library(EnhancedVolcano)

head(rownames(resultatenproject))

EnhancedVolcano(resultatenproject,
                lab = as.character(1:nrow(resultatenproject)),
                x = 'log2FoldChange',
                y = 'padj')

# plot met andere opmaak
# Alternatieve plot zonder p-waarde cutoff (alle genen zichtbaar)
EnhancedVolcano(resultatenproject,
                lab = rownames(resultatenproject),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0)

# figuur opslaan
dev.copy(png, 'Volcanoplotproject.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()
