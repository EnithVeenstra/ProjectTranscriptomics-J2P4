# ProjectTranscriptomics-J2P4
## Inleiding

Reumatoïde artritis (RA) is een chronische autoimmuunziekte die onder andere gekenmerkt wordt door gewrichtsontstekingen. Bij autoimuunziekten worden lichaamseigencellen als lichaamsvreemd herkend en aangevallen door het immuunsysteem. Hoewel de oorzaken van RA niet volledig in kaart gebracht zijn, spelen genetica en omgevingsfactoren, zoals roken of blootstelling aan gevaarlijke stoffen, een mogelijke rol in het veroorzaken van chronische gewrichtsontekingen. (BRON). Differentiële genexpressie spreekt daarnaast mogelijk ook een rol bij de 

Heb je Harry Potter nooit gelezen? Moet je echt doen, [klik maar hier](bronnen/harry-potter.pdf).

## 📁 Inhoud/structuur

- `data/raw/` – ruwe data verstrekt van de cotrole- en testgroepen uit RNA-seq synoviumbiopt samples
- `data/processed` - verwerkte datasets gegenereerd met scripts 
- `scripts/` – scripts voor het uitvoeren van analyses op ruwe data
- `resultaten/` - grafieken en tabellen
- `bronnen/` - geraadpleegde bronnen 
- `README.md` - het document om de tekst hier te genereren
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---
## Methoden

Voor het onderzoek naar RA is er gewerkt met een groep van 4 personen zonder RA en 4 personen met een RA-diagnose van >12 jaar. De samples zijn verkregen door middel van een synoviumbiopt. Personen met RA testten positief op anti-CCP (ACPA), personen zonder RA hebben negatief getest op ACPA. 


De data is verstrekt door de Afdeling Magische Wetshandhaving en Ollivanders Wandwinkel Archieven. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

## 📊 Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 


