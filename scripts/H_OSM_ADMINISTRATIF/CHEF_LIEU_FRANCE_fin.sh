#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
#------------------------------------------------------------------------------------------------------------
var_group=H_OSM_ADMINISTRATIF
var_file=CHEF_LIEU
#------------------------------------------------------------------------------------------------------------
#------------------------------------ CHEF LIEU -------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
export requete="SELECT
-----------------------------------------
'n'|| p.osm_id AS ID,
-----------------------------------------
p.GEOMETRY AS "GEOMETRY",
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
replace(
p.name,
'â','A'),
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
'ç','C')) AS "NOM_M",
-----------------------------------------
p.name AS "NOM",
-----------------------------------------
CASE p.place
  WHEN 'city' THEN 'Ville'
  WHEN 'town' THEN 'Ville moyenne'
  WHEN 'village' THEN 'Village'
  ELSE 'NC'
END AS "TYPE",
-----------------------------------------
COALESCE (m.ref_FR_SIR,p.ref_FR_SIR) AS "SIREN",
-----------------------------------------
COALESCE (m.addr_postc,m.postal_cod,p.addr_postc,p.postal_cod) AS "C_POSTAL",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(p.osm_timest, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM point AS p, poly AS m WHERE p.name=m.name"
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
if [ "$FORMAT_SIG" = "SHP" ]
then
  echo "Debut : $var_group > $var_file.shp"
  $LINK_OGR -progress -s_srs EPSG:2154 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.shp' -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU_SELECT.vrt' -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file.shp"
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:2154 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'.gpkg' -nln $var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU_SELECT.vrt' -lco SPATIAL_INDEX=YES --debug ON -skipfailures -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:2154 -t_srs EPSG:$OUT_EPSG -f PGDump 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.sql' -nln $var_group'_'$var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU_SELECT.vrt' --config PG_USE_COPY YES --debug ON -skipfailures -lco SRID=2154 -lco SCHEMA=osm2igeo -lco GEOMETRY_NAME=geom -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
