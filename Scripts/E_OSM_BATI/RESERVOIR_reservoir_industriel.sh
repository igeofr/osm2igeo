echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/E_OSM_BATI/RESERVOIR/RESERVOIR_reservoir_d_eau.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Réservoir industriel --------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN man_made='gasometer' THEN 'Réservoir industriel'
  WHEN man_made='hot_water_tank' THEN 'Réservoir industriel'
  WHEN man_made='silo' THEN 'Réservoir industriel'
  WHEN man_made='storage_tank' THEN 'Réservoir industriel'
  ELSE 'NC'
END AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE (man_made='gasometer' OR man_made='hot_water_tank' OR man_made='silo' OR man_made='storage_tank') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/E_OSM_BATI/RESERVOIR_osmconf.ini'
echo fin
