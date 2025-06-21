# setwd -> Transcriptomics
getwd()

# Laad benodigde libraries
library(goseq)
library(GO.db)
library(dplyr)
library(ggplot2)

# Aanname: je hebt gene.vector en pwf al gemaakt
# gene.vector <- ...
# pwf <- nullp(gene.vector, "hg19", "geneSymbol")

# Voer GO enrichment analyse uit
GO.wall <- goseq(pwf, "hg19", "geneSymbol")

# Voeg GO term beschrijvingen toe
GO.wall$term <- Term(GOTERM[GO.wall$category])

# Filter op significante GO-termen (p < 0.05) en bereid data voor plotting
GO.sig <- GO.wall %>%
  filter(!is.na(term)) %>%
  filter(over_represented_pvalue < 0.05) %>%
  arrange(over_represented_pvalue) %>%
  head(30)  # top 30 meest significante

# Voeg -log10(p) toe
GO.sig$logp <- -log10(GO.sig$over_represented_pvalue)

# Maak dotplot (GO enrichment dotplot)
ggplot(GO.sig, aes(x = logp, y = reorder(term, logp))) +
  geom_point(aes(size = numDEInCat, color = over_represented_pvalue)) +
  scale_color_gradient(low = "red", high = "yellow", name = "p-waarde") +
  scale_size_continuous(name = "# genen") +
  labs(
    title = "GO enrichment dotplot",
    x = expression(-log[10](p-waarde)),
    y = "GO term"
  ) +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10))

ggsave("GO_dotplot.pdf", width = 15, height = 12)


# Laad libraries
library(dplyr)
library(ggplot2)
library(GO.db)

# Voeg GO-term beschrijvingen toe (indien nog niet gedaan)
GO.wall$term <- Term(GOTERM[GO.wall$category])

# Bereken "hit percentage" en selecteer top 10
top10 <- GO.wall %>%
  filter(!is.na(term)) %>%
  mutate(hitsPerc = (numDEInCat / numInCat) * 100) %>%
  arrange(over_represented_pvalue) %>%
  slice(1:10)

# Dotplot maken
ggplot(top10, aes(x = hitsPerc, y = reorder(term, hitsPerc))) +
  geom_point(aes(size = numDEInCat, colour = over_represented_pvalue)) +
  scale_color_gradient(low = "purple", high = "yellow", name = "p value", trans = "log10") +
  scale_size(name = "Count") +
  labs(
    x = "Hits (%)",
    y = "GO term",
    title = "Top 10 GO enrichment terms"
  ) +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10))


ggsave("top10_GO_enrichment_dotplot.pdf", width = 8, height = 5)

