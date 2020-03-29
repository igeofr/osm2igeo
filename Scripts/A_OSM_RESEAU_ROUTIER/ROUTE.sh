#!/bin/bash

echo "Debut : A_OSM_RESEAU_ROUTIER > ROUTE.shp"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/A_OSM_RESEAU_ROUTIER/ROUTE.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ ROUTE -----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE highway
  WHEN 'motorway' THEN 'Autoroute'
  WHEN 'trunk' THEN 'Voie rapide'
  WHEN 'primary' THEN 'Route primaire'
  WHEN 'secondary' THEN 'Route secondaire'
  WHEN 'tertiary' THEN 'Route tertiaire'
  WHEN 'residential' THEN 'Route résidentielle'
  WHEN 'unclassified' THEN 'Route non classifiée'
  WHEN 'service' THEN 'Route d accès'
  WHEN 'motorway_link' THEN 'Bretelle autoroute'
  WHEN 'trunk_link' THEN 'Bretelle voie rapide'
  WHEN 'primary_link' THEN 'Bretelle route primaire'
  WHEN 'secondary_link' THEN 'Bretelle route secondaire'
  WHEN 'tertiary_link' THEN 'Bretelle route tertiaire'
  WHEN 'living_street' THEN 'Zone de rencontre'
  WHEN 'pedestrian' THEN 'Rue piétonne'
  WHEN 'track' THEN 'Chemin carrossable'
  WHEN 'bus_guideway' THEN 'Voie de bus'
  WHEN 'raceway' THEN 'Piste de circuit'
  WHEN 'road' THEN 'Inconnu'
  WHEN 'footway' THEN 'Voie piétonne'
  WHEN 'cycleway' THEN 'Voie cyclable'
  WHEN 'bridleway' THEN 'Chemin équestre'
  WHEN 'steps' THEN 'Escaliers'
  WHEN 'path' THEN 'Chemin non carrossable'
  WHEN 'proposed' THEN 'Route en projet'
  WHEN 'construction' THEN 'Route en construction'
  ELSE 'NC'
END AS "NATURE",
-----------------------------------------
CASE
  WHEN ref IS NOT NULL THEN ref
  ELSE 'NC'
END AS "NUMERO",
-----------------------------------------
CASE
  WHEN name IS NOT NULL THEN name
  ELSE 'NC'
END AS "NOM",
-----------------------------------------
CASE
  WHEN substr(ref,1,2)='D' THEN 'Départementale'
  WHEN substr(ref,2,2)='N' THEN 'Nationale'
  WHEN substr(ref,1,2)='A' THEN 'Autoroute'
  ELSE 'Autre'
END AS "CL_ADMIN",
-----------------------------------------
CASE
  WHEN operator IS NOT NULL THEN operator
  ELSE 'NC'
END AS "GESTION",
-----------------------------------------
CASE
  WHEN tunnel='yes' THEN 'Tunnel'
  WHEN bridge='yes' THEN 'Pont'
  WHEN ford='yes' THEN 'Gué'
  WHEN ice_road='yes' THEN 'Route potentiellement gelée'
  ELSE 'NC'
END AS "FRANCHISST",
-----------------------------------------
CASE
  WHEN width IS NOT NULL THEN width
  ELSE 'NC'
END AS "LARGEUR",
-----------------------------------------
CASE
  WHEN lanes IS NOT NULL THEN lanes
  ELSE 'NC'
END AS "NB_VOIES",
-----------------------------------------
CASE
  WHEN maxspeed IS NOT NULL THEN maxspeed
  ELSE 'NC'
END AS "VIT_MAX",
-----------------------------------------
CASE
  WHEN maxheight IS NOT NULL THEN maxheight
  ELSE 'NC'
END AS "HAUT_MAX",
-----------------------------------------
CASE
  WHEN maxweight IS NOT NULL THEN maxweight
  ELSE 'NC'
END AS "POID_MAX",
-----------------------------------------
CASE
  WHEN oneway='yes' THEN 'Unique (Sens de la voie)'
  WHEN oneway='no' THEN 'Unique (Sens inverse de la voie)'
  WHEN oneway='yes' THEN 'Inverse'
  WHEN oneway='reversible' THEN 'Réversible'
  ELSE 'NC'
END AS "SENS",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE (highway='motorway' OR highway='trunk' OR highway='primary' OR highway='secondary' OR highway='tertiary' OR highway='residential' OR highway='unclassified' OR highway='service' OR highway='motorway_link'OR highway='trunk_link' OR highway='primary_link' OR highway='secondary_link' OR highway='tertiary_link' OR highway='living_street' OR highway='pedestrian' OR highway='track' OR highway='bus_guideway' OR highway='raceway' OR highway='road' OR highway='footway' OR highway='cycleway' OR highway='bridleway' OR highway='steps' OR highway='path' OR highway='proposed' OR highway='construction') AND IsValid(GEOMETRY)=1

)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/A_OSM_RESEAU_ROUTIER/ROUTE_osmconf.ini'
echo "Fin : A_OSM_RESEAU_ROUTIER > ROUTE.shp"
