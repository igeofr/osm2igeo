echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_hospitalier.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Etabliseement hospitalier ---------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Etablissemment hospitalier' AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE amenity='social_facility' AND (social_facility='group_home' OR social_facility='assisted_living') AND social_facility_for='senior' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
-----------------------------------------
UNION
-----------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Etablissemment hospitalier' AS "NATURE"
-----------------------------------------
FROM points WHERE amenity='social_facility' AND (social_facility='group_home' OR social_facility='assisted_living') AND social_facility_for='senior' AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_osmconf.ini'
echo fin
