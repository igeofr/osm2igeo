echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_barrage.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Barrage ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Barrage' AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE (waterway='weir' OR waterway='dam' OR lock='yes') AND (name IS NOT NULL OR lock_name IS NOT NULL) AND IsValid(GEOMETRY)=1
-----------------------------------------
UNION
-----------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN lock_name IS NOT NULL AND lock='yes' THEN lock_name
  ElSE name
END AS "NOM",
-----------------------------------------
'Barrage' AS "NATURE"
-----------------------------------------
FROM points WHERE (waterway='weir' OR waterway='dam' OR lock='yes') AND (name IS NOT NULL OR lock_name IS NOT NULL) AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_osmconf.ini'
echo fin
