echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_parking.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Parking ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
REPLACE(amenity,'parking','Parking') AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE amenity='parking' AND round((st_area(st_transform(GEOMETRY,2154))/10000),2)>0.5 AND IsValid(GEOMETRY)=1 AND name IS NOT NULL
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo fin
