#!/bin/bash

echo "Debut : A_OSM_RESEAU_ROUTIER > TOPONYME_COMMUNICATION_rond_point.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_rond_point.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Rond-point ------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
CASE
  WHEN highway='mini_roundabout' THEN 'Rond-point'
  WHEN junction='roundabout' THEN 'Rond-point'
  ELSE 'Rond-point'
END AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE (highway='mini_roundabout' OR junction='roundabout') AND IsValid(st_buffer(GEOMETRY,0))=1 AND (name LIKE 'Giratoire%' OR name LIKE 'Rond-Point%')
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
CASE
  WHEN highway='mini_roundabout' THEN 'Rond-point'
  WHEN junction='roundabout' THEN 'Rond-point'
  ELSE 'Rond-point'
END AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE (highway='mini_roundabout' OR junction='roundabout') AND IsValid(GEOMETRY)=1 AND (name LIKE 'Giratoire%' OR name LIKE 'Rond-Point%')
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo "Fin : A_OSM_RESEAU_ROUTIER > TOPONYME_COMMUNICATION_rond_point.shp"
