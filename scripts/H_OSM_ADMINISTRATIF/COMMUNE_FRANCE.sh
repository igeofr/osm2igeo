#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
#------------------------------------------------------------------------------------------------------------
var_group=H_OSM_ADMINISTRATIF
var_file=COMMUNE
#------------------------------------------------------------------------------------------------------------
#------------------------------------ COMMUNE ---------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
export requete="SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
ST_Buffer(GEOMETRY,0) AS "GEOMETRY",
-----------------------------------------
upper(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
name,
'â','A'),
'à','A'),
'é','E'),
'è','E'),
'ê','E'),
'ë','E'),
'ï','I'),
'î','I'),
'ô','O'),
'ö','O'),
'ü','U'),
'û','U'),
'ç','C')) AS "NOM_COM_M",
-----------------------------------------
name AS "NOM_COM",
-----------------------------------------
ref_INSEE AS "CODE_INSEE",
-----------------------------------------
SUBSTR(ref_insee,1,2) AS "INSEE_DEP",
-----------------------------------------
CASE
  WHEN SUBSTR(ref_insee,1,2)='01' THEN 'AIN'
  WHEN SUBSTR(ref_insee,1,2)='02' THEN 'AISNE'
  WHEN SUBSTR(ref_insee,1,2)='03' THEN 'ALLIER'
  WHEN SUBSTR(ref_insee,1,2)='04' THEN 'ALPES DE HAUTES-PROVENCE'
  WHEN SUBSTR(ref_insee,1,2)='05' THEN 'HAUTES-ALPES'
  WHEN SUBSTR(ref_insee,1,2)='06' THEN 'ALPES-MARITIMES'
  WHEN SUBSTR(ref_insee,1,2)='07' THEN 'ARDÈCHE'
  WHEN SUBSTR(ref_insee,1,2)='08' THEN 'ARDENNES'
  WHEN SUBSTR(ref_insee,1,2)='09' THEN 'ARIÈGE'
  WHEN SUBSTR(ref_insee,1,2)='10' THEN 'AUBE'
  WHEN SUBSTR(ref_insee,1,2)='11' THEN 'AUDE'
  WHEN SUBSTR(ref_insee,1,2)='12' THEN 'AVEYRON'
  WHEN SUBSTR(ref_insee,1,2)='13' THEN 'BOUCHES-DU-RHÔNE'
  WHEN SUBSTR(ref_insee,1,2)='14' THEN 'CALVADOS'
  WHEN SUBSTR(ref_insee,1,2)='15' THEN 'CANTAL'
  WHEN SUBSTR(ref_insee,1,2)='16' THEN 'CHARENTE'
  WHEN SUBSTR(ref_insee,1,2)='17' THEN 'CHARENTE-MARITIME'
  WHEN SUBSTR(ref_insee,1,2)='18' THEN 'CHER'
  WHEN SUBSTR(ref_insee,1,2)='19' THEN 'CORRÈZE'
  WHEN SUBSTR(ref_insee,1,2)='2A' THEN 'CORSE-DU-SUD'
  WHEN SUBSTR(ref_insee,1,2)='2B' THEN 'HAUTE-CORSE'
  WHEN SUBSTR(ref_insee,1,2)='21' THEN 'CÔTE-D OR'
  WHEN SUBSTR(ref_insee,1,2)='22' THEN 'CÔTES D ARMOR'
  WHEN SUBSTR(ref_insee,1,2)='23' THEN 'CREUSE'
  WHEN SUBSTR(ref_insee,1,2)='24' THEN 'DORDOGNE'
  WHEN SUBSTR(ref_insee,1,2)='25' THEN 'DOUBS'
  WHEN SUBSTR(ref_insee,1,2)='26' THEN 'DRÔME'
  WHEN SUBSTR(ref_insee,1,2)='27' THEN 'EURE'
  WHEN SUBSTR(ref_insee,1,2)='28' THEN 'EURE-ET-LOIR'
  WHEN SUBSTR(ref_insee,1,2)='29' THEN 'FINISTÈRE'
  WHEN SUBSTR(ref_insee,1,2)='30' THEN 'GARD'
  WHEN SUBSTR(ref_insee,1,2)='31' THEN 'HAUTE-GARONNE'
  WHEN SUBSTR(ref_insee,1,2)='32' THEN 'GERS'
  WHEN SUBSTR(ref_insee,1,2)='33' THEN 'GIRONDE'
  WHEN SUBSTR(ref_insee,1,2)='34' THEN 'HÉRAULT'
  WHEN SUBSTR(ref_insee,1,2)='35' THEN 'ILLE-ET-VILAINE'
  WHEN SUBSTR(ref_insee,1,2)='36' THEN 'INDRE'
  WHEN SUBSTR(ref_insee,1,2)='37' THEN 'INDRE-ET-LOIRE'
  WHEN SUBSTR(ref_insee,1,2)='38' THEN 'ISÈRE'
  WHEN SUBSTR(ref_insee,1,2)='39' THEN 'JURA'
  WHEN SUBSTR(ref_insee,1,2)='40' THEN 'LANDES'
  WHEN SUBSTR(ref_insee,1,2)='41' THEN 'LOIR-ET-CHER'
  WHEN SUBSTR(ref_insee,1,2)='42' THEN 'LOIRE'
  WHEN SUBSTR(ref_insee,1,2)='43' THEN 'HAUTE-LOIRE'
  WHEN SUBSTR(ref_insee,1,2)='44' THEN 'LOIRE-ATLANTIQUE'
  WHEN SUBSTR(ref_insee,1,2)='45' THEN 'LOIRET'
  WHEN SUBSTR(ref_insee,1,2)='46' THEN 'LOT'
  WHEN SUBSTR(ref_insee,1,2)='47' THEN 'LOT-ET-GARONNE'
  WHEN SUBSTR(ref_insee,1,2)='48' THEN 'LOZÈRE'
  WHEN SUBSTR(ref_insee,1,2)='49' THEN 'MAINE-ET-LOIRE'
  WHEN SUBSTR(ref_insee,1,2)='50' THEN 'MANCHE'
  WHEN SUBSTR(ref_insee,1,2)='51' THEN 'MARNE'
  WHEN SUBSTR(ref_insee,1,2)='52' THEN 'HAUTE-MARNE'
  WHEN SUBSTR(ref_insee,1,2)='53' THEN 'MAYENNE'
  WHEN SUBSTR(ref_insee,1,2)='54' THEN 'MEURTHE-ET-MOSELLE'
  WHEN SUBSTR(ref_insee,1,2)='55' THEN 'MEUSE'
  WHEN SUBSTR(ref_insee,1,2)='56' THEN 'MORBIHAN'
  WHEN SUBSTR(ref_insee,1,2)='57' THEN 'MOSELLE'
  WHEN SUBSTR(ref_insee,1,2)='58' THEN 'NIÈVRE'
  WHEN SUBSTR(ref_insee,1,2)='59' THEN 'NORD'
  WHEN SUBSTR(ref_insee,1,2)='60' THEN 'OISE'
  WHEN SUBSTR(ref_insee,1,2)='61' THEN 'ORNE'
  WHEN SUBSTR(ref_insee,1,2)='62' THEN 'PAS-DE-CALAIS'
  WHEN SUBSTR(ref_insee,1,2)='63' THEN 'PUY-DE-DÔME'
  WHEN SUBSTR(ref_insee,1,2)='64' THEN 'PYRÉNÉES-ATLANTIQUES'
  WHEN SUBSTR(ref_insee,1,2)='65' THEN 'HAUTES-PYRÉNÉES'
  WHEN SUBSTR(ref_insee,1,2)='66' THEN 'PYRÉNÉES-ORIENTALES'
  WHEN SUBSTR(ref_insee,1,2)='67' THEN 'BAS-RHIN'
  WHEN SUBSTR(ref_insee,1,2)='68' THEN 'HAUT-RHIN'
  WHEN SUBSTR(ref_insee,1,2)='69' THEN 'RHÔNE'
  WHEN SUBSTR(ref_insee,1,2)='70' THEN 'HAUTE-SAÔNE'
  WHEN SUBSTR(ref_insee,1,2)='71' THEN 'SAÔNE-ET-LOIRE'
  WHEN SUBSTR(ref_insee,1,2)='72' THEN 'SARTHE'
  WHEN SUBSTR(ref_insee,1,2)='73' THEN 'SAVOIE'
  WHEN SUBSTR(ref_insee,1,2)='74' THEN 'HAUTE-SAVOIE'
  WHEN SUBSTR(ref_insee,1,2)='75' THEN 'PARIS'
  WHEN SUBSTR(ref_insee,1,2)='76' THEN 'SEINE-MARITIME'
  WHEN SUBSTR(ref_insee,1,2)='77' THEN 'SEINE-ET-MARNE'
  WHEN SUBSTR(ref_insee,1,2)='78' THEN 'YVELINES'
  WHEN SUBSTR(ref_insee,1,2)='79' THEN 'DEUX-SÈVRES'
  WHEN SUBSTR(ref_insee,1,2)='80' THEN 'SOMME'
  WHEN SUBSTR(ref_insee,1,2)='81' THEN 'TARN'
  WHEN SUBSTR(ref_insee,1,2)='82' THEN 'TARN-ET-GARONNE'
  WHEN SUBSTR(ref_insee,1,2)='83' THEN 'VAR'
  WHEN SUBSTR(ref_insee,1,2)='84' THEN 'VAUCLUSE'
  WHEN SUBSTR(ref_insee,1,2)='85' THEN 'VENDÉE'
  WHEN SUBSTR(ref_insee,1,2)='86' THEN 'VIENNE'
  WHEN SUBSTR(ref_insee,1,2)='87' THEN 'HAUTE-VIENNE'
  WHEN SUBSTR(ref_insee,1,2)='88' THEN 'VOSGES'
  WHEN SUBSTR(ref_insee,1,2)='89' THEN 'YONNE'
  WHEN SUBSTR(ref_insee,1,2)='90' THEN 'TERRITOIRE-DE-BELFORT'
  WHEN SUBSTR(ref_insee,1,2)='91' THEN 'ESSONNE'
  WHEN SUBSTR(ref_insee,1,2)='92' THEN 'HAUTS-DE-SEINE'
  WHEN SUBSTR(ref_insee,1,2)='93' THEN 'SEINE-SAINT-DENIS'
  WHEN SUBSTR(ref_insee,1,2)='94' THEN 'VAL-DE-MARNE'
  WHEN SUBSTR(ref_insee,1,2)='95' THEN 'VAL-D OISE'
