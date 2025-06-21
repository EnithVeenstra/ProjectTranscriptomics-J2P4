# setwd -> Transcriptomics
getwd()

gene_vector <- resultatenproject$log2FoldChange
names(gene_vector) <- rownames(resultatenproject)


# KEGG map04110 = Cell Cycle → pathway ID = "04110"
pathview(gene.data = gene_vector,
         pathway.id = "hsa04110",
         species = "hsa",  
         gene.idtype = "SYMBOL", # hsa = Homo sapiens
         kegg.native = TRUE)

hsa04110.cellcycle.pathview.png

# KEGG map04620 = Toll-like Receptor Signaling → pathway ID = "04620"
pathview(gene.data = gene_vector,
         pathway.id = "hsa04620",
         species = "hsa",  
         gene.idtype = "SYMBOL", # hsa = Homo sapiens
         kegg.native = TRUE)

hsa04110.tolllikereceptorsignaling.pathview.png