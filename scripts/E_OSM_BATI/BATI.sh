#!/bin/bash

echo "Debut : E_OSM_BATI > BATI.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/E_OSM_BATI/BATI.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ BATI ------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
----------------------------------------- Bâtiment indifférencié ---------------------------------------------
  WHEN building='yes' THEN 'Bâtiment indifférencié'
  WHEN building='detached' THEN 'Bâtiment indifférencié'
  WHEN building='farm' THEN 'Bâtiment indifférencié'
  WHEN building='farmhouse' THEN 'Bâtiment indifférencié'
  WHEN building='garage' THEN 'Bâtiment indifférencié'
  WHEN building='garages' THEN 'Bâtiment indifférencié'
  WHEN building='house' THEN 'Bâtiment indifférencié'
  WHEN building='residential' THEN 'Bâtiment indifférencié'
  WHEN building='terrace' THEN 'Bâtiment indifférencié'
  WHEN building='villa' THEN 'Bâtiment indifférencié'
----------------------------------------- Bâtiment collectif -----------------------------------------------
  WHEN building='apartments' THEN 'Bâtiment collectif'
----------------------------------------- Bâtiment agricole --------------------------------------------------
  WHEN building='agricole' THEN 'Bâtiment agricole'
  WHEN building='farm_auxiliary' THEN 'Bâtiment agricole'
  WHEN building='barn' THEN 'Grange'
  WHEN building='stable' THEN 'Ecurie'
  WHEN building='glasshouse' THEN 'Serre'
  WHEN building='greenhouse' THEN 'Serre'
----------------------------------------- Bâtiment public ----------------------------------------------------
  WHEN building='civic'AND amenity!='townhall' THEN 'Bâtiment public'
  WHEN building='civic'AND amenity='townhall' THEN 'Mairie'
  WHEN building='public' THEN 'Bâtiment public'
  WHEN building='toilets' THEN 'Bâtiment public'
  WHEN building='library' THEN 'Bâtiment public'
----------------------------------------- Bâtiment sportif ----------------------------------------------------
  WHEN building='gymnasium' THEN 'Bâtiment sportif'
  WHEN building='sport' THEN 'Bâtiment sportif'
  WHEN building='stadium' THEN 'Bâtiment sportif'
----------------------------------------- Services ----------------------------------------------------
  WHEN building='school' THEN 'Bâtiment scolaire'
  WHEN building='university' THEN 'Bâtiment scolaire'
  WHEN building='hospital' THEN 'Bâtiment hospitalier'
  WHEN building='dormitory'  THEN 'Résidence universitaire ou foyer'
----------------------------------------- Bâtiment religieux -------------------------------------------------
  WHEN building='church' THEN  'Bâtiment religieux'
  WHEN building='chapel' THEN  'Bâtiment religieux'
  WHEN building='cathedral' THEN  'Bâtiment religieux'
  WHEN building='cloister' THEN  'Bâtiment religieux'
  WHEN building='convent' THEN  'Bâtiment religieux'
  WHEN building='monastery' THEN  'Bâtiment religieux'
  WHEN building='temple' THEN 'Bâtiment religieux'
----------------------------------------- Bâtiment commercial -------------------------------------------------
  WHEN building='commercial' THEN 'Bâtiment commercial'
  WHEN building='shop' THEN 'Bâtiment commercial'
  WHEN building='retail' THEN 'Bâtiment commercial'
  WHEN building='store' THEN 'Bâtiment commercial'
  WHEN building='supermarket' THEN 'Bâtiment commercial'
----------------------------------------- Bâtiment industriel -------------------------------------------------
  WHEN building='factory' THEN 'Bâtiment industriel'
  WHEN building='industrial' THEN 'Bâtiment industriel'
  WHEN building='manufacture' THEN 'Bâtiment industriel'
----------------------------------------- Bureaux -------------------------------------------------------------
  WHEN building='office' THEN 'Bureaux'
----------------------------------------- Divers - Activité -------------------------------------------------------------
  WHEN building='restaurant' THEN 'Restaurant'
  WHEN building='warehouse' THEN 'Entrepôt'
  WHEN building='service'    THEN 'Bâtiment de service'
  WHEN building='transformer_tower' THEN 'Bâtiment de service'
----------------------------------------- Transports -----------------------------------------------------------
  WHEN building='station' THEN 'Gare ferroviaire'
  WHEN building='train_station' THEN 'Gare ferroviaire'
  WHEN building='transportation' THEN 'Bâtiments des transports publics'
  WHEN building='hangar' THEN 'Bâtiment aéroportuaire'
----------------------------------------- Hôtel ----------------------------------------------------------------
  WHEN building='hostel' THEN 'Hôtel'
  WHEN building='hotel' THEN 'Hôtel'
----------------------------------------- Bâtiment historique --------------------------------------------------
  WHEN building='castle' THEN 'Bâtiment historique'
  WHEN building='historic' THEN 'Bâtiment historique'
----------------------------------------- Bâtiment léger -------------------------------------------------------
  WHEN building='shed' THEN 'Bâtiment léger'
  WHEN building='shelter' THEN 'Bâtiment léger'
----------------------------------------- Divers ---------------------------------------------------------------
  WHEN building='alpine_hut' THEN 'Refuge de montagne'
  WHEN building='atelier' THEN 'Atelier'
  WHEN building='bridge' THEN 'Bâtiment utilisé comme pont'
  WHEN building='bunker' THEN 'Bâtiment militaire'
  WHEN building='bungalow' THEN 'Bungalow'
  WHEN building='cabin' THEN 'Cabane'
  WHEN building='chalet' THEN 'Chalet'
  WHEN building='hut' THEN 'Hute'
  WHEN building='roof' THEN 'Bâtiment ouvert'
  WHEN building='construction' THEN 'Bâtiment en construction'
  WHEN building='dovecote' THEN 'Colombier'
  WHEN building='kindergarten' THEN 'Jardin d enfant'
  WHEN building='static_caravan' THEN 'Bâtiment semi-permanent'
----------------------------------------- Ruine/abandon ---------------------------------------------------------------
  WHEN building='abandonned' THEN 'Bâtiment abandonné'
  WHEN building='collapsed' THEN 'Ruine'
  WHEN building='ruin' THEN 'Ruine'
  WHEN building='ruins' THEN 'Ruine'
-----------------------------------------
  ELSE 'NC'
-----------------------------------------
END AS "NATURE",
-----------------------------------------
CASE
  WHEN religion='christian' AND denomination='catholic' THEN 'Culte catholique'
  WHEN religion='muslim' THEN 'Culte islamique'
  WHEN religion='jewish' THEN 'Culte israélite'
  WHEN religion='christian' AND denomination='orthodox' THEN 'Culte orthodoxe'
  WHEN religion='christian' AND denomination='protestant' THEN 'Culte protestant'
END AS "RELIGIEUX",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE building IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR data_tmp/ --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE scripts/E_OSM_BATI/BATI_osmconf.ini
echo "Fin : E_OSM_BATI > BATI.shp"
