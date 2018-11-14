echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_parc.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Parc --------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Parc' AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE boundary='protected_area' AND (protect_class=3 OR protect_class=4 OR protect_class=5) AND name IS NOT NULL AND IsValid(GEOMETRY)=1
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
'Parc' AS "NATURE"
-----------------------------------------
FROM points WHERE boundary='protected_area' AND (protect_class=3 OR protect_class=4 OR protect_class=5) AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_osmconf.ini'
echo fin
