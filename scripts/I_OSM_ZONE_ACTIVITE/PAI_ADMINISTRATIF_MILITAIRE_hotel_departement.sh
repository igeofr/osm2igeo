#!/bin/bash

echo "Debut : I_OSM_ZONE_ACTIVITE > PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Hôtel de département --------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
REPLACE(amenity,'public_building','Hôtel de département') AS "NATURE",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE (amenity='public_building') AND (name LIKE 'Hôtel du Département%') AND IsValid(GEOMETRY)=1
-----------------------------------------
UNION ALL
-----------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
REPLACE(amenity,'public_building','Hôtel de département') AS "NATURE",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE (amenity='public_building') AND (name LIKE 'Hôtel du Département%') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_osmconf.ini'
echo "Fin : I_OSM_ZONE_ACTIVITE > PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.shp"