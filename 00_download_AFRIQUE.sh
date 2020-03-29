#export DATE=$(date '+%y%m')
#Téléchargement des données OSM - Geofabrik
cd "/home/osm2igeo/data_in"

################################################################################
rm -r MAROC
mkdir MAROC
curl --limit-rate 1G https://download.geofabrik.de/africa/morocco'-latest.osm.pbf' > "./MAROC/MAROC.pbf"
rm -r ALGERIE
mkdir ALGERIE
curl --limit-rate 1G https://download.geofabrik.de/africa/algeria'-latest.osm.pbf' > "./ALGERIE/ALGERIE.pbf"
rm -r TUNISIE
mkdir TUNISIE
curl --limit-rate 1G https://download.geofabrik.de/africa/tunisia'-latest.osm.pbf' > "./TUNISIE/TUNISIE.pbf"
rm -r MAURITANIE
mkdir MAURITANIE
curl --limit-rate 1G https://download.geofabrik.de/africa/mauritania'-latest.osm.pbf' > "./MAURITANIE/MAURITANIE.pbf"
rm -r REPUBLIQUE_CENTRAFRICAINE
mkdir REPUBLIQUE_CENTRAFRICAINE
curl --limit-rate 1G https://download.geofabrik.de/africa/central-african-republic'-latest.osm.pbf' > "./REPUBLIQUE_CENTRAFRICAINE/REPUBLIQUE_CENTRAFRICAINE.pbf"
rm -r CONGO_RDC
mkdir CONGO_RDC
curl --limit-rate 1G https://download.geofabrik.de/africa/congo-democratic-republic'-latest.osm.pbf' > "./CONGO_RDC/CONGO_RDC.pbf"
rm -r GABON
mkdir GABON
curl --limit-rate 1G https://download.geofabrik.de/africa/gabon'-latest.osm.pbf' > "./GABON/GABON.pbf"
rm -r DJIBOUTI
mkdir DJIBOUTI
curl --limit-rate 1G https://download.geofabrik.de/africa/djibouti'-latest.osm.pbf' > "./DJIBOUTI/DJIBOUTI.pbf"
rm -r GUINEE_EQUATORIALE
mkdir GUINEE_EQUATORIALE
curl --limit-rate 1G https://download.geofabrik.de/africa/equatorial-guinea'-latest.osm.pbf' > "./GUINEE_EQUATORIALE/GUINEE_EQUATORIALE.pbf"
rm -r COMORES
mkdir COMORES
curl --limit-rate 1G https://download.geofabrik.de/africa/comores'-latest.osm.pbf' > "./COMORES/COMORES.pbf"
rm -r SEYCHELLES
mkdir SEYCHELLES
curl --limit-rate 1G https://download.geofabrik.de/africa/seychelles'-latest.osm.pbf' > "./SEYCHELLES/SEYCHELLES.pbf"
rm -r CONGO_RC
mkdir CONGO_RC
curl --limit-rate 1G https://download.geofabrik.de/africa/congo-brazzaville'-latest.osm.pbf' > "./CONGO_RC/CONGO_RC.pbf"
rm -r RWANDA
mkdir RWANDA
curl --limit-rate 1G https://download.geofabrik.de/africa/rwanda'-latest.osm.pbf' > "./RWANDA/RWANDA.pbf"
rm -r BURUNDI
mkdir BURUNDI
curl --limit-rate 1G https://download.geofabrik.de/africa/burundi'-latest.osm.pbf' > "./BURUNDI/BURUNDI.pbf"
rm -r GUINEE
mkdir GUINEE
curl --limit-rate 1G https://download.geofabrik.de/africa/guinea'-latest.osm.pbf' > "./GUINEE/GUINEE.pbf"
rm -r TOGO
mkdir TOGO
curl --limit-rate 1G https://download.geofabrik.de/africa/togo'-latest.osm.pbf' > "./TOGO/TOGO.pbf"
rm -r BENIN
mkdir BENIN
curl --limit-rate 1G https://download.geofabrik.de/africa/benin'-latest.osm.pbf' > "./BENIN/BENIN.pbf"
rm -r NIGER
mkdir NIGER
curl --limit-rate 1G https://download.geofabrik.de/africa/niger'-latest.osm.pbf' > "./NIGER/NIGER.pbf"
rm -r TCHAD
mkdir TCHAD
curl --limit-rate 1G https://download.geofabrik.de/africa/chad'-latest.osm.pbf' > "./TCHAD/TCHAD.pbf"
rm -r CAMEROUN
mkdir CAMEROUN
curl --limit-rate 1G https://download.geofabrik.de/africa/cameroon'-latest.osm.pbf' > "./CAMEROUN/CAMEROUN.pbf"
rm -r MADAGASCAR
mkdir MADAGASCAR
curl --limit-rate 1G https://download.geofabrik.de/africa/madagascar'-latest.osm.pbf' > "./MADAGASCAR/MADAGASCAR.pbf"
rm -r BURKINA_FASO
mkdir BURKINA_FASO
curl --limit-rate 1G https://download.geofabrik.de/africa/burkina-faso'-latest.osm.pbf' > "./BURKINA_FASO/BURKINA_FASO.pbf"
rm -r MALI
mkdir MALI
curl --limit-rate 1G https://download.geofabrik.de/africa/mali'-latest.osm.pbf' > "./MALI/MALI.pbf"
rm -r SENEGAL_GAMBIE
mkdir SENEGAL_GAMBIE
curl --limit-rate 1G https://download.geofabrik.de/africa/senegal-and-gambia'-latest.osm.pbf' > "./SENEGAL_GAMBIE/SENEGAL_GAMBIE.pbf"
rm -r COTE_D_IVOIRE
mkdir COTE_D_IVOIRE
curl --limit-rate 1G https://download.geofabrik.de/africa/ivory-coast'-latest.osm.pbf' > "./COTE_D_IVOIRE/COTE_D_IVOIRE.pbf"
