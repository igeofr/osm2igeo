#!/bin/bash

echo "Debut : I_OSM_ZONE_ACTIVITE > PAI_GESTION_EAUX_station_epuration.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX/PAI_GESTION_EAUX_station_epuration.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Station d épuration ----------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
REPLACE(man_made,'pumping_station','Station d epuration') AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE man_made='wastewater_plant' AND IsValid(GEOMETRY)=1
-----------------------------------------
UNION
-----------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
REPLACE(man_made,'pumping_station','Station d epuration') AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE man_made='wastewater_plant' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_osmconf.ini'
echo "France : data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_station_epuration.shp"
