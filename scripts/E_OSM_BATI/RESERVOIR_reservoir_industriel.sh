#!/bin/bash

echo "Debut : E_OSM_BATI > RESERVOIR_reservoir_d_eau.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/E_OSM_BATI/RESERVOIR/RESERVOIR_reservoir_d_eau.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ Réservoir industriel --------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
CASE
  WHEN man_made='gasometer' THEN 'Réservoir industriel'
  WHEN man_made='hot_water_tank' THEN 'Réservoir industriel'
  WHEN man_made='silo' THEN 'Réservoir industriel'
  WHEN man_made='storage_tank' THEN 'Réservoir industriel'
  ELSE 'NC'
END AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE (man_made='gasometer' OR man_made='hot_water_tank' OR man_made='silo' OR man_made='storage_tank') AND IsValid(GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/E_OSM_BATI/RESERVOIR_osmconf.ini'
echo "Fin : E_OSM_BATI > RESERVOIR_reservoir_d_eau.shp"
