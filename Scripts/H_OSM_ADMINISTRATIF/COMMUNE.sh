echo debut
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/H_OSM_ADMINISTRATIF/COMMUNE.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ COMMUNE ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
GEOMETRY AS "GEOMETRY",
-----------------------------------------
name AS "NOM",
-----------------------------------------
ref_INSEE AS "CODE_INSEE",
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
  WHEN population IS NOT NULL THEN population
ELSE 'NC'
END AS "POPUL"
-----------------------------------------
FROM multipolygons WHERE boundary='administrative' AND admin_level='8'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config OSM_CONFIG_FILE 'Scripts/H_OSM_ADMINISTRATIF/COMMUNE_osmconf.ini'
echo fin
