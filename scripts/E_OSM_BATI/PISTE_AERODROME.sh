#!/bin/bash

echo "Debut : E_OSM_BATI > PISTE_AERODROME.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/E_OSM_BATI/PISTE_AERODROME.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ PISTE AERODROME -------------------------------------------------------
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
FROM lines WHERE aeroway='runway' AND IsValid(GEOMETRY)=1

--CASE
--  WHEN width IS NOT NULL THEN st_transform(st_buffer(st_transform(GEOMETRY,2154),(CAST(width AS DOUBLE)/2)),4326)
--  ELSE st_transform(st_buffer(st_transform(GEOMETRY,2154),15),4326)
--END AS

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/E_OSM_BATI/PISTE_AERODROME_osmconf.ini'
echo "Fin : E_OSM_BATI > PISTE_AERODROME.shp"
