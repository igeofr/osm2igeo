#Téléchargement des données OSM - Geofabrik
cd "/volume1/docker/gdal/data_in"
rm "42_ALSACE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/alsace-latest.osm.pbf > "42_ALSACE.pbf"
rm "72_AQUITAINE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/aquitaine-latest.osm.pbf > "72_AQUITAINE.pbf"
rm "83_AUVERGNE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/auvergne-latest.osm.pbf > "83_AUVERGNE.pbf"
rm "25_BASSE_NORMANDIE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/basse-normandie-latest.osm.pbf > "25_BASSE_NORMANDIE.pbf"
rm "26_BOURGOGNE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/bourgogne-latest.osm.pbf > "26_BOURGOGNE.pbf"
rm "53_BRETAGNE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/bretagne-latest.osm.pbf > "53_BRETAGNE.pbf"
rm "24_CENTRE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/centre-latest.osm.pbf > "24_CENTRE.pbf"
rm "21_CHAMPAGNE_ARDENNE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/champagne-ardenne-latest.osm.pbf > "21_CHAMPAGNE_ARDENNE.pbf"
rm "94_CORSE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/corse-latest.osm.pbf > "94_CORSE.pbf"
rm "43_FRANCHE_COMTE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/franche-comte-latest.osm.pbf > "43_FRANCHE_COMTE.pbf"
rm "23_HAUTE_NORMANDIE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/haute-normandie-latest.osm.pbf > "23_HAUTE_NORMANDIE.pbf"
rm "1_ILE_DE_FRANCE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/ile-de-france-latest.osm.pbf > "1_ILE_DE_FRANCE.pbf"
rm "91_LANGUEDOC_ROUSSILLON.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/languedoc-roussillon-latest.osm.pbf > "91_LANGUEDOC_ROUSSILLON.pbf"
rm "74_LIMOUSIN.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/limousin-latest.osm.pbf > "74_LIMOUSIN.pbf"
rm "41_LORRAINE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/lorraine-latest.osm.pbf > "41_LORRAINE.pbf"
rm "73_MIDI_PYRENEES.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/midi-pyrenees-latest.osm.pbf > "73_MIDI_PYRENEES.pbf"
rm "3_NORD_PAS_DE_CALAIS.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/nord-pas-de-calais-latest.osm.pbf > "3_NORD_PAS_DE_CALAIS.pbf"
rm "52_PAYS_DE_LA_LOIRE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/pays-de-la-loire-latest.osm.pbf > "52_PAYS_DE_LA_LOIRE.pbf"
rm "22_PICARDIE.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/picardie-latest.osm.pbf > "22_PICARDIE.pbf"
rm "54_POITOU_CHARENTES.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/poitou-charentes-latest.osm.pbf > "54_POITOU_CHARENTES.pbf"
rm "93_PROVENCE_ALPES_COTE_D_AZUR.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/provence-alpes-cote-d-azur-latest.osm.pbf > "93_PROVENCE_ALPES_COTE_D_AZUR.pbf"
rm "82_RHONE_ALPES.pbf"
curl --limit-rate 100K https://download.geofabrik.de/europe/france/rhone-alpes-latest.osm.pbf > "82_RHONE_ALPES.pbf"
