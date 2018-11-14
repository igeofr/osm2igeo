echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_rond_point.shp' -dialect SQLITE -sql "SELECT * FROM (
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
END AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE (highway='mini_roundabout' OR junction='roundabout') AND IsValid(GEOMETRY)=1 AND (name LIKE 'Giratoire%' OR name LIKE 'Rond-Point%')
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
END AS "NATURE"
-----------------------------------------
FROM points WHERE (highway='mini_roundabout' OR junction='roundabout') AND IsValid(GEOMETRY)=1 AND (name LIKE 'Giratoire%' OR name LIKE 'Rond-Point%')
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo fin
