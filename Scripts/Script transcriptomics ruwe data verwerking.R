# setwd -> Transcriptomics
getwd()

BiocManager::install('Rsubread')
library('Rsubread')

# Handleiding package
browseVignettes('Rsubread')

# Indexeren
buildindex(
  basename = 'ref.human',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 6000,
  indexSplit = TRUE)

?align
# Mapping uitvoeren (duurt lang!)
# Human controle (19, 20, 28 en 31 zijn controle (NORMAAL), de rest is RA)
align.humc1 <- align(index = "ref.human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "humc1.BAM")
align.humc2 <- align(index = "ref.human", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "humc2.BAM")
align.humc3 <- align(index = "ref.human", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "humc3.BAM")
align.humc4 <- align(index = "ref.human", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = "SRR4785831_2_subset40k.fastq", output_file = "humc4.BAM")

# Human RA samples
align.hum1 <- align(index = "ref.human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq", output_file = "hum1.BAM")
align.hum2 <- align(index = "ref.human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "hum2.BAM")
align.hum3 <- align(index = "ref.human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "hum3.BAM")
align.hum4 <- align(index = "ref.human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "hum4.BAM")

# BAM-bestanden sorteren en indexeren
# Laad Rsamtools voor sorteren en indexeren
library(Rsamtools)

# Bestandsnamen van de monsters
samples.hum <- c('hum1', 'hum2', 'hum3','hum4', 'humc1', 'humc2', 'humc3', 'humc4')

# Voor elk monster: sorteer en indexeer de BAM-file
# Sorteer BAM-bestanden
lapply(samples.hum, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})

lapply(samples.hum, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})

# COUNT MATRIX MAKEN

library(readr)
library(dplyr)
library(Rsamtools)
library(Rsubread)

# Inlezen en filteren van GFF3-bestand
gtfproject <- read_tsv("GCF_000001405.25_GRCh37.p13_genomic.gtf", comment = "#", col_names = FALSE)

# Kolomnamen toevoegen
colnames(gtfproject) <- c("seqid", "source", "type", "start", "end", "score", "strand", "phase", "attributes")

# Alleen genregels selecteren
gtf_geneproject <- gtfproject %>% filter(type == "gene")

# 'type' aanpassen naar 'exon' zodat featureCounts het accepteert
gtf_geneproject$type <- "exon"

# FeatureCounts uitvoeren
# Je definieert een vector met namen van BAM-bestanden. Elke BAM bevat reads van een RNA-seq-experiment (bijv. behandeld vs. controle).
allsamplesproject <- c("hum1.BAM", "hum2.BAM", "hum3.BAM", "humc1.BAM", "humc2.BAM", "humc3.BAM")

count_matrixproject <- featureCounts(
  files = allsamplesproject,
  annot.ext = "GCF_000001405.25_GRCh37.p13_genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

# Resultaten bekijken
head(count_matrixproject$annotation)
head(count_matrixproject$counts)

# Countmatrix opslaan en inladen
# Bekijk eerst de structuur van het object
str(count_matrix)

# Haal alleen de matrix met tellingen eruit
counts <- count_matrix$counts
colnames(counts) <- c("eth1", "eth2", "eth3", "con1", "con2", "con3")

rownames(counts) <- counts[, 1]

# Matrix opslaan
write.csv(counts, "bewerkt_countmatrix.csv")

# eerste paar rijen bekijken
head(counts)


##### grote count matrix
count_matrix_groot <- read.table("count_matrix.txt")


# eerste paar rijen bekijken
head(count_matrix_groot)

