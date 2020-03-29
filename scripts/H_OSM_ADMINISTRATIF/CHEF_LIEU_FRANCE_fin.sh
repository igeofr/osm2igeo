#!/bin/bash

echo "Debut : H_OSM_ADMINISTRATIF > CHEF_LIEU.shp"
$LINK_OGR -progress -s_srs EPSG:2154 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU.shp' 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU_SELECT.vrt' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CHEF LIEU -------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
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
FROM point AS p, poly AS m WHERE p.name=m.name
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures
echo "Fin : H_OSM_ADMINISTRATIF > CHEF_LIEU.shp"
