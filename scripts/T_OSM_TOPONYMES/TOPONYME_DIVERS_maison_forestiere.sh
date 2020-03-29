#!/bin/bash

echo "Debut : T_OSM_TOPONYMES > TOPONYME_DIVERS_maison_forestiere.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_maison_forestiere.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Maison forestière -----------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
st_pointonsurface(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
'Maison forestière' AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE building='yes' AND (name LIKE '%Maison Forestière%' OR name LIKE '%maison forestière%' OR name LIKE '%Maison forestière%') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_osmconf.ini'
echo "Fin : T_OSM_TOPONYMES > TOPONYME_DIVERS_maison_forestiere.shp"
