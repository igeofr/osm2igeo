#!/bin/bash

echo "Debut : T_OSM_TOPONYMES > LIEU_DIT_HABITE_lieu_dit_habite.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_lieu_dit_habite.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Lieu-dit habité -------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Lieu-dit habité' AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE (place='hamlet' OR place='isolated_dwelling') AND name IS NOT NULL AND IsValid(GEOMETRY)=1
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
'Lieu-dit habité' AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM points WHERE (place='hamlet' OR place='isolated_dwelling') AND name IS NOT NULL AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_osmconf.ini'
echo "Fin : T_OSM_TOPONYMES > LIEU_DIT_HABITE_lieu_dit_habite.shp"