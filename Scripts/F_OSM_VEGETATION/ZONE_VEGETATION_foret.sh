echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_foret.shp' -dialect SQLITE -sql "SELECT * FROM (

------------------------------------------------------------------------------------------------------------
------------------------------------ Forêt -----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN landuse='forest' AND leaf_type='broadleaved' THEN 'Forêt de feuillus'
  WHEN landuse='forest' AND leaf_type='needleleaved' THEN 'Forêt de conifères'
  WHEN landuse='forest' AND leaf_type='mixed' THEN 'Forêt mixte'
  WHEN landuse='forest' AND leaf_type IS NULL THEN 'Forêt indifférenciée'
  WHEN natural='wood' AND leaf_type='broadleaved' THEN 'Forêt de feuillus'
  WHEN natural='wood' AND leaf_type='needleleaved' THEN 'Forêt de conifères'
  WHEN natural='wood' AND leaf_type='mixed' THEN 'Forêt mixte'
  WHEN natural='wood' AND leaf_type IS NULL THEN 'Forêt indifférenciée'
  WHEN natural='scrub' THEN 'Forêt ouverte'
  WHEN natural='heath' THEN 'Lande'
  ELSE 'NC'
END AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE (landuse='forest' OR natural='scrub' OR natural='wood' OR natural='heath') AND round((st_area(st_transform(GEOMETRY,2154))/10000),2)>0.05 AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/F_OSM_VEGETATION/ZONE_VEGETATION_osmconf.ini'
echo fin
