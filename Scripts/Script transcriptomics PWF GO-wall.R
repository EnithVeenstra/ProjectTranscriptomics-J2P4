# setwd -> Transcriptomics
getwd()

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("goseq", force =TRUE)
BiocManager::install("org.Hs.eg.db", force = TRUE)
BiocManager::install("GO.db", force = TRUE)
BiocManager::install("clusterProfiler")
library(clusterProfiler)
library(goseq)
library(GO.db)
library(org.Hs.eg.db)

# --- Installeren en laden packages ---
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("goseq", "org.Hs.eg.db", "GO.db", "clusterProfiler", "GenomicFeatures"), force = FALSE)

library(clusterProfiler)
library(goseq)
library(GO.db)
library(org.Hs.eg.db)
library(GenomicFeatures)
library(GenomicRanges)

# Packages laden
library(GenomicFeatures)
library(GenomicRanges)
library(goseq)
library(org.Hs.eg.db)
library(AnnotationDbi)

head(rownames(resultatenproject))

head(resultatenproject)

all <- rownames(resultatenproject)
resultatenproject <- as.data.frame(resultatenproject)
goi <- resultatenproject %>%
  +   filter(padj < 0.05)

head(goi)

goi <- resultatenproject %>%
  filter(padj < 0.05)

goi <- rownames(goi)
all

library("goseq")
library("geneLenDataBase")
library("org.Dm.eg.db")

txdb <- makeTxDbFromGFF("GCF_000001405.25_GRCh37.p13_genomic.gtf", format = "gtf")
exons_by_gene <- exonsBy(txdb, by = "gene")

reduced_exons <- reduce(exons_by_gene)
gene_lengths <- sapply(reduced_exons, function(x) sum(width(x)))



GOI.vector <- c(t(goi))
ALL.vector<-c(t(all))

gene.vector <- as.integer(ALL.vector%in%GOI.vector)
names(gene.vector) <- ALL.vector 
#lets explore this new vector a bit
head(gene.vector)
tail(gene.vector)

supportedOrganisms()

pwf=nullp(gene.vector,"hg19","geneSymbol")

# plot opslaan
png("pwf_plot.png")      # Open PNG device
plotPWF(pwf)             # Plot de PWF
dev.off()                # Sluit het device en sla het bestand op


GO.wall <- goseq(pwf, "hg19", "geneSymbol")

# Resultaten bekijken
head(GO.wall)

GO.wall=goseq(pwf,"hg19","geneSymbol")

#How many enriched GO terms do we have
class(GO.wall)
head(GO.wall)
nrow(GO.wall)

enriched.GO=GO.wall$category[GO.wall$over_represented_pvalue<.05]
#NOTE: They recommend using a more stringent multiple testing corrected p value here

#How many GO terms do we have now?
class(enriched.GO)
head(enriched.GO)
length(enriched.GO)

library(GO.db)
capture.output(for(go in enriched.GO[1:258]) { print(GOTERM[[go]])
  cat("--------------------------------------\n")
}
, file="SigGo.txt")

