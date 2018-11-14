echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/CHEMIN.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CHEMIN ----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
CASE highway
  WHEN 'steps' THEN 'Escalier'
  WHEN 'cycleway' THEN 'Piste cyclable'
  WHEN 'track' THEN 'Chemin'
  WHEN 'path' THEN 'Sentier'
  ELSE 'NC'
END AS "NATURE"
-----------------------------------------
FROM lines WHERE (highway='path' OR highway='track' OR highway='cycleway' OR highway='steps') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/CHEMIN_osmconf.ini'
echo fin
