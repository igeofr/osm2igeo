echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_halte_ferroviaire.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Halte ferroviaire -----------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
REPLACE(railway,'halt','Halte ferroviaire') AS "NATURE"
-----------------------------------------
FROM points WHERE railway ='halt' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_osmconf.ini'
echo fin
