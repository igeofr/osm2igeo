echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_indifferencie.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Indifférencié ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'Indifférencié' AS "NATURE",
-----------------------------------------
CASE sport
  WHEN sport IS NOT NULL THEN sport
  ELSE 'NC'
END AS "SPORT"
-----------------------------------------
FROM multipolygons WHERE leisure='pitch' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/E_OSM_BATI/TERRAIN_SPORT_osmconf.ini'
echo fin
