#!/bin/bash

echo "Debut : D_OSM_HYDROGRAPHIE > SURFACE_EAU_bassin.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_bassin.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Bassin ----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id) AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
'Bassin' AS "NATURE",
-----------------------------------------
CASE
  WHEN name IS NOT NULL THEN name
  ELSE 'NC'
END AS "NOM",
-----------------------------------------
CASE
  WHEN intermittent='yes' THEN 'Intermittent'
  ELSE ''
END AS "REGIME",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE landuse='basin' AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/D_OSM_HYDROGRAPHIE/SURFACE_EAU_osmconf.ini'
echo "Fin : D_OSM_HYDROGRAPHIE > SURFACE_EAU_bassin.shp"