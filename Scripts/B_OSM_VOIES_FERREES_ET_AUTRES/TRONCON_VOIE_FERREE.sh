echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TRONCON_VOIE_FERREE.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ TRONCON VOIE FERREE ---------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN railway='disused' THEN 'Voie non exploitée'
  WHEN railway='construction' THEN 'En construction'
  WHEN railway='funicular' THEN 'Funiculaire'
  WHEN railway='light_rail' THEN 'Train-tram'
  WHEN railway='miniature' THEN 'Miniature'
  WHEN railway='monorail' THEN 'Monorail'
  WHEN railway='narrow_gauge' THEN 'Voie étroite'
  WHEN railway='rail' THEN 'Ligne principale'
  WHEN railway='preserved' THEN 'Voie préservée'
  WHEN railway='tram' THEN 'Tramway'
  ELSE 'NC'
END AS "NATURE",
-----------------------------------------
CASE
  WHEN tunnel='yes' THEN 'Tunnel'
  WHEN bridge='yes' THEN 'Pont'
  WHEN bridge='viaduct' THEN 'Pont'
  ELSE 'NC'
END AS "FRANCHISST",
-----------------------------------------
CASE
  WHEN electrified='contact_line' THEN 'Electrique'
  WHEN electrified='rail' THEN 'Electrique'
  WHEN electrified='yes' THEN 'Electrique'
  WHEN electrified='electrified' THEN 'Electrique'
  WHEN electrified='no' THEN 'Non électrique'
  ELSE 'NC'
END AS "ELECTRIFIE"
-----------------------------------------
FROM lines WHERE railway <>'abandoned' AND railway<>'razed' AND railway<>'dismantled' AND railway<>'platform' AND railway<>'level_crossing' AND railway<>'turntable'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TRONCON_VOIE_FERREE_osmconf.ini'
echo fin
