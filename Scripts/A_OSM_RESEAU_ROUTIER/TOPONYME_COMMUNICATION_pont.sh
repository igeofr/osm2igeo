echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_pont.shp' -dialect SQLITE -sql "
------------------------------------------------------------------------------------------------------------
------------------------------------ Pont ------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id  AS "ID",
-----------------------------------------
centroid(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
CASE
  WHEN bridge IS NOT NULL THEN 'Pont'
  ELSE ''
END AS "NATURE"
-----------------------------------------
FROM lines WHERE bridge IS NOT NULL AND IsValid(GEOMETRY)=1 AND (name LIKE 'Pont%' OR name LIKE 'Passerelle%' OR name LIKE 'Le Pont%' OR name LIKE 'Viaduc%')
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo fin
