echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_parking.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Parking ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
REPLACE(amenity,'parking','Parking') AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE amenity='parking' AND round((st_area(st_transform(GEOMETRY,"$OUT_EPSG"))/10000),2)>0.05 AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_osmconf.ini'
echo fin
