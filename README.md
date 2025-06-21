# Differentiële genexpressie in patiënten met reumatoïde artritis: TLR-signalering wordt omhoog gereguleerd

<p align="center">
  <img src="Toevoegingen/Logo transcriptomics RA.png" alt="Logo transcriptomics RA" width="600"/>
</p>



## Inhoud/structuur

- `Bronnen` - geraadpleegde bronnen
- `Data_stewardship` – toelichting competentie 'beheren' en uitleg GitHub
- `Resultaten` - grafieken, pathways en tabel
- `Ruwe_data` – ruwe data verstrekt van de controle- en testgroepen uit RNA-seq synoviumbiopt samples
- `Scripts` – scripts voor het uitvoeren van analyses op ruwe data
- `Toevoegingen` – logo project Transcriptomics voor GitHub en flowschema
- `Verwerkte_data` - verwerkte datasets gegenereerd met R-scripts
- `README.md` - het document om de tekst hier te genereren

## Inleiding

Reumatoïde artritis (RA) is een chronische autoimmuunziekte die onder andere gekenmerkt wordt door gewrichtsontstekingen. De ziekte is progressief en kan naast gewrichtsontstekingen ook andere organen, zoals het hart en de longen, aantasten. Bij autoimuunziekten worden lichaamseigencellen als lichaamsvreemd herkend en aangevallen door het immuunsysteem. Hoewel de oorzaken van RA niet volledig in kaart gebracht zijn, spelen genetica en omgevingsfactoren, zoals roken of blootstelling aan gevaarlijke stoffen, een mogelijke rol in het veroorzaken van chronische gewrichtsontekingen [Qiang Guo et al., 2012](Bronnen/41413_2018_Article_16.pdf). Hormonen hebben mogelijk ook invloed; bij vrouwen wordt er gemiddeld drie keer vaker RA gediagnosticeerd dan bij mannen. Differentiële genexpressie zou tot slot oorzakelijk voor het ontstaan van RA of de progressie van de ziekte kunnen zijn. Zo wordt gesuggereerd dat RA invloed kan uitoefenen op de genexpressie van immuunsysteem-gerelateerde genen en/of  veroorzaakt dat signaalroutes in het synovium soms in verhoogde of verlaagde expressie aanwezig zijn [Kalliolias, G. D. et al, 2024](Bronnen/biomedicines-12-00138-v2.pdf) Tijdens dit onderzoek wordt er gekeken naar differentiële genexpressie in vrouwlijke patiënten met RA ten op zichte van vrouwlijke patiënten zonder RA [Gerosa M et al., 2008](Bronnen/gerosa-et-al-2008-rheumatoid-arthritis-a-female-challenge.pdf). Hierbij is de volgende onderzoeksvraag opgesteld: in welke hoeveelheid kan differentiële genexpressie tussen gezonde patiënten en patiënten met RA worden bepaald doormiddel van een visualisatie van een GO-analyse en een KEGG pathway?


---
## Methoden

Voor het onderzoek naar RA is er gewerkt met een groep van 4 personen zonder RA en 4 personen met een RA-diagnose van >12 maanden. Personen met RA testten positief op anti-CCP (ACPA), personen zonder RA testten negatief op ACPA. De samples zijn afkomstig uit een synoviumbiopt. Na het isoleren van het RNA uit de monsters, waren de samples (RNA omgezet naar cDNA met reverse transcriptase) gesequenced met Ilumina MiSeq voor paired-end sequencing. De gesequencete reads zijn na een kwaliteitscontrole gefiltered en getrimd. De reads zijn gemapt in R-studio (package: Rsubread) met een FASTA-bestand van de haploïde sequentie van het humaan referentiegenoom uit de NCBI database (accessionnummer: GCF_000001405.25), met BAM-bestanden als output. De [ruwe data](Ruwe_data) is bewerkt voor analyse in dit [script](Scripts/Script_transcriptomics_ruwe_data_verwerking.R).

Voor het bepalen van differentiële genexpressie is er een Gene Ontology (GO) analyse uitgezet. Voor de GO-analyse is er een GO-wall gebouwd aan de hand van een Probability Weight Function (PWF) object; met het PWF-object (package: goseq) is er een PWF-plot opgezet om inzicht te krijgen in gensignificantie. Op de bewerkte data zijn vervolgens GO-analyses (package: ClusterProfiler) met een [dotplot](Scripts/Script_transcriptomics_GO_dotplot_enrichment_GO_dotplot_percentage.R) en een [top 10 enrichment analyse](Scripts/Script_transcriptomics_GO_dotplot_enrichment_GO_dotplot_percentage.R) en KEGG pathway-analyses op uitgevoerd voor de [celcyclus](Scripts/Script_transcriptomics_KEGG_pathway.R) en voor de [toll-like receptor (TLR) signalering](Scripts/Script_transcriptomics_KEGG_pathway.R). Voor de GO-analyse is er gefilterd op significante GO-termen van P < 0.05 met humaan referentie genoom: hg19. Met behulp van de Log2FoldChange (package: DESeq2) is er een bepaling van de significantie van differentiële genexpressie gemaakt en gevisualiseerd met een [vulcanoplot](Scripts/Script_transcriptomics_DESeq2-analyse_volcanoplot.R).

