# ProjectTranscriptomics-J2P4

<p align="center">
  <img src="Toevoegingen/Logo transcriptomics RA.png" alt="Logo transcriptomics RA" width="600"/>
</p>




## Inleiding

Reumatoïde artritis (RA) is een chronische autoimmuunziekte die onder andere gekenmerkt wordt door gewrichtsontstekingen. De ziekte is progressief en kan naast gewrichtsontstekingen ook andere organen, zoals het hart en de longen, aantasten. Bij autoimuunziekten worden lichaamseigencellen als lichaamsvreemd herkend en aangevallen door het immuunsysteem. Hoewel de oorzaken van RA niet volledig in kaart gebracht zijn, spelen genetica en omgevingsfactoren, zoals roken of blootstelling aan gevaarlijke stoffen, een mogelijke rol in het veroorzaken van chronische gewrichtsontekingen. (BRON). Hormonen hebben mogelijk ook invloed; bij vrouwen wordt er gemiddeld drie keer vaker RA gediagnosticeerd dan bij mannen. Differentiële genexpressie zou tot slot oorzakelijk voor het ontstaan van RA of de progressie van de ziekte kunnen zijn. Tijdens dit onderzoek wordt er gekeken naar differentiële genexpressie in vrouwlijke patiënten met RA ten op zichte van vrouwlijke patiënten zonder RA. Hierbij is de volgende onderzoeksvraag opgesteld: in welke hoeveelheid kan differentiële genexpressie tussen gezonde patiënten en patiënten met RA worden bepaald doormiddel van een visualisatie van een GO-analyse en een KEGG pathway?


## 📁 Inhoud/structuur

- `Data stewardship` – Toelichting competentie 'beheren' en uitleg GitHub
- `Resultaten` - grafieken en tabellen
- `Ruwe data` – ruwe data verstrekt van de cotrole- en testgroepen uit RNA-seq synoviumbiopt samples
- `Scripts` – scripts voor het uitvoeren van analyses op ruwe data
- `Toevoegingen` – logo project Transcriptomics voor GitHub
- `Verwerkte data` - verwerkte datasets gegenereerd met R-scripts
- `Bronnen` - geraadpleegde bronnen
- `README.md` - het document om de tekst hier te genereren






---
## Methoden

Voor het onderzoek naar RA is er gewerkt met een groep van 4 personen zonder RA en 4 personen met een RA-diagnose van >12 jaar. De samples zijn verkregen door middel van een synoviumbiopt. Personen met RA testten positief op anti-CCP (ACPA), personen zonder RA hebben negatief getest op ACPA. 

De ruwe data is bewerkt voor analyse met behulp van [Scripts/Script_transcriptomics_ruwe_data_verwerking.R](Scripts/Script_transcriptomics_ruwe_data_verwerking.R). Op de bewerkte data zijn vervolgens GO-analyses [Resultaten/GO_dotplot.pdf](Resultaten/GO_dotplot.pdf) en KEGG pathways op uitgevoerd voor de celcyclus [Resultaten/hsa04110.pathview.png](Resultaten/hsa04110.pathview.png) en toll-like receptor (TLR) signalering [Resultaten/hsa04620.pathview.png](Resultaten/hsa04620.pathview.png)

De data van het humaan genomisch DNA waarmee de ruwe data mee vergeleken en geanalyseerd is, is verkregen uit de NCBI database. 


## 📊 Resultaten

X-AS: Hoe lager de p-waarde, hoe hoger deze waarde en dus hoe meer significant het GO-term is.
Bijvoorbeeld: -log10(1e-15) = 15 betekent een p-waarde van 1×10⁻¹⁵ (erg significant).

Y-as:
Dit zijn de GO-termen (biologische processen, moleculaire functies of celcomponenten) die verrijkt zijn in je dataset.

Geel tot rood kleurverloop geeft de significantie van de verrijking aan.
Rood = lage p-waarde = hoge significantie.
Geel = minder significant.

Grootte van de stip:

Geeft het aantal genen aan die geassocieerd zijn met het betreffende GO-term in jouw dataset.
Grotere stip = meer genen betrokken.

Voorbeeldinterpretaties
"Immune system process" heeft een grote rode stip, wat betekent:
Veel genen in je lijst zijn betrokken bij dit proces.
Het is zeer significant verrijkt (lage p-waarde).
"Regulation of immune system process" is geel en klein:
Weinig genen.
Minder significant.




Belangrijke observaties in deze figuur
"Immunoglobulin complex":
Hoogste Hits (%) (>55%)
Zeer lage p-waarde (paarsroze): extreem significant.
Weinig andere GO-termen hebben zo'n hoge hitscore → suggereert een zeer specifieke immuunfunctie.
"Immune response" en "Immune system process":
Ook vrij hoge hits (~30%).
Significante p-waarden (oranje).
Bevestigt de rol van immuunactivatie.
"Intracellular anatomical structure":
Laag Hits %, maar zeer significante p-waarde (paars).
Veel genen (grote stip), maar wijdverspreid → mogelijk generiek maar statistisch oververtegenwoordigd.

Samenvatting en interpretatie
Deze resultaten laten zien dat jouw genenset sterk verrijkt is voor immuun-gerelateerde functies, met name:
Antilichaamstructuren (immunoglobuline complex)
Immuunrespons
Celcomponenten zoals nucleus en organellen
De combinatie van lage p-waarden, hoge Hits (%), en grote stippen (veel genen) maakt sommige GO-termen bijzonder relevant voor verder onderzoek.

## Conclusie




