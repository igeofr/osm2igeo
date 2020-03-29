#!/bin/bash

echo "Debut : F_OSM_VEGETATION > ZONE_VEGETATION_verger.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_verger.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Verger ----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'Verger' AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE landuse='orchard' AND round((st_area(st_transform(GEOMETRY,2154))/10000),2)>0.05 AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/F_OSM_VEGETATION/ZONE_VEGETATION_osmconf.ini'
echo "Fin : F_OSM_VEGETATION > ZONE_VEGETATION_verger.shp"
