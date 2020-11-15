#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
#------------------------------------------------------------------------------------------------------------
var_group=E_OSM_BATI
var_file=BATI
#------------------------------------------------------------------------------------------------------------
#------------------------------------ BATI ------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
export requete="SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
ST_Buffer(GEOMETRY,0) AS "GEOMETRY",
-----------------------------------------
CASE
-----------------------------------------
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
-----------------------------------------
  WHEN building='apartments' THEN 'Bâtiment collectif'
-----------------------------------------
  WHEN building='agricole' THEN 'Bâtiment agricole'
  WHEN building='farm_auxiliary' THEN 'Bâtiment agricole'
  WHEN building='barn' THEN 'Grange'
  WHEN building='stable' THEN 'Ecurie'
  WHEN building='glasshouse' THEN 'Serre'
  WHEN building='greenhouse' THEN 'Serre'
-----------------------------------------
  WHEN building='civic'AND amenity!='townhall' THEN 'Bâtiment public'
  WHEN building='civic'AND amenity='townhall' THEN 'Mairie'
  WHEN building='public' THEN 'Bâtiment public'
  WHEN building='toilets' THEN 'Bâtiment public'
  WHEN building='library' THEN 'Bâtiment public'
-----------------------------------------
  WHEN building='gymnasium' THEN 'Bâtiment sportif'
  WHEN building='sport' THEN 'Bâtiment sportif'
  WHEN building='stadium' THEN 'Bâtiment sportif'
-----------------------------------------
  WHEN building='school' THEN 'Bâtiment scolaire'
  WHEN building='university' THEN 'Bâtiment scolaire'
  WHEN building='hospital' THEN 'Bâtiment hospitalier'
  WHEN building='dormitory'  THEN 'Résidence universitaire ou foyer'
-----------------------------------------
  WHEN building='church' THEN  'Bâtiment religieux'
  WHEN building='chapel' THEN  'Bâtiment religieux'
  WHEN building='cathedral' THEN  'Bâtiment religieux'
  WHEN building='cloister' THEN  'Bâtiment religieux'
  WHEN building='convent' THEN  'Bâtiment religieux'
  WHEN building='monastery' THEN  'Bâtiment religieux'
  WHEN building='temple' THEN 'Bâtiment religieux'
-----------------------------------------
  WHEN building='commercial' THEN 'Bâtiment commercial'
  WHEN building='shop' THEN 'Bâtiment commercial'
  WHEN building='retail' THEN 'Bâtiment commercial'
  WHEN building='store' THEN 'Bâtiment commercial'
  WHEN building='supermarket' THEN 'Bâtiment commercial'
-----------------------------------------
  WHEN building='factory' THEN 'Bâtiment industriel'
  WHEN building='industrial' THEN 'Bâtiment industriel'
  WHEN building='manufacture' THEN 'Bâtiment industriel'
-----------------------------------------
  WHEN building='office' THEN 'Bureaux'
-----------------------------------------
  WHEN building='restaurant' THEN 'Restaurant'
  WHEN building='warehouse' THEN 'Entrepôt'
  WHEN building='service'    THEN 'Bâtiment de service'
  WHEN building='transformer_tower' THEN 'Bâtiment de service'
-----------------------------------------
  WHEN building='station' THEN 'Gare ferroviaire'
  WHEN building='train_station' THEN 'Gare ferroviaire'
  WHEN building='transportation' THEN 'Bâtiments des transports publics'
  WHEN building='hangar' THEN 'Bâtiment aéroportuaire'
-----------------------------------------
  WHEN building='hostel' THEN 'Hôtel'
  WHEN building='hotel' THEN 'Hôtel'
-----------------------------------------
  WHEN building='castle' THEN 'Bâtiment historique'
  WHEN building='historic' THEN 'Bâtiment historique'
-----------------------------------------
  WHEN building='shed' THEN 'Bâtiment léger'
  WHEN building='shelter' THEN 'Bâtiment léger'
-----------------------------------------
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
-----------------------------------------
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
FROM multipolygons WHERE building IS NOT NULL AND ST_IsValid(ST_Buffer(GEOMETRY,0))"
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
if [ "$FORMAT_SIG" = "SHP" ]
then
  echo "Debut : $var_group > $var_file.shp"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.shp' -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file.shp"
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'.gpkg' -nln $var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f PGDump 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.sql' -nln $var_group'_'$var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN --config PG_USE_COPY YES --debug ON -skipfailures -lco SRID=2154 -lco SCHEMA=osm2igeo -lco GEOMETRY_NAME=geom -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
