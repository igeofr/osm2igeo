echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/D_OSM_HYDROGRAPHIE/TRONCON_COURS_EAU.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ TRONCON COURS EAU ---------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN waterway='river' THEN 'Non'
  WHEN waterway='canal' THEN 'Oui'
  WHEN waterway='stream' THEN 'Non'
  ELSE 'NC'
END AS "ARTIF",
-----------------------------------------
CASE
  WHEN name IS NOT NULL THEN name
  ELSE 'NC'
END AS "NOM"
-----------------------------------------
FROM lines WHERE waterway='river' OR waterway='canal' OR waterway='stream' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/D_OSM_HYDROGRAPHIE/TRONCON_COURS_EAU_osmconf.ini'
echo fin
