#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
#------------------------------------------------------------------------------------------------------------
var_group=H_OSM_ADMINISTRATIF
var_file=ARRONDISSEMENT
#------------------------------------------------------------------------------------------------------------
#------------------------------------ ARRONDISSEMENT --------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
export requete="SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
ST_Buffer(GEOMETRY,0) AS "GEOMETRY",
-----------------------------------------
upper(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
name,
'à','A'),
'é','E'),
'è','E'),
'ê','E'),
'ë','E'),
'ï','I'),
'î','I'),
'ô','O'),
'ö','O'),
'ü','U'),
'û','U'),
'ç','C')) AS "NOM_ARR_M",
-----------------------------------------
name AS "NOM_ARR",
-----------------------------------------
SUBSTR(ref_insee,3,3) AS "INSEE_ARR",
-----------------------------------------
SUBSTR(ref_insee,1,2) AS "INSEE_DEP",
-----------------------------------------
CASE
  WHEN SUBSTR(ref_insee,1,2)='01' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='02' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='03' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='04' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='05' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='06' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='07' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='08' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='09' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='10' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='11' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='12' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='13' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='14' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='15' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='16' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='17' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='18' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='19' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='21' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='22' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='23' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='24' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='25' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='26' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='27' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='28' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='29' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='2A' THEN 94
  WHEN SUBSTR(ref_insee,1,2)='2B' THEN 94
  WHEN SUBSTR(ref_insee,1,2)='30' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='31' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='32' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='33' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='34' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='35' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='36' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='37' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='38' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='39' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='40' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='41' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='42' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='43' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='44' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='45' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='46' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='47' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='48' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='49' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='50' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='51' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='52' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='53' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='54' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='55' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='56' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='57' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='58' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='59' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='60' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='61' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='62' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='63' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='64' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='65' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='66' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='67' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='68' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='69' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='70' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='71' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='72' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='73' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='74' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='75' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='76' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='77' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='78' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='79' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='80' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='81' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='82' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='83' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='84' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='85' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='86' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='87' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='88' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='89' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='90' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='91' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='92' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='93' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='94' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='95' THEN 11
  ELSE ''
END AS "INSEE_REG",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE boundary='administrative' AND admin_level='7' AND ref_insee IS NOT NULL AND ST_IsValid(ST_Buffer(GEOMETRY,0))"
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
if [ "$FORMAT_SIG" = "SHP" ]
then
  echo "Debut : $var_group > $var_file.shp"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.shp' -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_FRANCE_osmconf.ini'
  echo "Fin : $var_group > $var_file.shp"
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'.gpkg' -nln $var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_FRANCE_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f PGDump 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.sql' -nln $var_group'_'$var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN --config PG_USE_COPY YES --debug ON -skipfailures -lco SRID=2154 -lco SCHEMA=osm2igeo -lco GEOMETRY_NAME=geom -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_FRANCE_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
