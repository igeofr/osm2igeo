#!/bin/bash

echo "Debut : D_OSM_HYDROGRAPHIE > CANALISATION_EAU.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/D_OSM_HYDROGRAPHIE/CANALISATION_EAU.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CANALISATION D EAU ----------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE man_made='pipeline' AND substance='water' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/D_OSM_HYDROGRAPHIE/CANALISATION_EAU_osmconf.ini'
echo "Fin : D_OSM_HYDROGRAPHIE > CANALISATION_EAU.shp"
