#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr

echo "Debut : H_OSM_ADMINISTRATIF > CHEF_LIEU_boundary.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU_boundary.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CHEF LIEU boundary -------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
geometry,
name,
addr_postcode,
postal_code,
ref_FR_SIREN
-----------------------------------------
FROM multipolygons AS m WHERE (m.boundary='administrative' AND (m.admin_level='8' OR m.admin_level='9')) AND ST_IsValid(ST_Buffer(GEOMETRY,0)) AND (SUBSTR(m.addr_postcode,1,2)='01' OR SUBSTR(m.addr_postcode,1,2)='02' OR SUBSTR(m.addr_postcode,1,2)='03' OR SUBSTR(m.addr_postcode,1,2)='04' OR SUBSTR(m.addr_postcode,1,2)='05' OR SUBSTR(m.addr_postcode,1,2)='06' OR SUBSTR(m.addr_postcode,1,2)='07' OR SUBSTR(m.addr_postcode,1,2)='08' OR SUBSTR(m.addr_postcode,1,2)='09' OR SUBSTR(m.addr_postcode,1,2)='10' OR SUBSTR(m.addr_postcode,1,2)='11' OR SUBSTR(m.addr_postcode,1,2)='12' OR SUBSTR(m.addr_postcode,1,2)='13' OR SUBSTR(m.addr_postcode,1,2)='14' OR SUBSTR(m.addr_postcode,1,2)='15' OR SUBSTR(m.addr_postcode,1,2)='16' OR SUBSTR(m.addr_postcode,1,2)='17' OR SUBSTR(m.addr_postcode,1,2)='18' OR SUBSTR(m.addr_postcode,1,2)='19' OR SUBSTR(m.addr_postcode,1,2)='20' OR SUBSTR(m.addr_postcode,1,2)='21' OR SUBSTR(m.addr_postcode,1,2)='22' OR SUBSTR(m.addr_postcode,1,2)='23' OR SUBSTR(m.addr_postcode,1,2)='24' OR SUBSTR(m.addr_postcode,1,2)='25' OR SUBSTR(m.addr_postcode,1,2)='26' OR SUBSTR(m.addr_postcode,1,2)='27' OR SUBSTR(m.addr_postcode,1,2)='28' OR SUBSTR(m.addr_postcode,1,2)='29' OR SUBSTR(m.addr_postcode,1,2)='30' OR SUBSTR(m.addr_postcode,1,2)='31' OR SUBSTR(m.addr_postcode,1,2)='32' OR SUBSTR(m.addr_postcode,1,2)='33' OR SUBSTR(m.addr_postcode,1,2)='34' OR SUBSTR(m.addr_postcode,1,2)='35' OR SUBSTR(m.addr_postcode,1,2)='36' OR SUBSTR(m.addr_postcode,1,2)='37' OR SUBSTR(m.addr_postcode,1,2)='38' OR SUBSTR(m.addr_postcode,1,2)='39' OR SUBSTR(m.addr_postcode,1,2)='40' OR SUBSTR(m.addr_postcode,1,2)='41' OR SUBSTR(m.addr_postcode,1,2)='42' OR SUBSTR(m.addr_postcode,1,2)='43' OR SUBSTR(m.addr_postcode,1,2)='44' OR SUBSTR(m.addr_postcode,1,2)='45' OR SUBSTR(m.addr_postcode,1,2)='46' OR SUBSTR(m.addr_postcode,1,2)='47' OR SUBSTR(m.addr_postcode,1,2)='48' OR SUBSTR(m.addr_postcode,1,2)='49' OR SUBSTR(m.addr_postcode,1,2)='50' OR SUBSTR(m.addr_postcode,1,2)='51' OR SUBSTR(m.addr_postcode,1,2)='52' OR SUBSTR(m.addr_postcode,1,2)='53' OR SUBSTR(m.addr_postcode,1,2)='54' OR SUBSTR(m.addr_postcode,1,2)='55' OR SUBSTR(m.addr_postcode,1,2)='56' OR SUBSTR(m.addr_postcode,1,2)='57' OR SUBSTR(m.addr_postcode,1,2)='58' OR SUBSTR(m.addr_postcode,1,2)='59' OR SUBSTR(m.addr_postcode,1,2)='60' OR SUBSTR(m.addr_postcode,1,2)='61' OR SUBSTR(m.addr_postcode,1,2)='62' OR SUBSTR(m.addr_postcode,1,2)='63' OR SUBSTR(m.addr_postcode,1,2)='64' OR SUBSTR(m.addr_postcode,1,2)='65' OR SUBSTR(m.addr_postcode,1,2)='66' OR SUBSTR(m.addr_postcode,1,2)='67' OR SUBSTR(m.addr_postcode,1,2)='68' OR SUBSTR(m.addr_postcode,1,2)='69' OR SUBSTR(m.addr_postcode,1,2)='70' OR SUBSTR(m.addr_postcode,1,2)='71' OR SUBSTR(m.addr_postcode,1,2)='72' OR SUBSTR(m.addr_postcode,1,2)='73' OR SUBSTR(m.addr_postcode,1,2)='74' OR SUBSTR(m.addr_postcode,1,2)='75' OR SUBSTR(m.addr_postcode,1,2)='76' OR SUBSTR(m.addr_postcode,1,2)='77' OR SUBSTR(m.addr_postcode,1,2)='78' OR SUBSTR(m.addr_postcode,1,2)='79' OR SUBSTR(m.addr_postcode,1,2)='80' OR SUBSTR(m.addr_postcode,1,2)='81' OR SUBSTR(m.addr_postcode,1,2)='82' OR SUBSTR(m.addr_postcode,1,2)='83' OR SUBSTR(m.addr_postcode,1,2)='84' OR SUBSTR(m.addr_postcode,1,2)='85' OR SUBSTR(m.addr_postcode,1,2)='86' OR SUBSTR(m.addr_postcode,1,2)='87' OR SUBSTR(m.addr_postcode,1,2)='88' OR SUBSTR(m.addr_postcode,1,2)='89' OR SUBSTR(m.addr_postcode,1,2)='90' OR SUBSTR(m.addr_postcode,1,2)='91' OR SUBSTR(m.addr_postcode,1,2)='92' OR SUBSTR(m.addr_postcode,1,2)='93' OR SUBSTR(m.addr_postcode,1,2)='94' OR SUBSTR(m.addr_postcode,1,2)='95' OR SUBSTR(m.postal_code,1,2)='01' OR SUBSTR(m.postal_code,1,2)='02' OR SUBSTR(m.postal_code,1,2)='03' OR SUBSTR(m.postal_code,1,2)='04' OR SUBSTR(m.postal_code,1,2)='05' OR SUBSTR(m.postal_code,1,2)='06' OR SUBSTR(m.postal_code,1,2)='07' OR SUBSTR(m.postal_code,1,2)='08' OR SUBSTR(m.postal_code,1,2)='09' OR SUBSTR(m.postal_code,1,2)='10' OR SUBSTR(m.postal_code,1,2)='11' OR SUBSTR(m.postal_code,1,2)='12' OR SUBSTR(m.postal_code,1,2)='13' OR SUBSTR(m.postal_code,1,2)='14' OR SUBSTR(m.postal_code,1,2)='15' OR SUBSTR(m.postal_code,1,2)='16' OR SUBSTR(m.postal_code,1,2)='17' OR SUBSTR(m.postal_code,1,2)='18' OR SUBSTR(m.postal_code,1,2)='19' OR SUBSTR(m.postal_code,1,2)='20' OR SUBSTR(m.postal_code,1,2)='21' OR SUBSTR(m.postal_code,1,2)='22' OR SUBSTR(m.postal_code,1,2)='23' OR SUBSTR(m.postal_code,1,2)='24' OR SUBSTR(m.postal_code,1,2)='25' OR SUBSTR(m.postal_code,1,2)='26' OR SUBSTR(m.postal_code,1,2)='27' OR SUBSTR(m.postal_code,1,2)='28' OR SUBSTR(m.postal_code,1,2)='29' OR SUBSTR(m.postal_code,1,2)='30' OR SUBSTR(m.postal_code,1,2)='31' OR SUBSTR(m.postal_code,1,2)='32' OR SUBSTR(m.postal_code,1,2)='33' OR SUBSTR(m.postal_code,1,2)='34' OR SUBSTR(m.postal_code,1,2)='35' OR SUBSTR(m.postal_code,1,2)='36' OR SUBSTR(m.postal_code,1,2)='37' OR SUBSTR(m.postal_code,1,2)='38' OR SUBSTR(m.postal_code,1,2)='39' OR SUBSTR(m.postal_code,1,2)='40' OR SUBSTR(m.postal_code,1,2)='41' OR SUBSTR(m.postal_code,1,2)='42' OR SUBSTR(m.postal_code,1,2)='43' OR SUBSTR(m.postal_code,1,2)='44' OR SUBSTR(m.postal_code,1,2)='45' OR SUBSTR(m.postal_code,1,2)='46' OR SUBSTR(m.postal_code,1,2)='47' OR SUBSTR(m.postal_code,1,2)='48' OR SUBSTR(m.postal_code,1,2)='49' OR SUBSTR(m.postal_code,1,2)='50' OR SUBSTR(m.postal_code,1,2)='51' OR SUBSTR(m.postal_code,1,2)='52' OR SUBSTR(m.postal_code,1,2)='53' OR SUBSTR(m.postal_code,1,2)='54' OR SUBSTR(m.postal_code,1,2)='55' OR SUBSTR(m.postal_code,1,2)='56' OR SUBSTR(m.postal_code,1,2)='57' OR SUBSTR(m.postal_code,1,2)='58' OR SUBSTR(m.postal_code,1,2)='59' OR SUBSTR(m.postal_code,1,2)='60' OR SUBSTR(m.postal_code,1,2)='61' OR SUBSTR(m.postal_code,1,2)='62' OR SUBSTR(m.postal_code,1,2)='63' OR SUBSTR(m.postal_code,1,2)='64' OR SUBSTR(m.postal_code,1,2)='65' OR SUBSTR(m.postal_code,1,2)='66' OR SUBSTR(m.postal_code,1,2)='67' OR SUBSTR(m.postal_code,1,2)='68' OR SUBSTR(m.postal_code,1,2)='69' OR SUBSTR(m.postal_code,1,2)='70' OR SUBSTR(m.postal_code,1,2)='71' OR SUBSTR(m.postal_code,1,2)='72' OR SUBSTR(m.postal_code,1,2)='73' OR SUBSTR(m.postal_code,1,2)='74' OR SUBSTR(m.postal_code,1,2)='75' OR SUBSTR(m.postal_code,1,2)='76' OR SUBSTR(m.postal_code,1,2)='77' OR SUBSTR(m.postal_code,1,2)='78' OR SUBSTR(m.postal_code,1,2)='79' OR SUBSTR(m.postal_code,1,2)='80' OR SUBSTR(m.postal_code,1,2)='81' OR SUBSTR(m.postal_code,1,2)='82' OR SUBSTR(m.postal_code,1,2)='83' OR SUBSTR(m.postal_code,1,2)='84' OR SUBSTR(m.postal_code,1,2)='85' OR SUBSTR(m.postal_code,1,2)='86' OR SUBSTR(m.postal_code,1,2)='87' OR SUBSTR(m.postal_code,1,2)='88' OR SUBSTR(m.postal_code,1,2)='89' OR SUBSTR(m.postal_code,1,2)='90' OR SUBSTR(m.postal_code,1,2)='91' OR SUBSTR(m.postal_code,1,2)='92' OR SUBSTR(m.postal_code,1,2)='93' OR SUBSTR(m.postal_code,1,2)='94' OR SUBSTR(m.postal_code,1,2)='95')
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_FRANCE_osmconf.ini'
echo "Fin : H_OSM_ADMINISTRATIF > CHEF_LIEU_boundary.shp"
