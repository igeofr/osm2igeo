echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_bassin_de_natation.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Bassin de natation ----------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'Bassin de natation' AS "NATURE",
-----------------------------------------
CASE sport
  WHEN sport IS NOT NULL THEN sport
  ELSE 'NC'
END AS "SPORT"
-----------------------------------------
FROM multipolygons WHERE leisure='swimming_pool' AND access='yes' AND location='outdoor' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/E_OSM_BATI/TERRAIN_SPORT_osmconf.ini'
echo fin
