# ProjectTranscriptomics-J2P4

<p align="center">
  <img src="Toevoegingen/Logo project transcriptomics RA.png" alt="Wizarding Spell Metrics Logo" width="600"/>
</p>




## Inleiding

Reumatoïde artritis (RA) is een chronische autoimmuunziekte die onder andere gekenmerkt wordt door gewrichtsontstekingen. Bij autoimuunziekten worden lichaamseigencellen als lichaamsvreemd herkend en aangevallen door het immuunsysteem. Hoewel de oorzaken van RA niet volledig in kaart gebracht zijn, spelen genetica en omgevingsfactoren, zoals roken of blootstelling aan gevaarlijke stoffen, een mogelijke rol in het veroorzaken van chronische gewrichtsontekingen. (BRON). Differentiële genexpressie spreekt daarnaast mogelijk ook een rol bij de 


## 📁 Inhoud/structuur

- `BAM` – gegenereerde BAM-bestanden van ruwe data en humaan genomisch DNA
- `Bronnen` - geraadpleegde bronnen
- `Data/processed` - verwerkte datasets gegenereerd met scripts
- `README.md` - het document om de tekst hier te genereren
- `Resultaten` - grafieken en tabellen
- `Ruwe data` – ruwe data verstrekt van de cotrole- en testgroepen uit RNA-seq synoviumbiopt samples
- `Scripts` – scripts voor het uitvoeren van analyses op ruwe data
- `Toevoegingen` – logo project Transcriptomics voor GitHub


---
## Methoden

Voor het onderzoek naar RA is er gewerkt met een groep van 4 personen zonder RA en 4 personen met een RA-diagnose van >12 jaar. De samples zijn verkregen door middel van een synoviumbiopt. Personen met RA testten positief op anti-CCP (ACPA), personen zonder RA hebben negatief getest op ACPA. 


De data van het humaan genomisch DNA waarmee de ruwe data mee vergeleken en geanalyseerd is, is verkregen uit de NCBI database. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

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