ELSE ''
END AS "DEPART",
-----------------------------------------
CASE
  WHEN SUBSTR(ref_insee,1,2)='01' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='02' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='03' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='04' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='05' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='06' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='07' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='08' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='09' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='10' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='11' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='12' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='13' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='14' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='15' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='16' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='17' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='18' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='19' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='21' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='22' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='23' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='24' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='25' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='26' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='27' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='28' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='29' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='2A' THEN 94
  WHEN SUBSTR(ref_insee,1,2)='2B' THEN 94
  WHEN SUBSTR(ref_insee,1,2)='30' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='31' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='32' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='33' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='34' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='35' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='36' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='37' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='38' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='39' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='40' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='41' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='42' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='43' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='44' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='45' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='46' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='47' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='48' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='49' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='50' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='51' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='52' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='53' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='54' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='55' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='56' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='57' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='58' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='59' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='60' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='61' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='62' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='63' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='64' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='65' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='66' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='67' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='68' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='69' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='70' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='71' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='72' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='73' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='74' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='75' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='76' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='77' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='78' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='79' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='80' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='81' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='82' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='83' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='84' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='85' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='86' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='87' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='88' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='89' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='90' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='91' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='92' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='93' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='94' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='95' THEN 11
  ELSE ''
END AS "INSEE_REG",
-----------------------------------------
CASE
  WHEN population IS NOT NULL THEN population
