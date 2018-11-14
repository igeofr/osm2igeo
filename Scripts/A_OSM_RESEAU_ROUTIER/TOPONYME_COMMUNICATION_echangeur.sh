echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_echangeur.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Echangeur -------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN ref IS NOT NULL AND name IS NOT NULL THEN ref||'-'||name
  WHEN ref IS NOT NULL AND name IS NULL THEN ref
  WHEN ref IS NULL AND name IS NOT NULL THEN name
  ELSE 'NC'
END AS "NOM",
-----------------------------------------
REPLACE(highway,'motorway_junction','Echangeur') AS "NATURE"
-----------------------------------------
FROM points WHERE highway='motorway_junction' AND IsValid(GEOMETRY)=1 AND (name IS NOT NULL OR ref IS NOT NULL)
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo fin
