#export DATE=$(date '+%y%m')
#Téléchargement des données OSM - Geofabrik
cd "/home/osm2igeo/data_in"
################################################################################
#FRANCE
rm -r FRANCE
mkdir FRANCE
curl --limit-rate 1G https://download.geofabrik.de/europe/france/alsace'-latest.osm.pbf' > "./FRANCE/42_ALSACE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/aquitaine'-latest.osm.pbf' > "./FRANCE/72_AQUITAINE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/auvergne'-latest.osm.pbf' > "./FRANCE/83_AUVERGNE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/basse-normandie'-latest.osm.pbf' > "./FRANCE/25_BASSE_NORMANDIE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/bourgogne'-latest.osm.pbf' > "./FRANCE/26_BOURGOGNE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/bretagne'-latest.osm.pbf' > "./FRANCE/53_BRETAGNE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/centre'-latest.osm.pbf' > "./FRANCE/24_CENTRE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/champagne-ardenne'-latest.osm.pbf' > "./FRANCE/21_CHAMPAGNE_ARDENNE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/corse'-latest.osm.pbf' > "./FRANCE/94_CORSE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/franche-comte'-latest.osm.pbf' > "./FRANCE/43_FRANCHE_COMTE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/haute-normandie'-latest.osm.pbf' > "./FRANCE/23_HAUTE_NORMANDIE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/ile-de-france'-latest.osm.pbf' > "./FRANCE/11_ILE_DE_FRANCE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/languedoc-roussillon'-latest.osm.pbf' > "./FRANCE/91_LANGUEDOC_ROUSSILLON.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/limousin'-latest.osm.pbf' > "./FRANCE/74_LIMOUSIN.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/lorraine'-latest.osm.pbf' > "./FRANCE/41_LORRAINE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/midi-pyrenees'-latest.osm.pbf' > "./FRANCE/73_MIDI_PYRENEES.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/nord-pas-de-calais'-latest.osm.pbf' > "./FRANCE/31_NORD_PAS_DE_CALAIS.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/pays-de-la-loire'-latest.osm.pbf' > "./FRANCE/52_PAYS_DE_LA_LOIRE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/picardie'-latest.osm.pbf' > "./FRANCE/22_PICARDIE.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/poitou-charentes'-latest.osm.pbf' > "./FRANCE/54_POITOU_CHARENTES.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/provence-alpes-cote-d-azur'-latest.osm.pbf' > "./FRANCE/93_PROVENCE_ALPES_COTE_D_AZUR.pbf"
curl --limit-rate 1G https://download.geofabrik.de/europe/france/rhone-alpes'-latest.osm.pbf' > "./FRANCE/82_RHONE_ALPES.pbf"
rm -r GUADELOUPE
mkdir GUADELOUPE
curl --limit-rate 1G https://download.geofabrik.de/europe/france/guadeloupe'-latest.osm.pbf' > "./GUADELOUPE/GUADELOUPE.pbf"
rm -r MARTINIQUE
mkdir MARTINIQUE
curl --limit-rate 1G https://download.geofabrik.de/europe/france/martinique'-latest.osm.pbf' > "./MARTINIQUE/MARTINIQUE.pbf"
rm -r GUYANE
mkdir GUYANE
curl --limit-rate 1G https://download.geofabrik.de/europe/france/guyane'-latest.osm.pbf' > "./GUYANE/GUYANE.pbf"
rm -r REUNION
mkdir REUNION
curl --limit-rate 1G https://download.geofabrik.de/europe/france/reunion'-latest.osm.pbf' > "./REUNION/REUNION.pbf"
rm -r MAYOTTE
mkdir MAYOTTE
curl --limit-rate 1G https://download.geofabrik.de/europe/france/mayotte'-latest.osm.pbf' > "./MAYOTTE/MAYOTTE.pbf"
################################################################################
#BELGIQUE
rm -r BELGIQUE
mkdir BELGIQUE
curl --limit-rate 1G https://download.geofabrik.de/europe/belgium'-latest.osm.pbf' > "./BELGIQUE/BELGIQUE.pbf"
################################################################################
#SUISSE
rm -r SUISSE
mkdir SUISSE
curl --limit-rate 1G https://download.geofabrik.de/europe/switzerland'-latest.osm.pbf' > "./SUISSE/SUISSE.pbf"
################################################################################
#LUXEMBOURG
rm -r LUXEMBOURG
mkdir LUXEMBOURG
curl --limit-rate 1G https://download.geofabrik.de/europe/luxembourg'-latest.osm.pbf' > "./LUXEMBOURG/LUXEMBOURG.pbf"
################################################################################
#ANDORRE
rm -r ANDORRE
mkdir ANDORRE
curl --limit-rate 1G https://download.geofabrik.de/europe/andorra'-latest.osm.pbf' > "./ANDORRE/ANDORRE.pbf"
