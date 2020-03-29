#!/bin/bash

echo "Debut : Y_OSM_ENVIRONNEMENT > AIRE_PROTEGEE_parc_naturel_regional.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE/AIRE_PROTEGEE_parc_naturel_regional.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Parc naturel regional -------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'Parc naturel régional' AS "NATURE",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE boundary='protected_area' AND protection_title='parc naturel régional' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE_osmconf.ini'
echo "Fin : Y_OSM_ENVIRONNEMENT > AIRE_PROTEGEE_parc_naturel_regional.shp"
