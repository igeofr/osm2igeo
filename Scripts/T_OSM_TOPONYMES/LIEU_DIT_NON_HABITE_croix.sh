echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_croix.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Croix ------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Croix' AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE historic='wayside_shrine' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
-----------------------------------------
UNION
-----------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Croix' AS "NATURE"
-----------------------------------------
FROM points WHERE (historic='wayside_cross' OR historic='wayside_shrine') AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_osmconf.ini'
echo fin
