echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/E_OSM_BATI/BATI.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ BATI ------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE building
----------------------------------------- Bâtiment indifférencié ---------------------------------------------
  WHEN 'yes' THEN 'Bâtiment indifférencié'
  WHEN 'detached' THEN 'Bâtiment indifférencié'
  WHEN 'farm' THEN 'Bâtiment indifférencié'
  WHEN 'farmhouse' THEN 'Bâtiment indifférencié'
  WHEN 'garage' THEN 'Bâtiment indifférencié'
  WHEN 'garages' THEN 'Bâtiment indifférencié'
  WHEN 'house' THEN 'Bâtiment indifférencié'
  WHEN 'residential' THEN 'Bâtiment indifférencié'
  WHEN 'terrace' THEN 'Bâtiment indifférencié'
  WHEN 'villa' THEN 'Bâtiment indifférencié'
----------------------------------------- Bâtiment collectif -----------------------------------------------
  WHEN 'apartments' THEN 'Bâtiment collectif'
----------------------------------------- Bâtiment agricole --------------------------------------------------
  WHEN 'agricole' THEN 'Bâtiment agricole'
  WHEN 'farm_auxiliary' THEN 'Bâtiment agricole'
  WHEN 'barn' THEN 'Grange'
  WHEN 'stable' THEN 'Ecurie'
  WHEN 'glasshouse' THEN 'Serre'
  WHEN 'greenhouse' THEN 'Serre'
----------------------------------------- Bâtiment public ----------------------------------------------------
  WHEN 'civic' THEN 'Bâtiment public'
  WHEN 'public' THEN 'Bâtiment public'
  WHEN 'toilets' THEN 'Bâtiment public'
  WHEN 'library' THEN 'Bâtiment public'
----------------------------------------- Bâtiment sportif ----------------------------------------------------
  WHEN 'gymnasium' THEN 'Bâtiment sportif'
  WHEN 'sport' THEN 'Bâtiment sportif'
  WHEN 'stadium' THEN 'Bâtiment sportif'
----------------------------------------- Services ----------------------------------------------------
  WHEN 'school'     THEN 'Bâtiment scolaire'
  WHEN 'university'     THEN 'Bâtiment scolaire'
  WHEN 'hospital' THEN 'Bâtiment hospitalier'
  WHEN 'dormitory'  THEN 'Résidence universitaire ou foyer'
----------------------------------------- Bâtiment religieux -------------------------------------------------
  WHEN 'church' THEN  'Bâtiment religieux'
  WHEN 'chapel' THEN  'Bâtiment religieux'
  WHEN 'cathedral' THEN  'Bâtiment religieux'
  WHEN 'cloister' THEN  'Bâtiment religieux'
  WHEN 'convent' THEN  'Bâtiment religieux'
  WHEN 'monastery' THEN  'Bâtiment religieux'
  WHEN 'temple' THEN 'Bâtiment religieux'
----------------------------------------- Bâtiment commercial -------------------------------------------------
  WHEN 'commercial' THEN 'Bâtiment commercial'
  WHEN 'shop' THEN 'Bâtiment commercial'
  WHEN 'retail' THEN 'Bâtiment commercial'
  WHEN 'store' THEN 'Bâtiment commercial'
  WHEN 'supermarket' THEN 'Bâtiment commercial'
----------------------------------------- Bâtiment industriel -------------------------------------------------
  WHEN 'factory' THEN 'Bâtiment industriel'
  WHEN 'industrial' THEN 'Bâtiment industriel'
  WHEN 'manufacture' THEN 'Bâtiment industriel'
----------------------------------------- Bureaux -------------------------------------------------------------
  WHEN 'office' THEN 'Bureaux'
----------------------------------------- Divers - Activité -------------------------------------------------------------
  WHEN 'restaurant' THEN 'Restaurant'
  WHEN 'warehouse' THEN 'Entrepôt'
  WHEN 'service'    THEN 'Bâtiment de service'
  WHEN 'transformer_tower' THEN 'Bâtiment de service'
----------------------------------------- Transports -----------------------------------------------------------
  WHEN 'station' THEN 'Gare ferroviaire'
  WHEN 'train_station' THEN 'Gare ferroviaire'
  WHEN 'transportation' THEN 'Bâtiments des transports publics'
  WHEN 'hangar' THEN 'Bâtiment aéroportuaire'
----------------------------------------- Hôtel ----------------------------------------------------------------
  WHEN 'hostel' THEN 'Hôtel'
  WHEN 'hotel' THEN 'Hôtel'
----------------------------------------- Bâtiment historique --------------------------------------------------
  WHEN 'castle' THEN 'Bâtiment historique'
  WHEN 'historic' THEN 'Bâtiment historique'
----------------------------------------- Bâtiment léger -------------------------------------------------------
  WHEN 'shed'       THEN 'Bâtiment léger'
  WHEN 'shelter'    THEN 'Bâtiment léger'
----------------------------------------- Divers ---------------------------------------------------------------
  WHEN 'alpine_hut' THEN 'Refuge de montagne'
  WHEN 'atelier' THEN 'Atelier'
  WHEN 'bridge' THEN 'Bâtiment utilisé comme pont'
  WHEN 'bunker' THEN 'Bâtiment militaire'
  WHEN 'bungalow' THEN 'Bungalow'
  WHEN 'cabin' THEN 'Cabane'
  WHEN 'chalet' THEN 'Chalet'
  WHEN 'hut' THEN 'Hute'
  WHEN 'roof' THEN 'Bâtiment ouvert'
  WHEN 'construction' THEN 'Bâtiment en construction'
  WHEN 'dovecote' THEN 'Colombier'
  WHEN 'kindergarten' THEN 'Jardin d enfant'
  WHEN 'static_caravan' THEN 'Bâtiment semi-permanent'
----------------------------------------- Ruine/abandon ---------------------------------------------------------------
  WHEN 'abandonned' THEN 'Bâtiment abandonné'
  WHEN 'collapsed' THEN 'Ruine'
  WHEN 'ruin' THEN 'Ruine'
  WHEN 'ruins' THEN 'Ruine'
-----------------------------------------
  ELSE 'NC'
-----------------------------------------
END AS "NATURE"
-----------------------------------------
FROM multipolygons WHERE building IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_MAX_TMPFILE_SIZE=2048 --config OSM_CONFIG_FILE 'Scripts/E_OSM_BATI/BATI_osmconf.ini'
echo fin