ELSE 'NC'
END AS "POPUL",
-----------------------------------------
'OpenStreetMap' AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE boundary='administrative' AND admin_level='8' AND (SUBSTR(ref_insee,1,2)='01' OR SUBSTR(ref_insee,1,2)='02' OR SUBSTR(ref_insee,1,2)='03' OR SUBSTR(ref_insee,1,2)='04' OR SUBSTR(ref_insee,1,2)='05' OR SUBSTR(ref_insee,1,2)='06' OR SUBSTR(ref_insee,1,2)='07' OR SUBSTR(ref_insee,1,2)='08' OR SUBSTR(ref_insee,1,2)='09' OR SUBSTR(ref_insee,1,2)='10' OR SUBSTR(ref_insee,1,2)='11' OR SUBSTR(ref_insee,1,2)='12' OR SUBSTR(ref_insee,1,2)='13' OR SUBSTR(ref_insee,1,2)='14' OR SUBSTR(ref_insee,1,2)='15' OR SUBSTR(ref_insee,1,2)='16' OR SUBSTR(ref_insee,1,2)='17' OR SUBSTR(ref_insee,1,2)='18' OR SUBSTR(ref_insee,1,2)='19' OR SUBSTR(ref_insee,1,2)='2A' OR SUBSTR(ref_insee,1,2)='2B' OR SUBSTR(ref_insee,1,2)='21' OR SUBSTR(ref_insee,1,2)='22' OR SUBSTR(ref_insee,1,2)='23' OR SUBSTR(ref_insee,1,2)='24' OR SUBSTR(ref_insee,1,2)='25' OR SUBSTR(ref_insee,1,2)='26' OR SUBSTR(ref_insee,1,2)='27' OR SUBSTR(ref_insee,1,2)='28' OR SUBSTR(ref_insee,1,2)='29' OR SUBSTR(ref_insee,1,2)='30' OR SUBSTR(ref_insee,1,2)='31' OR SUBSTR(ref_insee,1,2)='32' OR SUBSTR(ref_insee,1,2)='33' OR SUBSTR(ref_insee,1,2)='34' OR SUBSTR(ref_insee,1,2)='35' OR SUBSTR(ref_insee,1,2)='36' OR SUBSTR(ref_insee,1,2)='37' OR SUBSTR(ref_insee,1,2)='38' OR SUBSTR(ref_insee,1,2)='39' OR SUBSTR(ref_insee,1,2)='40' OR SUBSTR(ref_insee,1,2)='41' OR SUBSTR(ref_insee,1,2)='42' OR SUBSTR(ref_insee,1,2)='43' OR SUBSTR(ref_insee,1,2)='44' OR SUBSTR(ref_insee,1,2)='45' OR SUBSTR(ref_insee,1,2)='46' OR SUBSTR(ref_insee,1,2)='47' OR SUBSTR(ref_insee,1,2)='48' OR SUBSTR(ref_insee,1,2)='49' OR SUBSTR(ref_insee,1,2)='50' OR SUBSTR(ref_insee,1,2)='51' OR SUBSTR(ref_insee,1,2)='52' OR SUBSTR(ref_insee,1,2)='53' OR SUBSTR(ref_insee,1,2)='54' OR SUBSTR(ref_insee,1,2)='55' OR SUBSTR(ref_insee,1,2)='56' OR SUBSTR(ref_insee,1,2)='57' OR SUBSTR(ref_insee,1,2)='58' OR SUBSTR(ref_insee,1,2)='59' OR SUBSTR(ref_insee,1,2)='60' OR SUBSTR(ref_insee,1,2)='61' OR SUBSTR(ref_insee,1,2)='62' OR SUBSTR(ref_insee,1,2)='63' OR SUBSTR(ref_insee,1,2)='64' OR SUBSTR(ref_insee,1,2)='65' OR SUBSTR(ref_insee,1,2)='66' OR SUBSTR(ref_insee,1,2)='67' OR SUBSTR(ref_insee,1,2)='68' OR SUBSTR(ref_insee,1,2)='69' OR SUBSTR(ref_insee,1,2)='70' OR SUBSTR(ref_insee,1,2)='71' OR SUBSTR(ref_insee,1,2)='72' OR SUBSTR(ref_insee,1,2)='73' OR SUBSTR(ref_insee,1,2)='74' OR SUBSTR(ref_insee,1,2)='75' OR SUBSTR(ref_insee,1,2)='76' OR SUBSTR(ref_insee,1,2)='77' OR SUBSTR(ref_insee,1,2)='78' OR SUBSTR(ref_insee,1,2)='79' OR SUBSTR(ref_insee,1,2)='80' OR SUBSTR(ref_insee,1,2)='81' OR SUBSTR(ref_insee,1,2)='82' OR SUBSTR(ref_insee,1,2)='83' OR SUBSTR(ref_insee,1,2)='84' OR SUBSTR(ref_insee,1,2)='85' OR SUBSTR(ref_insee,1,2)='86' OR SUBSTR(ref_insee,1,2)='87' OR SUBSTR(ref_insee,1,2)='88' OR SUBSTR(ref_insee,1,2)='89' OR SUBSTR(ref_insee,1,2)='90' OR SUBSTR(ref_insee,1,2)='91' OR SUBSTR(ref_insee,1,2)='92' OR SUBSTR(ref_insee,1,2)='93' OR SUBSTR(ref_insee,1,2)='94' OR SUBSTR(ref_insee,1,2)='95') AND ST_IsValid(ST_Buffer(GEOMETRY,0))"
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
if [ "$FORMAT_SIG" = "SHP" ]
then
  echo "Debut : $var_group > $var_file.shp"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.shp' -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'data_tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_FRANCE_osmconf.ini'
  echo "Fin : $var_group > $var_file.shp"
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'.gpkg' -nln $var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_FRANCE_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  echo "Debut : $var_group > $var_file"
  $LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f PGDump 'data_temp/'$PAYS'/'$OUT_EPSG'/'$var_group'/'$var_file'.sql' -nln $var_group'_'$var_file -dialect SQLITE -sql "SELECT * FROM ($(echo $requete | sed -e 's/-//g'))" $DATA_IN --config PG_USE_COPY YES --debug ON -skipfailures -lco SRID=2154 -lco SCHEMA=osm2igeo -lco GEOMETRY_NAME=geom -oo CONFIG_FILE='scripts/'$var_group'/'$var_file'_FRANCE_osmconf.ini'
  echo "Fin : $var_group > $var_file"
fi
