#!/bin/bash

echo "Debut : I_OSM_ZONE_ACTIVITE > PAI_INDUSTRIEL_COMMERCIAL_marais_salant.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_marais_salant.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Marais salant ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Marais salant' AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE landuse='salt_pond' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_osmconf.ini'
echo "Fin : I_OSM_ZONE_ACTIVITE > PAI_INDUSTRIEL_COMMERCIAL_marais_salant.shp"
