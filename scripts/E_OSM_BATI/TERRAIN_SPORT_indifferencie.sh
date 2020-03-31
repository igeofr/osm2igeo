#!/bin/bash

echo "Debut : E_OSM_BATI > TERRAIN_SPORT_indifferencie.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_indifferencie.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Indifférencié ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'Indifférencié' AS "NATURE",
-----------------------------------------
CASE
  WHEN sport ='soccer' THEN 'Football'
  WHEN sport ='skateboard' THEN 'Skateboard'
  WHEN sport ='basketball' THEN 'Basketball'
  WHEN sport ='equestrian' THEN 'Equitation'
  WHEN sport ='tennis' THEN 'Tennis'
  WHEN sport ='golf' THEN 'Golf'
  ELSE 'Autre sport'
END AS "SPORT",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE (leisure='pitch' OR leisure='golf_course') AND IsValid(st_buffer(GEOMETRY,0))=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/E_OSM_BATI/TERRAIN_SPORT_osmconf.ini'
echo "Fin : E_OSM_BATI > TERRAIN_SPORT_indifferencie.shp"
