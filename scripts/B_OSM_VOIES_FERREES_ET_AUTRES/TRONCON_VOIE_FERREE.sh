#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
#------------------------------------------------------------------------------------------------------------
var_group=B_OSM_VOIES_FERREES_ET_AUTRES
var_file=TRONCON_VOIE_FERREE
#------------------------------------------------------------------------------------------------------------
#------------------------------------ TRONCON VOIE FERREE ---------------------------------------------------
#------------------------------------------------------------------------------------------------------------
export requete="SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN railway='disused' THEN 'Voie non exploitée'
  WHEN railway='construction' THEN 'En construction'
  WHEN railway='funicular' THEN 'Funiculaire'
  WHEN railway='light_rail' THEN 'Train-tram'
  WHEN railway='miniature' THEN 'Miniature'
  WHEN railway='monorail' THEN 'Monorail'
  WHEN railway='narrow_gauge' THEN 'Voie étroite'
  WHEN railway='rail' THEN 'Ligne principale'
  WHEN railway='preserved' THEN 'Voie préservée'
  WHEN railway='tram' THEN 'Tramway'
  ELSE 'NC'
END AS "NATURE",
-----------------------------------------
CASE
  WHEN tunnel='yes' THEN 'Tunnel'
  WHEN bridge='yes' THEN 'Pont'
  WHEN bridge='viaduct' THEN 'Pont'
  ELSE 'NC'
END AS "FRANCHISST",
-----------------------------------------
CASE
  WHEN electrified='contact_line' THEN 'Electrique'
  WHEN electrified='rail' THEN 'Electrique'
  WHEN electrified='yes' THEN 'Electrique'
  WHEN electrified='electrified' THEN 'Electrique'
  WHEN electrified='no' THEN 'Non électrique'
  ELSE 'NC'
END AS "ELECTRIFIE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE railway <>'abandoned' AND railway<>'razed' AND railway<>'dismantled' AND railway<>'platform' AND railway<>'level_crossing' AND railway<>'turntable'"
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
if [ "$FORMAT_SIG" = "SHP" ]
then
  echo "Debut : $var_group > $var_file.shp"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.shp' -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file.shp"
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'.gpkg' -nln $var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f PGDump 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.sql' -nln $var_group'_'$var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN --config PG_USE_COPY YES --debug ON -skipfailures -lco SRID=2154 -lco SCHEMA=osm2igeo -lco GEOMETRY_NAME=geom -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
