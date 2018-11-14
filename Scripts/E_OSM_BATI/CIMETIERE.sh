echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/E_OSM_BATI/CIMETIERE.shp' -dialect SQLITE -sql " SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CIMETIERE -------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
CASE
  WHEN name IS NOT NULL THEN name
  ELSE 'NC'
END AS "NATURE",
-----------------------------------------
CASE name
  WHEN '%militaire%' THEN 'Militaire'
  WHEN '%Militaire%' THEN 'Militaire'
  ELSE 'Autre'
END AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE landuse='cemetery' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/E_OSM_BATI/CIMETIERE_osmconf.ini'
echo fin