De werkwijze is schematisch uitgezet in een [flowschema](Toevoegingen/Flowschema_project_transcriptomics.png).




## Resultaten

Tijdens het onderzoek naar differentiële genexpressie bij patiënten met RA is er voor het uitzetten van een [vulcanoplot](Resultaten/Volcanoplotprojectmetp.png) gewerkt met de Log2FoldChange; in het plot wordt er onderscheid gemaakt tussen alle geanalyseerde genen (29.407) en de statistisch significante genen. Grijs is niet significant, groen toont een verschil in expressie, maar niet in significantie en rood toont verschil in expressie en is statistisch significant (P < 0.05). Genen zijn significanter wanneer ze hoger op de Log-schaal liggen en verder van het nulpunt op de Log2FoldChange-schaal afwijken.

Daarnaast is er voor het bepalen van de differentiële genexpressie een GO-(enrichment)analyse uitgewerkt met behulp van het ClusterProfiler package in R-Studio. Uit de [GO-enrichmentanalyse](Resultaten/top10_GO_enrichment_dotplot.pdf) blijkt een sterke toename in genexpressie omtrent het immuunsysteem. Genen o.a. verantwoordelijk voor de immuunrepons en immunoglobuline tonen een verhoogde expressie: 'immunoglobulin complex' is het sterkst differentieel tot expressie gebracht. Uit de GO-analyse (uitgewerkt als [dotplot](Resultaten/GO_dotplot.pdf)) resulteert daarnaast een lymfocytactivatie en ook een verhoogde expressie in immunoglobuline. Ook is er een hoge significantie en aanwezigheid van genen gerelateerd aan eiwitbinding en celstructuur, wat mogelijk op antilichaambinding kan duiden.


Aan de hand van het Pathview package is er een KEGG pathway-analyse uitgezet voor zowel de celcyclus als de TLR-signalering (immuunsysteem). De [celcyclus pathway-analyse](Resultaten/hsa04110.pathview.png) toont een omhoog regulatie van mitotische genen, daarnaast zijn tumorrepressoren, zoals p53 en CDK-inhibitoren, omlaag gereguleerd. De omhoog regulatie van de mitotische genen en omlaag regulatie van de tumorrepressoren duidt op een activatie van het immuunsysteem, voornamelijk bij lymfocyten. Uit de [TLR pathway-analyse](Resultaten/hsa04620.pathview.png) blijkt een verhoogde expressie in de route van de MyD88-afhankelijke TLR; MyD88, FADD en RIP1 tonen een verhoogde genexpressie. Genen binnen de MyD88-onafhankelijke route, IRF3 en IRF7, hebben een verlaagde genexpressie. Voornamelijk de verhoogde genexpressie suggereert een ontstekingsreactie.





## Conclusie

De transcriptomicsanalyse van synoviumbiopten van RA-patiënten en controlepersonen laat duidelijke verschillen zien in genexpressie, met name binnen ontstekingsgerelateerde signaalroutes. In RA-samples werd verhoogde expressie waargenomen van genen binnen de MyD88-afhankelijke Toll-like receptor route, terwijl andere genen binnen MyD88-onafhankelijke route een verlaagde genexpressie vertoonden. Daarnaast is er een verlaagde expressie waargenomen voor tumorrepressorgenen in de TLR-pathway. De GO-enrichmentanalyse toonde een sterke omhoog regulatie van immuunprocessen (immuunrespons en immunoglobuline-activiteit). De KEGG-pathwayanalyses bevestigen een verhoogde expressie van genen gekoppeld aan ontstekingsreacties voor zowel de celcyclus-pathway als de TLR-pathway. Uit de [genresultaten van de KEGG pathway- en GO-analyses](Resultaten/Genentabel.md) wordt gesuggereerd dat mensen met RA een versterkte immuunsysteemactivatie hebben in synoviaal weefsel ten opzichte van mensen zonder RA; wat overeenkomt met bevindingen uit vorige studies dat het immuunsysteem (over)gevoelig is voor lichaamseigencellen. Voor een vervolgonderzoek zou mogelijk de steekproef vergroot kunnen worden door synoviumbiopten van mannen af te nemen en wellicht een verband te leggen tussen RA differentiële en geslachtsspecifieke genexpressie.



