#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
#------------------------------------------------------------------------------------------------------------
var_group=A_OSM_RESEAU_ROUTIER
var_sub_group=TOPONYME_COMMUNICATION
var_file=TOPONYME_COMMUNICATION_tunnel
#------------------------------------------------------------------------------------------------------------
#------------------------------------ Tunnel ----------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
export requete="SELECT
-----------------------------------------
'w'||osm_id  AS "ID",
-----------------------------------------
centroid(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
REPLACE(tunnel,'yes','Tunnel') AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE tunnel ='yes' AND ST_IsValid(GEOMETRY) AND name IS NOT NULL"
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
if [ "$FORMAT_SIG" = "SHP" ]
then
  echo "Debut : $var_group > $var_file.shp"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_sub_group'/'$var_file'.shp' -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/'$var_group'/'$var_sub_group'_osmconf.ini'
  echo "Fin : $var_group > $var_file.shp"
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_sub_group'/'$var_file'.gpkg' -nln $var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures -oo CONFIG_FILE='scripts/'$var_group'/'$var_sub_group'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f PGDump 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_sub_group'/'$var_file'.sql' -nln $var_group'_'$var_sub_group -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN --config PG_USE_COPY NO --debug ON -skipfailures -lco SRID=2154 -lco SCHEMA=osm2igeo -lco DROP_TABLE=NO -lco CREATE_TABLE=NO -lco GEOMETRY_NAME=geom -oo CONFIG_FILE='scripts/'$var_group'/'$var_sub_group'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
