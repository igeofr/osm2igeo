#!/bin/bash

echo "Debut : A_OSM_RESEAU_ROUTIER > TOPONYME_COMMUNICATION_peage.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_peage.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Péage -----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
REPLACE(barrier,'toll_booth','Péage') AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE barrier='toll_booth' AND IsValid(GEOMETRY)=1 AND name IS NOT NULL
-----------------------------------------
UNION
-----------------------------------------
SELECT
-----------------------------------------
'n'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
REPLACE(barrier,'toll_booth','Péage') AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE barrier='toll_booth' AND IsValid(GEOMETRY)=1 AND name IS NOT NULL
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo "Fin : A_OSM_RESEAU_ROUTIER > TOPONYME_COMMUNICATION_peage.shp"
