#!/bin/bash

echo "Debut : X_OSM_TOPO > TOPO_POI_borne_geodesique.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/X_OSM_TOPO/TOPO_POI/TOPO_POI_borne_geodesique.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Borne geodésique ------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'n'|| osm_id AS ID,
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Borne géodésique' AS "NATURE",
-----------------------------------------
'' AS "ELEV",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE man_made='survey_point' AND ref LIKE '%- A' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/X_OSM_TOPO/TOPO_POI_osmconf.ini'
echo "Fin : X_OSM_TOPO > TOPO_POI_borne_geodesique.shp"
