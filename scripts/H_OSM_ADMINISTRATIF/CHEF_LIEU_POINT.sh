#!/bin/bash

echo "Debut : H_OSM_ADMINISTRATIF > CHEF_LIEU.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CHEF LIEU -------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
CASE place
  WHEN 'city' THEN 'Ville '
  WHEN 'town' THEN 'Ville moyenne'
  WHEN 'village' THEN 'Village'
  ELSE 'NC'
END AS "TYPE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE (place='city' OR place='town' OR place='village') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT_osmconf.ini'
echo "Fin : H_OSM_ADMINISTRATIF > CHEF_LIEU.shp"
