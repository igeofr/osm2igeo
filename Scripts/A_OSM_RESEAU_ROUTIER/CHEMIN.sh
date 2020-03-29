#!/bin/bash

echo "Debut : A_OSM_RESEAU_ROUTIER > CHEMIN.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/A_OSM_RESEAU_ROUTIER/CHEMIN.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CHEMIN ----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
CASE highway
  WHEN 'steps' THEN 'Escalier'
  WHEN 'cycleway' THEN 'Piste cyclable'
  WHEN 'track' THEN 'Chemin'
  WHEN 'path' THEN 'Sentier'
  ELSE 'NC'
END AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE (highway='path' OR highway='track' OR highway='cycleway' OR highway='steps') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/A_OSM_RESEAU_ROUTIER/CHEMIN_osmconf.ini'
echo "Fin : A_OSM_RESEAU_ROUTIER > CHEMIN.shp"
