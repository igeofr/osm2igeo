echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_aire_repos.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Aire de repos ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
REPLACE(highway,'rest_area','Aire de repos') AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE highway='rest_area' AND IsValid(GEOMETRY)=1 AND name IS NOT NULL
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
REPLACE(highway,'rest_area','Aire de repos') AS "NATURE"
-----------------------------------------
FROM points WHERE highway='rest_area' AND IsValid(GEOMETRY)=1 AND name IS NOT NULL
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo fin
