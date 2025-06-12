# setwd -> Transcriptomics
getwd()

gene_vector <- resultatenproject$log2FoldChange
names(gene_vector) <- rownames(resultatenproject)


# KEGG map00061 = Fatty acid biosynthesis → pathway ID = "00061"
pathview(gene.data = gene_vector,
         pathway.id = "hsa04110",
         species = "hsa",  
         gene.idtype = "SYMBOL", # hsa = Homo sapiens
         kegg.native = TRUE)

hsa04110.cellcycle.pathview.png

