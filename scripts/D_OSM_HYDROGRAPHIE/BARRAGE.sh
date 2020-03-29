#!/bin/bash

echo "Debut : D_OSM_HYDROGRAPHIE > BARRAGE.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/D_OSM_HYDROGRAPHIE/BARRAGE.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ BARRAGE ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN name IS NOT NULL THEN name
  ELSE 'NC'
END AS "NOM",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE waterway='dam' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/D_OSM_HYDROGRAPHIE/BARRAGE_osmconf.ini'
echo "Fin : D_OSM_HYDROGRAPHIE > BARRAGE.shp"
