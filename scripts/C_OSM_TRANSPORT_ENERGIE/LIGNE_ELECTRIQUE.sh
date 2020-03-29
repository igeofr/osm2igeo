#!/bin/bash

echo "Debut : C_OSM_TRANSPORT_ENERGIE > LIGNE_ELECTRIQUE.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/C_OSM_TRANSPORT_ENERGIE/LIGNE_ELECTRIQUE.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ LIGNE ELECTRIQUE ------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN voltage IS NOT NULL THEN CAST(voltage as INTEGER)
  ELSE 'NC'
END AS "VOLTAGE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE power='line' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/C_OSM_TRANSPORT_ENERGIE/LIGNE_ELECTRIQUE_osmconf.ini'
echo "Fin : C_OSM_TRANSPORT_ENERGIE > LIGNE_ELECTRIQUE.shp"
