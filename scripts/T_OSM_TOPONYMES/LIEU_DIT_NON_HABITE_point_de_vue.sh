#!/bin/bash

echo "Debut : T_OSM_TOPONYMES > LIEU_DIT_NON_HABITE_point_de_vue.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_point_de_vue.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Point de vue ----------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Arbre' AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE tourism='viewpoint' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_osmconf.ini'
echo "Fin : T_OSM_TOPONYMES > LIEU_DIT_NON_HABITE_point_de_vue.shp"
