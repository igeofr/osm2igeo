#!/bin/bash

echo "Debut : A_OSM_RESEAU_ROUTIER > TOPONYME_COMMUNICATION_pont.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_pont.shp' -dialect SQLITE -sql "
------------------------------------------------------------------------------------------------------------
------------------------------------ Pont ------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
'w'||osm_id  AS "ID",
-----------------------------------------
centroid(GEOMETRY) AS "GEOMETRY",
-----------------------------------------
name as "NOM",
-----------------------------------------
CASE
  WHEN bridge IS NOT NULL THEN 'Pont'
  ELSE ''
END AS "NATURE",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM lines WHERE bridge IS NOT NULL AND IsValid(GEOMETRY)=1 AND (name LIKE 'Pont%' OR name LIKE 'Passerelle%' OR name LIKE 'Le Pont%' OR name LIKE 'Viaduc%')
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_osmconf.ini'
echo "Fin : A_OSM_RESEAU_ROUTIER > TOPONYME_COMMUNICATION_pont.shp"
