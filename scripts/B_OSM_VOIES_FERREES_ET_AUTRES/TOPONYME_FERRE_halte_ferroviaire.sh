#!/bin/bash

echo "Debut : B_OSM_VOIES_FERREES_ET_AUTRES > TOPONYME_FERRE_halte_ferroviaire.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_halte_ferroviaire.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Halte ferroviaire -----------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
REPLACE(railway,'halt','Halte ferroviaire') AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE railway ='halt' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_osmconf.ini'
echo "Fin : B_OSM_VOIES_FERREES_ET_AUTRES > TOPONYME_FERRE_halte_ferroviaire.shp"
