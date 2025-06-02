# ProjectTranscriptomics-J2P4
## Inleiding

Reumatoïde artritis (RA) is een chronische autoimmuunziekte die onder andere gekenmerkt wordt door gewrichtsontstekingen. Bij autoimuunziekten worden lichaamseigencellen als lichaamsvreemd herkend en aangevallen door het immuunsysteem. Hoewel de oorzaken van RA niet volledig in kaart gebracht zijn, spelen genetica en omgevingsfactoren, zoals roken of blootstelling aan gevaarlijke stoffen, een mogelijke rol in het veroorzaken van chronische gewrichtsontekingen. (BRON). Differentiële genexpressie spreekt daarnaast mogelijk ook een rol bij de 


## 📁 Inhoud/structuur

- `BAM/` – gegenereerde BAM-bestanden van ruwe data en humaan genomisch DNA
- `Ruwe data/` – ruwe data verstrekt van de cotrole- en testgroepen uit RNA-seq synoviumbiopt samples
- `Data/processed` - verwerkte datasets gegenereerd met scripts 
- `Scripts/` – scripts voor het uitvoeren van analyses op ruwe data
- `Resultaten/` - grafieken en tabellen
- `Bronnen/` - geraadpleegde bronnen 
- `README.md` - het document om de tekst hier te genereren


---
## Methoden

Voor het onderzoek naar RA is er gewerkt met een groep van 4 personen zonder RA en 4 personen met een RA-diagnose van >12 jaar. De samples zijn verkregen door middel van een synoviumbiopt. Personen met RA testten positief op anti-CCP (ACPA), personen zonder RA hebben negatief getest op ACPA. 


De data van het humaan genomisch DNA waarmee de ruwe data mee vergeleken en geanalyseerd is, is verkregen uit de NCBI database. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

## 📊 Resultaten



## Conclusie




