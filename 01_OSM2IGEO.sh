start=$(date '+%s')

if [ "$#" -ge 1 ]; then
  if [ "$1" = "FRANCE" ]  || [ "$1" = "GUADELOUPE" ] || [ "$1" = "GUYANE" ] || [ "$1" = "MARTINIQUE" ] || [ "$1" = "MAYOTTE" ] || [ "$1" = "REUNION" ] || [ "$1" = "ALGERIE" ] || [ "$1" = "BENIN" ]  || [ "$1" = "BURKINA_FASO" ] || [ "$1" = "BURUNDI" ] || [ "$1" = "CAMEROUN" ] || [ "$1" = "COMORES" ] || [ "$1" = "CONGO_RC" ] ||  [ "$1" = "CONGO_RDC" ] || [ "$1" = "COTE_D_IVOIRE" ] || [ "$1" = "DJIBOUTI" ] || [ "$1" = "GABON" ] || [ "$1" = "GUINEE_EQUATORIALE" ] || [ "$1" = "GUINEE" ] || [ "$1" = "MADAGASCAR" ] || [ "$1" = "MALI" ] || [ "$1" = "MAROC" ] || [ "$1" = "NIGER" ] || [ "$1" = "REPUBLIQUE_CENTRAFRICAINE" ] || [ "$1" = "RWANDA" ] || [ "$1" = "SENEGAL_GAMBIE" ] || [ "$1" = "SEYCHELLES" ] || [ "$1" = "TCHAD" ] || [ "$1" = "TOGO" ] || [ "$1" = "TUNISIE" ] || [ "$1" = "BELGIQUE" ] || [ "$1" = "SUISSE" ] || [ "$1" = "LUXEMBOURG" ] || [ "$1" = "ANDORRE" ];
  then
    a_pays=$1
  else
  IFS= read -p "PAYS : " p_pays
  if [ "$p_pays" = "FRANCE" ]  || [ "$p_pays" = "GUADELOUPE" ] || [ "$p_pays" = "GUYANE" ] || [ "$p_pays" = "MARTINIQUE" ] || [ "$p_pays" = "MAYOTTE" ] || [ "$p_pays" = "REUNION" ] || [ "$p_pays" = "ALGERIE" ] || [ "$p_pays" = "BENIN" ]  || [ "$p_pays" = "BURKINA_FASO" ] || [ "$p_pays" = "BURUNDI" ] || [ "$p_pays" = "CAMEROUN" ] || [ "$p_pays" = "COMORES" ] || [ "$p_pays" = "CONGO_RC" ] ||  [ "$p_pays" = "CONGO_RDC" ] || [ "$p_pays" = "COTE_D_IVOIRE" ] || [ "$p_pays" = "DJIBOUTI" ] || [ "$p_pays" = "GABON" ] || [ "$p_pays" = "GUINEE_EQUATORIALE" ] || [ "$p_pays" = "GUINEE" ] || [ "$p_pays" = "MADAGASCAR" ] || [ "$p_pays" = "MALI" ] || [ "$p_pays" = "MAROC" ] || [ "$p_pays" = "NIGER" ] || [ "$p_pays" = "REPUBLIQUE_CENTRAFRICAINE" ] || [ "$p_pays" = "RWANDA" ] || [ "$p_pays" = "SENEGAL_GAMBIE" ] || [ "$p_pays" = "SEYCHELLES" ] || [ "$p_pays" = "TCHAD" ] || [ "$p_pays" = "TOGO" ] || [ "$p_pays" = "TUNISIE" ] || [ "$p_pays" = "BELGIQUE" ] || [ "$p_pays" = "SUISSE" ] || [ "$p_pays" = "LUXEMBOURG" ] || [ "$p_pays" = "ANDORRE" ];
  then
    export a_pays=$p_pays
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
else
  IFS= read -p "PAYS : " p_pays
  if [ "$p_pays" = "FRANCE" ]  || [ "$p_pays" = "GUADELOUPE" ] || [ "$p_pays" = "GUYANE" ] || [ "$p_pays" = "MARTINIQUE" ] || [ "$p_pays" = "MAYOTTE" ] || [ "$p_pays" = "REUNION" ] || [ "$p_pays" = "ALGERIE" ] || [ "$p_pays" = "BENIN" ]  || [ "$p_pays" = "BURKINA_FASO" ] || [ "$p_pays" = "BURUNDI" ] || [ "$p_pays" = "CAMEROUN" ]  || [ "$p_pays" = "COMORES" ] || [ "$p_pays" = "CONGO_RC" ] || [ "$p_pays" = "CONGO_RDC" ] || [ "$p_pays" = "COTE_D_IVOIRE" ] || [ "$p_pays" = "DJIBOUTI" ] || [ "$p_pays" = "GABON" ] || [ "$p_pays" = "GUINEE_EQUATORIALE" ] || [ "$p_pays" = "GUINEE" ] || [ "$p_pays" = "MADAGASCAR" ] || [ "$p_pays" = "MALI" ] || [ "$p_pays" = "MAROC" ] || [ "$p_pays" = "NIGER" ] || [ "$p_pays" = "REPUBLIQUE_CENTRAFRICAINE" ] || [ "$p_pays" = "RWANDA" ] || [ "$p_pays" = "SENEGAL_GAMBIE" ] || [ "$p_pays" = "SEYCHELLES" ] || [ "$p_pays" = "TCHAD" ] || [ "$p_pays" = "TOGO" ] || [ "$p_pays" = "TUNISIE" ] || [ "$p_pays" = "BELGIQUE" ] || [ "$p_pays" = "SUISSE" ] || [ "$p_pays" = "LUXEMBOURG" ] || [ "$p_pays" = "ANDORRE" ];
  then
    export a_pays=$p_pays
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
#-------------------------------------------------------------------------------
if [ "$#" -ge 2 ]; then
  if [ "$2" = "2154" ] || [ "$2" = "4326" ] || [ "$2" = "32738" ] || [ "$2" = "29702" ] || [ "$2" = "3812" ] || [ "$2" = "32620" ] || [ "$2" = "4471" ] || [ "$2" = "2975" ] || [ "$2" = "21781" ] || [ "$2" = "2169" ];
  then
    c_epsg=$2
  else
  IFS= read -p "EPSG : " p_epsg
  if [ "$p_epsg" = "2154" ] || [ "$p_epsg" = "4326" ] || [ "$p_epsg" = "32738" ] || [ "$p_epsg" = "29702" ] || [ "$p_epsg" = "3812" ] || [ "$p_epsg" = "32620" ] || [ "$p_epsg" = "4471" ] || [ "$p_epsg" = "2975" ] || [ "$p_epsg" = "21781" ] || [ "$p_epsg" = "2169" ];
  then
    export c_epsg=$p_epsg
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
else
  IFS= read -p "EPSG : " p_epsg
  if [ "$p_epsg" = "2154" ] || [ "$p_epsg" = "4326" ] || [ "$p_epsg" = "32738" ] || [ "$p_epsg" = "29702" ] || [ "$p_epsg" = "3812" ] || [ "$p_epsg" = "32620" ] || [ "$p_epsg" = "4471" ] || [ "$p_epsg" = "2975" ] || [ "$p_epsg" = "21781" ] || [ "$p_epsg" = "2169" ];
  then
    export c_epsg=$p_epsg
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
#-------------------------------------------------------------------------------

if [ "$#" -ge 3 ]; then
  if [ "$3" = "42_ALSACE" ] || [ "$3" = "72_AQUITAINE" ] || [ "$3" = "83_AUVERGNE" ] || [ "$3" = "25_BASSE_NORMANDIE" ] || [ "$3" = "26_BOURGOGNE" ] || [ "$3" = "53_BRETAGNE" ] || [ "$3" = "24_CENTRE" ] || [ "$3" = "21_CHAMPAGNE_ARDENNE" ] || [ "$3" = "94_CORSE" ] || [ "$3" = "43_FRANCHE_COMTE" ] || [ "$3" = "23_HAUTE_NORMANDIE" ] || [ "$3" = "11_ILE_DE_FRANCE" ] || [ "$3" = "91_LANGUEDOC_ROUSSILLON" ] || [ "$3" = "74_LIMOUSIN" ] || [ "$3" = "41_LORRAINE" ] || [ "$3" = "73_MIDI_PYRENEES" ] || [ "$3" = "31_NORD_PAS_DE_CALAIS" ] || [ "$3" = "52_PAYS_DE_LA_LOIRE" ] || [ "$3" = "22_PICARDIE" ] || [ "$3" = "54_POITOU_CHARENTES" ] || [ "$3" = "93_PROVENCE_ALPES_COTE_D_AZUR" ] || [ "$3" = "82_RHONE_ALPES" ];

  then
    export region=$3
  elif [ "$3" = "ALL" ]; then
    export region="*";
  else
  IFS= read -p "REGION : " r_region
  if [ "$r_region" = "42_ALSACE" ] || [ "$r_region" = "72_AQUITAINE" ] || [ "$r_region" = "83_AUVERGNE" ] || [ "$r_region" = "25_BASSE_NORMANDIE" ] || [ "$r_region" = "26_BOURGOGNE" ] || [ "$r_region" = "53_BRETAGNE" ] || [ "$r_region" = "24_CENTRE" ] || [ "$r_region" = "21_CHAMPAGNE_ARDENNE" ] || [ "$r_region" = "94_CORSE" ] || [ "$r_region" = "43_FRANCHE_COMTE" ] || [ "$r_region" = "23_HAUTE_NORMANDIE" ] || [ "$r_region" = "11_ILE_DE_FRANCE" ] || [ "$r_region" = "91_LANGUEDOC_ROUSSILLON" ] || [ "$r_region" = "74_LIMOUSIN" ] || [ "$r_region" = "41_LORRAINE" ] || [ "$r_region" = "73_MIDI_PYRENEES" ] || [ "$r_region" = "31_NORD_PAS_DE_CALAIS" ] || [ "$r_region" = "52_PAYS_DE_LA_LOIRE" ] || [ "$r_region" = "22_PICARDIE" ] || [ "$r_region" = "54_POITOU_CHARENTES" ] || [ "$r_region" = "93_PROVENCE_ALPES_COTE_D_AZUR" ] || [ "$r_region" = "82_RHONE_ALPES" ];
  then
    export region=$r_region
  elif [ "$r_region" = "ALL" ]; then
    export region="*";
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
else
  IFS= read -p "REGION : " r_region
  if [ "$r_region" = "42_ALSACE" ] || [ "$r_region" = "72_AQUITAINE" ] || [ "$r_region" = "83_AUVERGNE" ] || [ "$r_region" = "25_BASSE_NORMANDIE" ] || [ "$r_region" = "26_BOURGOGNE" ] || [ "$r_region" = "53_BRETAGNE" ] || [ "$r_region" = "24_CENTRE" ] || [ "$r_region" = "21_CHAMPAGNE_ARDENNE" ] || [ "$r_region" = "94_CORSE" ] || [ "$r_region" = "43_FRANCHE_COMTE" ] || [ "$r_region" = "23_HAUTE_NORMANDIE" ] || [ "$r_region" = "11_ILE_DE_FRANCE" ] || [ "$r_region" = "91_LANGUEDOC_ROUSSILLON" ] || [ "$r_region" = "74_LIMOUSIN" ] || [ "$r_region" = "41_LORRAINE" ] || [ "$r_region" = "73_MIDI_PYRENEES" ] || [ "$r_region" = "31_NORD_PAS_DE_CALAIS" ] || [ "$r_region" = "52_PAYS_DE_LA_LOIRE" ] || [ "$r_region" = "22_PICARDIE" ] || [ "$r_region" = "54_POITOU_CHARENTES" ] || [ "$r_region" = "93_PROVENCE_ALPES_COTE_D_AZUR" ] || [ "$r_region" = "82_RHONE_ALPES" ];
  then
    export region=$r_region
  elif [ "$r_region" = "ALL" ]; then
    export region="*";
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
#-------------------------------------------------------------------------------
if [ "$#" -ge 4 ]; then
  if [ "$4" = "SHP" ] || [ "$4" = "GPKG" ]|| [ "$4" = "SQL" ];
  then
    format=$4
  else
    IFS= read -p "FORMAT : " p_format
    if [ "$r_format" = "SHP" ] || [ "$r_format" = "GPKG" ]|| [ "$r_format" = "SQL" ];
    then
      export format=$r_format
    else
      echo "Erreur de paramètre"
      exit 0
    fi
  fi
else
  IFS= read -p "FORMAT : " p_format
  if [ "$r_format" = "SHP" ] || [ "$r_format" = "GPKG" ]|| [ "$r_format" = "SQL" ];
  then
    export format=$r_format
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi

#-------------------------------------------------------------------------------
#Variables
export REPER=/Users/florianboret/Desktop/OSM2IGEO_V3
export PAYS=$a_pays
export FORMAT_SIG=$format
cd $REPER/data_in/$PAYS/

for file in $region.pbf

do
    #Variables
    export OUT_EPSG=$c_epsg
    export LINK_OGR=ogr2ogr
    export DATA_IN=data_in/$PAYS/${file}
    export ENCODAGE=UTF-8
    export DATE_T=$(date '+%Y%m')
    export DATE_OLD=$(date -d "-1 month" '+%Y%m')
    #-------------------------------------------------------------------------------
    #EPSG
    if [ "$c_epsg" = "4326" ]
    then
      export EMPRISE='-180 -90 180 90'
      export NZ='_WGS84_4326'
    fi
    if [ "$c_epsg" = "2154" ]
    then
      export EMPRISE='-9.62 41.18 10.30 51.54'
      export NZ='_L93_2154'
    fi
    if [ "$c_epsg" = "32738" ]
    then
      export EMPRISE='42 -80 48 0'
      export NZ='_WGS84_UTM38S_32738'
    fi
    if [ "$c_epsg" = "29702" ]
    then
      export EMPRISE='43.20 -25.66 50.60 -11.90'
      export NZ='_LABORDE_29702'
    fi
    if [ "$c_epsg" = "3812" ]
    then
      export EMPRISE='2.54 49.51 6.40 51.50'
      export NZ='_LAMBERT2008_3812'
    fi
    if [ "$c_epsg" = "32620" ]
    then
      export EMPRISE='-66 0 -60 84'
      export NZ='_WGS84_UTM20N_32620'
    fi
    if [ "$c_epsg" = "2975" ]
    then
      export EMPRISE='37.58 -25.92 58.27 -10.60'
      export NZ='_RGR92_UTM40S_2975'
    fi
    if [ "$c_epsg" = "4471" ]
    then
      export EMPRISE='43.68 -14.49 46.7 -11.33'
      export NZ='_RGM04_UTM38S_4471'
    fi
    if [ "$c_epsg" = "21781" ]
    then
      export EMPRISE='5.96 45.82 10.49 47.81'
      export NZ='_CH1903_LV03_21781'
    fi
    if [ "$c_epsg" = "2169" ]
    then
      export EMPRISE='5.73 49.44 6.53 50.19'
      export NZ='_LUXEMBOURG1930_2169'
    fi

    cd $REPER
    mkdir data_temp/$PAYS
    mkdir data_temp/$PAYS/$OUT_EPSG
    cd data_temp/$PAYS/$OUT_EPSG
    rm -rfv *
    cd $REPER

    #----------------------------------------------------------------------------------
    #A_OSM_RESEAU_ROUTIER
    mkdir data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER
    #Couche CHEMIN
    sh scripts_V3/A_OSM_RESEAU_ROUTIER/CHEMIN.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/CHEMIN.txt
    #Couche ROUTE
    sh scripts_V3/A_OSM_RESEAU_ROUTIER/ROUTE.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/ROUTE.txt
        #Couche SURFACE ROUTE
        mkdir data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_parking.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_parking.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_peage.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_peage.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_place.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_place.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE
        #Couche TOPONYME COMMUNICATION
        mkdir data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_aire_repos.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_aire_repos.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_service.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_service.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_echangeur.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_echangeur.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_parking.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_parking.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_peage.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_peage.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_pont.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_pont.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_rond_point.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_rond_point.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_tunnel.sh | tee data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_tunnel.txt
            sh scripts_V3/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION
    #----------------------------------------------------------------------------------
    #B_OSM_VOIES_FERREES_ET_AUTRES
    mkdir data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES
        #Couche GARE
        sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/GARE.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/GARE.txt
        #Couche PASSAGE A NIVEAU
        sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/PASSAGE_A_NIVEAU.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/PASSAGE_A_NIVEAU.txt
        #Couche TELEPHERIQUE
        sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TELEPHERIQUE.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TELEPHERIQUE.txt
        #Couche TOPONYME FERRE
        mkdir data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE
            sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_gare_ferroviaire.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_gare_ferroviaire.txt
            sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_telepherique.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_telepherique.txt
            sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_halte_ferroviaire.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_halte_ferroviaire.txt
            sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_voie_ferree.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_voie_ferree.txt
            sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE
        #Couche TRONCON VOIE FERREE
        sh scripts_V3/B_OSM_VOIES_FERREES_ET_AUTRES/TRONCON_VOIE_FERREE.sh | tee data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TRONCON_VOIE_FERREE.txt
    #----------------------------------------------------------------------------------
    #C_OSM_TRANSPORT_ENERGIE
    mkdir data_temp/$PAYS/$OUT_EPSG/C_OSM_TRANSPORT_ENERGIE
        #Couche LIGNE ELECTRIQUE
        sh scripts_V3/C_OSM_TRANSPORT_ENERGIE/LIGNE_ELECTRIQUE.sh | tee data_temp/$PAYS/$OUT_EPSG/C_OSM_TRANSPORT_ENERGIE/LIGNE_ELECTRIQUE.txt
        #Couche EOLIENNE
        sh scripts_V3/C_OSM_TRANSPORT_ENERGIE/EOLIENNE.sh | tee data_temp/$PAYS/$OUT_EPSG/C_OSM_TRANSPORT_ENERGIE/EOLIENNE.txt
        #Couche POSTE TRANSFORMATION
        sh scripts_V3/C_OSM_TRANSPORT_ENERGIE/POSTE_TRANSFORMATION.sh | tee data_temp/$PAYS/$OUT_EPSG/C_OSM_TRANSPORT_ENERGIE/POSTE_TRANSFORMATION.txt
        #Couche PYLONE
        sh scripts_V3/C_OSM_TRANSPORT_ENERGIE/PYLONE.sh | tee data_temp/$PAYS/$OUT_EPSG/C_OSM_TRANSPORT_ENERGIE/PYLONE.txt
    #----------------------------------------------------------------------------------
    #D_OSM_HYDROGRAPHIE
    mkdir data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE
        #Couche CANALISATION EAU
        sh scripts_V3/D_OSM_HYDROGRAPHIE/CANALISATION_EAU.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/CANALISATION_EAU.txt
        #Couche HYDRONYME
        sh scripts_V3/D_OSM_HYDROGRAPHIE/BARRAGE.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/BARRAGE.txt
        #Couche POINT EAU
        mkdir data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU
            sh scripts_V3/D_OSM_HYDROGRAPHIE/POINT_EAU_fontaine.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_fontaine.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/POINT_EAU_source.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_source.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/POINT_EAU_station_pompage.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_station_pompage.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/POINT_EAU_lavoir.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_lavoir.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/POINT_EAU_puits.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_puits.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/POINT_EAU_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/POINT_EAU
        #Couche RESERVOIR_EAU
        mkdir data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU
            sh scripts_V3/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU_chateau_d_eau.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU/RESERVOIR_EAU_chateau_d_eau.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU_reservoir_d_eau.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU/RESERVOIR_EAU_reservoir_d_eau.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU
        #Couche SURFACE EAU
        mkdir data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU
            sh scripts_V3/D_OSM_HYDROGRAPHIE/SURFACE_EAU_lac_etang.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_lac_etang.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/SURFACE_EAU_bassin.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_bassin.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/SURFACE_EAU_fleuve_riviere.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_fleuve_riviere.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/SURFACE_EAU_zone_humide.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_zone_humide.txt
            sh scripts_V3/D_OSM_HYDROGRAPHIE/SURFACE_EAU_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU
        #Couche TRONCON COURS EAU
        sh scripts_V3/D_OSM_HYDROGRAPHIE/TRONCON_COURS_EAU.sh | tee data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/TRONCON_COURS_EAU.txt
    #----------------------------------------------------------------------------------
    #E_OSM_BATI
    mkdir data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI
        #Couche BATI
        sh scripts_V3/E_OSM_BATI/BATI.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/BATI.txt
        #Couche Cimetière
        sh scripts_V3/E_OSM_BATI/CIMETIERE.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/CIMETIERE.txt
        #Couche PISTE AERODROME
        sh scripts_V3/E_OSM_BATI/PISTE_AERODROME.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/PISTE_AERODROME.txt
        #Couche RESERVOIR
        mkdir data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/RESERVOIR
            sh scripts_V3/E_OSM_BATI/RESERVOIR_chateau_d_eau.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/RESERVOIR/RESERVOIR_chateau_d_eau.txt
            sh scripts_V3/E_OSM_BATI/RESERVOIR_reservoir_d_eau.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/RESERVOIR/RESERVOIR_reservoir_d_eau.txt
            sh scripts_V3/E_OSM_BATI/RESERVOIR_reservoir_industriel.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/RESERVOIR/RESERVOIR_reservoir_industriel.txt
            sh scripts_V3/E_OSM_BATI/RESERVOIR_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/RESERVOIR
        #Couche TERRAIN SPORT
        mkdir data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/TERRAIN_SPORT
            sh scripts_V3/E_OSM_BATI/TERRAIN_SPORT_bassin_de_natation.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_bassin_de_natation.txt
            sh scripts_V3/E_OSM_BATI/TERRAIN_SPORT_indifferencie.sh | tee data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_indifferencie.txt
            sh scripts_V3/E_OSM_BATI/TERRAIN_SPORT_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/E_OSM_BATI/TERRAIN_SPORT
    #----------------------------------------------------------------------------------
    #F_OSM_VEGETATION
    mkdir data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION
        #Couche VEGETATION
        mkdir data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION
            sh scripts_V3/F_OSM_VEGETATION/ZONE_VEGETATION_foret.sh | tee data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_foret.txt
            sh scripts_V3/F_OSM_VEGETATION/ZONE_VEGETATION_verger.sh | tee data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_verger.txt
            sh scripts_V3/F_OSM_VEGETATION/ZONE_VEGETATION_vigne.sh | tee data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_vigne.txt
            sh scripts_V3/F_OSM_VEGETATION/ZONE_VEGETATION_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION
    #----------------------------------------------------------------------------------
    #H_OSM_ADMINISTRATIF
    mkdir data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF
        if [ "$PAYS" = "FRANCE" ]  || [ "$PAYS" = "GUADELOUPE" ] || [ "$PAYS" = "GUYANE" ] || [ "$PAYS" = "MARTINIQUE" ] || [ "$PAYS" = "MAYOTTE" ] || [ "$PAYS" = "REUNION" ]
        then
          #Couche ARRONDISSEMENT
          sh scripts_V3/H_OSM_ADMINISTRATIF/ARRONDISSEMENT_FRANCE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/ARRONDISSEMENT.txt
          #Couche COMMUNE
          sh scripts_V3/H_OSM_ADMINISTRATIF/COMMUNE_FRANCE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/COMMUNE.txt
          #Couche CHEF LIEU
          cp scripts_V3/H_OSM_ADMINISTRATIF/CHEF_LIEU_FRANCE_SELECT.vrt data_temp/$PAYS/$OUT_EPSG'/H_OSM_ADMINISTRATIF/CHEF_LIEU_SELECT.vrt'
          sh scripts_V3/H_OSM_ADMINISTRATIF/CHEF_LIEU_FRANCE_boundary.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU_boundary.txt
          sh scripts_V3/H_OSM_ADMINISTRATIF/CHEF_LIEU_FRANCE_point.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU_point.txt
          sh scripts_V3/H_OSM_ADMINISTRATIF/CHEF_LIEU_FRANCE_fin.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
          rm data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU_boundary.*
          rm data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU_point.*
          rm data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU_SELECT.vrt
        elif [ "$PAYS" = "ALGERIE" ]
        then
          #Couche WILAYAS
          sh scripts/H_OSM_ADMINISTRATIF/WILAYAS_ALGERIE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/WILAYAS.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "BENIN" ]
        then
          #Couche DEPARTEMENT
          sh scripts/H_OSM_ADMINISTRATIF/DEPARTEMENT_BENIN.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/DEPARTEMENT.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "BURKINA_FASO" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_BURKINA_FASO.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "BURUNDI" ]
        then
          #Couche PROVINCE
          sh scripts/H_OSM_ADMINISTRATIF/PROVINCE_BURUNDI.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PROVINCE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "CAMEROUN" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_CAMEROUN.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "COMORES" ]
        then
          #Couche LIMITE
          sh scripts/H_OSM_ADMINISTRATIF/LIMITE_COMORES.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/LIMITE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "CONGO_RC" ]
        then
          #Couche DISTRICT
          sh scripts/H_OSM_ADMINISTRATIF/DISTRICT_CONGO_RC.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/DISTRICT.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "CONGO_RDC" ]
        then
          #Couche PROVINCE
          sh scripts/H_OSM_ADMINISTRATIF/PROVINCE_CONGO_RDC.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PROVINCE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "COTE_D_IVOIRE" ]
        then
          #Couche DISTRICT
          sh scripts/H_OSM_ADMINISTRATIF/DISTRICT_COTE_D_IVOIRE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/DISTRICT.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "DJIBOUTI" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_DJIBOUTI.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "GABON" ]
        then
          #Couche PROVINCE
          sh scripts/H_OSM_ADMINISTRATIF/PROVINCE_GABON.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PROVINCE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "GUINEE_EQUATORIALE" ]
        then
          #Couche PROVINCE
          sh scripts/H_OSM_ADMINISTRATIF/PROVINCE_GUINEE_EQUATORIALE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PROVINCE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "GUINEE" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_GUINEE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "MADAGASCAR" ]
        then
          #Couche DISTRICT
          sh scripts/H_OSM_ADMINISTRATIF/REGION_MADAGASCAR.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "MALI" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_MALI.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "MAROC" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_MAROC.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche COMMUNE
          sh scripts/H_OSM_ADMINISTRATIF/COMMUNE_MAROC.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/COMMUNE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "NIGER" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_NIGER.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "REPUBLIQUE_CENTRAFRICAINE" ]
        then
          #Couche PREFECTURE
          sh scripts/H_OSM_ADMINISTRATIF/PREFECTURE_REPUBLIQUE_CENTRAFICAINE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PREFECTURE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "RWANDA" ]
        then
          #Couche DISTRICT
          sh scripts/H_OSM_ADMINISTRATIF/DISTRICT_RWANDA.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/DISTRICT.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "SENEGAL_GAMBIE" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_SENEGAL.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "SEYCHELLES" ]
        then
          #Couche LIMITE
          sh scripts/H_OSM_ADMINISTRATIF/LIMITE_SEYCHELLES.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/LIMITE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "TCHAD" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_TCHAD.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "TOGO" ]
        then
          #Couche REGION
          sh scripts/H_OSM_ADMINISTRATIF/REGION_TOGO.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/REGION.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "TUNISIE" ]
        then
          #Couche GOUVERNORAT
          sh scripts/H_OSM_ADMINISTRATIF/GOUVERNORAT_TUNISIE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/GOUVERNORAT.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "BELGIQUE" ]
        then
          #Couche PROVINCE
          sh scripts/H_OSM_ADMINISTRATIF/PROVINCE_BELGIQUE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PROVINCE.txt
          #Couche COMMUNE
          sh scripts/H_OSM_ADMINISTRATIF/COMMUNE_BELGIQUE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/COMMUNE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "ANDORRE" ]
        then
          #Couche COMMUNE
          sh scripts/H_OSM_ADMINISTRATIF/COMMUNE_ANDORRE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/COMMUNE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "LUXEMBOURG" ]
        then
          #Couche CANTON
          sh scripts/H_OSM_ADMINISTRATIF/CANTON_LUXEMBOURG.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CANTON.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        elif [ "$PAYS" = "SUISSE" ]
        then
          #Couche CANTON
          sh scripts/H_OSM_ADMINISTRATIF/CANTON_SUISSE.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/PROVINCE.txt
          #Couche CHEF LIEU
          sh scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh | tee data_temp/$PAYS/$OUT_EPSG/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt
        else
            echo "ADMINISTRATIF - Erreur de paramètre"
            exit 0
        fi

    #----------------------------------------------------------------------------------
    #I_OSM_ZONE_ACTIVITE
    mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE
        #Couche TERRAIN MILITAIRE
        sh scripts_V3/I_OSM_ZONE_ACTIVITE/TERRAIN_MILITAIRE.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/TERRAIN_MILITAIRE.txt
        #Couche PAI ADMINISTRATIF MILITAIRE
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_borne.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_borne.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_poste.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_poste.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_pompier.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_pompier.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_penitentiaire.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_penitentiaire.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_gendarmerie.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_gendarmerie.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_hotel_region.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_hotel_region.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_mairie.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_mairie.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_maison_forestiere.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_maison_forestiere.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_palais_de_justice.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_palais_de_justice.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_police.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_police.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_prefecture.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_prefecture.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_casemate.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_casemate.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE
        #Couche PAI CULTURE LOISIRS
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_camping.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_camping.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_digue.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_digue.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_dolmen.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_dolmen.txt
            #A créer : Espace public #################################################
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_menhir.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_menhir.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_monument.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_monument.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_musee.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_musee.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_parc_de_loisirs.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_parc_de_loisirs.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_parc_des_expositions.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_parc_des_expositions.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_parc_zoologique.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_parc_zoologique.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_refuge.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_refuge.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_vestige.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_vestige.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_village_de_vacances.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_village_de_vacances.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS
        #Couche PAI ESPACE NATUREL
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_arbre.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_arbre.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_bois.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_bois.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_lieu_dit_non_habite.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_lieu_dit_non_habite.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_parc.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_parc.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_point_de_vue.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_point_de_vue.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL
        #Couche PAI GESTION EAUX
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_station_pompage.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX/PAI_GESTION_EAUX_station_pompage.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_station_epuration.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX/PAI_GESTION_EAUX_station_epuration.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX
        #Couche PAI HYDROGRAPHIE
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_amer.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_amer.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_cascade.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_cascade.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_marais.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_marais.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_point_eau.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_point_eau.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE
        #Couche PAI INDUSTRIEL COMMERCIAL
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_aquaculture.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_aquaculture.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_carriere.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_carriere.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_centrale_electrique.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_centrale_electrique.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_divers_commercial.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_divers_commercial.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_divers_industriel.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_divers_industriel.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_marais_salant.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_marais_salant.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_marche.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_marche.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_mine.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_mine.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL
        #Couche PAI OROGRAPHIE
        #A créer #######################################################################
        #Couche PAI RELIGIEUX
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_croix.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_croix.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_catholique.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_catholique.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_orthodoxe.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_orthodoxe.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_protestant.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_protestant.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_islamique.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_islamique.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_israelite.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_israelite.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_divers.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_divers.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_tombeau.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_tombeau.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX
        #Couche PAI SANTE
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SANTE
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SANTE_etablissement_hospitalier.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SANTE/PAI_SANTE_etablissement_hospitalier.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SANTE_etablissement_thermal.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SANTE/PAI_SANTE_etablissement_thermal.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SANTE_hopital.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SANTE/PAI_SANTE_hopital.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SANTE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SANTE
        #Couche PAI SCIENCE ENSEIGNEMENT
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_enseignement_primaire.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_enseignement_primaire.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_enseignement_secondaire.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_enseignement_secondaire.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_enseignement_superieur.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_enseignement_superieur.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_science.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_science.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT
        #Couche PAI SPORT
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SPORT
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SPORT_golf.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_golf.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SPORT_hippodrome.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_hippodrome.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SPORT_piscine.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_piscine.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SPORT_stade.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_stade.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_SPORT_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SPORT
        #Couche PAI TRANSPORT
        #A créer : ###############################################################
        #mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_TRANSPORT
            #sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_TRANSPORT_merge.sh
        #rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_TRANSPORT
        #Couche PAI ZONE HABITATION
        mkdir data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_chateau.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_chateau.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_lieu_dit_habite.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_lieu_dit_habite.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_moulin.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_moulin.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_quartier.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_quartier.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_ruines.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_ruines.txt
            sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION
        #Couche PAI GESTION DECHETS
        sh scripts_V3/I_OSM_ZONE_ACTIVITE/PAI_GESTION_DECHETS.sh | tee data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_GESTION_DECHETS.txt
    #----------------------------------------------------------------------------------
    #T_TOPONYMES
    mkdir data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES
        #Couche LIEU DIT HABITE
        mkdir data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_chateau.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_chateau.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_lieu_dit_habite.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_lieu_dit_habite.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_moulin.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_moulin.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_quartier.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_quartier.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_refuge.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_refuge.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_ruines.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_ruines.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_HABITE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE
        #Couche LIEU DIT NON HABITE
        mkdir data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_barrage.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_barrage.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_croix.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_croix.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_digue.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_digue.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_dolmen.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_dolmen.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_lieu_dit_non_habite.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_lieu_dit_non_habite.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_marais_salant.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_marais_salant.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_mine.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_mine.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_point_de_vue.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_point_de_vue.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_tombeau.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_tombeau.txt
            sh scripts_V3/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE
        #Couche TOPONYME DIVERS
        mkdir data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_aerodrome.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_aerodrome.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_arbre.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_arbre.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_bois.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_bois.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_camping.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_camping.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_centrale_electrique.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_centrale_electrique.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_enceinte_militaire.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_enceinte_militaire.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_enseignement_superieur.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_enseignement_superieur.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_etablissement_hospitalier.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_hospitalier.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_etablissement_penitentiaire.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_penitentiaire.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_etablissement_thermal.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_thermal.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_golf.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_golf.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_hopital.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_hopital.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_hippodrome.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_hippodrome.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_maison_forestiere.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_maison_forestiere.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_menhir.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_menhir.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_monument.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_monument.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_musee.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_musee.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc_de_loisirs.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc_de_loisirs.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc_des_expositions.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc_des_expositions.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc_zoologique.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc_zoologique.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_science.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_science.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_stade.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_stade.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_village_de_vacances.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_village_de_vacances.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_zone_industrielle.sh | tee data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_zone_industrielle.txt
            sh scripts_V3/T_OSM_TOPONYMES/TOPONYME_DIVERS_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/TOPONYME_DIVERS

    #----------------------------------------------------------------------------------
    #X_OSM_TOPO
    mkdir data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO
        #Couche RELIEF
        sh scripts_V3/X_OSM_TOPO/TOPO_RELIEF.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_RELIEF.txt
        #Couche AIRE PROTEGEE
        mkdir data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_borne_kilometrique.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/TOPO_POI_borne_kilometrique.txt
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_borne_geodesique.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/TOPO_POI_borne_geodesique.txt
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_antenne.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/TOPO_POI_antenne.txt
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_col.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/TOPO_POI_col.txt
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_sommet.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/TOPO_POI_sommet.txt
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_point_de_vue.sh | tee data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/TOPO_POI_point_de_vue.txt
            sh scripts_V3/X_OSM_TOPO/TOPO_POI_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI

    #----------------------------------------------------------------------------------
    #Y_OSM_ENVIRONNEMENT
    mkdir data_temp/$PAYS/$OUT_EPSG/Y_OSM_ENVIRONNEMENT
        #Couche AIRE PROTEGEE
        mkdir data_temp/$PAYS/$OUT_EPSG/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE
            sh scripts_V3/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE_parc_national.sh | tee data_temp/$PAYS/$OUT_EPSG/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE/AIRE_PROTEGEE_parc_national.txt
            sh scripts_V3/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE_parc_naturel_marin.sh | tee data_temp/$PAYS/$OUT_EPSG/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE/AIRE_PROTEGEE_parc_naturel_marin.txt
            sh scripts_V3/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE_parc_naturel_regional.sh | tee data_temp/$PAYS/$OUT_EPSG/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE/AIRE_PROTEGEE_parc_naturel_regional.txt
            sh scripts_V3/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE_merge.sh
        rm -r data_temp/$PAYS/$OUT_EPSG/Y_OSM_ENVIRONNEMENT/AIRE_PROTEGEE

    #----------------------------------------------------------------------------------
    #SORTIE SHP
    if [ "$FORMAT_SIG" = "SHP" ]; then
        rm -r -v data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ
        mkdir -v data_out/$PAYS

        mkdir -v data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ
        cp -r data_temp/$PAYS/$OUT_EPSG/* data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/

        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/A_OSM_RESEAU_ROUTIER/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/B_OSM_VOIES_FERREES_ET_AUTRES/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/C_OSM_TRANSPORT_ENERGIE/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/D_OSM_HYDROGRAPHIE/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/E_OSM_BATI/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/F_OSM_VEGETATION/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/H_OSM_ADMINISTRATIF/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/I_OSM_ZONE_ACTIVITE/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/T_OSM_TOPONYMES/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/X_OSM_TOPO/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SHP'$NZ/Y_OSM_ENVIRONNEMENT/*.txt

    #----------------------------------------------------------------------------------
    #SORTIE GEOPACKAGE
    elif  [ "$FORMAT_SIG" = "GPKG" ]; then
        rm -v -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_GPKG'$NZ
        mkdir -v data_out/$PAYS

        mkdir -v data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_GPKG'$NZ
        cp -r data_temp/$PAYS/$OUT_EPSG/*.gpkg data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_GPKG'$NZ/

    #----------------------------------------------------------------------------------
    #SORTIE SQL
    elif  [ "$FORMAT_SIG" = "SQL" ]; then
        rm -v -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ
        mkdir -v data_out/$PAYS

        mkdir -v data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ
        cp -r data_temp/$PAYS/$OUT_EPSG/* data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/

        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/A_OSM_RESEAU_ROUTIER/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/B_OSM_VOIES_FERREES_ET_AUTRES/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/C_OSM_TRANSPORT_ENERGIE/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/D_OSM_HYDROGRAPHIE/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/E_OSM_BATI/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/F_OSM_VEGETATION/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/H_OSM_ADMINISTRATIF/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/I_OSM_ZONE_ACTIVITE/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/T_OSM_TOPONYMES/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/X_OSM_TOPO/*.txt
        rm -r data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_SQL'$NZ/Y_OSM_ENVIRONNEMENT/*.txt
    else
        echo "Erreur de paramètre"
        exit 0
    fi
    #----------------------------------------------------------------------------------
    #LICENCE
    if [ "$FORMAT_SIG" = "SHP" ] || [ "$FORMAT_SIG" = "GPKG" ] || [ "$FORMAT_SIG" = "SQL" ];
    then
    cp attachement/Z_Licence.txt data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_Licence.txt
    else
        echo "Erreur de paramètre"
        exit 0
    fi
    #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #SORTIE MODIFICATION DU PROJET SHP ou GPKG
    if [ "$FORMAT_SIG" = "SHP" ] || [ "$FORMAT_SIG" = "GPKG" ];
    then
      cp 'attachement/Z_PROJET_OSM2IGEO_'$FORMAT_SIG'.qgs' data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        if [ "$c_epsg" = "4326" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=longlat +datum=WGS84 +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>3452<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>4326<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:4326<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>WGS 84<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>longlat<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>WGS84<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>true<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "3812" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=lcc +lat_1=49.83333333333334 +lat_2=51.16666666666666 +lat_0=50.797815 +lon_0=4.359215833333333 +x_0=649328 +y_0=665262 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>27214<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>3812<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:3812<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>ETRS89 \/ Belgian Lambert 2008<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>lcc<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "29702" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=omerc +lat_0=-18.9 +lonc=44.10000000000001 +alpha=18.9 +k=0.9995000000000001 +x_0=400000 +y_0=800000 +gamma=18.9 +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +pm=paris +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>2554<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>29702<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:29702<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>Tananarive (Paris) \/ Laborde Grid approximation<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>omerc<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>intl<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "32738" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=utm +zone=38 +south +datum=WGS84 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>3188<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>32738<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:32738<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>WGS 84 \/ UTM zone 38S<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>utm<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>WGS84<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "32620" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=utm +zone=20 +datum=WGS84 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>3104<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>32620<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:32620<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>WGS 84 \/ UTM zone 20N<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>utm<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>WGS84<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "2975" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=utm +zone=40 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>942<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>2975<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:2975<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>RGR92 \/ UTM zone 40S<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>utm<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "4471" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=utm +zone=38 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>27721<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>4471<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:4471<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>RGM04 \/ UTM zone 38S<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>utm<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "21781" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=600000 +y_0=200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>1919<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>21781<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:21781<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>CH1903 \/ LV03<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>somerc<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>bessel<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "2169" ]
        then
          sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=tmerc +lat_0=49.83333333333334 +lon_0=6.166666666666667 +k=1 +x_0=80000 +y_0=100000 +ellps=intl +towgs84=-189.6806,18.3463,-42.7695,-0.33746,-3.09264,2.53861,0.4598 +units=m +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srsid>145<\/srsid>/<srsid>160<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<srid>2154<\/srid>/<srid>2169<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:2169<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>Luxembourg 1930 \/ Gauss<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>tmerc<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>intl<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
          sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>false<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$c_epsg" = "2154" ]
        then
          echo "EPSG - 2154"
        else
            echo "EPSG - Erreur de paramètre"
            exit 0
        fi

        #----------------------------------------------------------------------------------

        if [ "$PAYS" = "ALGERIE" ]
        then
          #Couche WILAYAS
          sed -i -e "s/ARRONDISSEMENT/WILAYAS/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "BENIN" ]
        then
          #Couche DEPARTEMENT
          sed -i -e "s/ARRONDISSEMENT/DEPARTEMENT/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "BURKINA_FASO" ] || [ "$PAYS" = "CAMEROUN" ] || [ "$PAYS" = "DJIBOUTI" ] || [ "$PAYS" = "GUINEE" ] || [ "$PAYS" = "MADAGASCAR" ] || [ "$PAYS" = "MALI" ] || [ "$PAYS" = "MAROC" ] || [ "$PAYS" = "NIGER" ] || [ "$PAYS" = "SENEGAL_GAMBIE" ] || [ "$PAYS" = "TCHAD" ] || [ "$PAYS" = "TOGO" ]
        then
          #Couche REGION
          sed -i -e "s/ARRONDISSEMENT/REGION/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "BURUNDI" ] || [ "$PAYS" = "CONGO_RDC" ] || [ "$PAYS" = "GABON" ] || [ "$PAYS" = "GUINEE_EQUATORIALE" ] || [ "$PAYS" = "BELGIQUE" ]
        then
          #Couche PROVINCE
          sed -i -e "s/ARRONDISSEMENT/PROVINCE/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "COMORES" ] || [ "$PAYS" = "SEYCHELLES" ]
        then
          #Couche LIMITE
          sed -i -e "s/ARRONDISSEMENT/LIMITE/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "CONGO_RC" ] || [ "$PAYS" = "COTE_D_IVOIRE" ] || [ "$PAYS" = "RWANDA" ] || [ "$PAYS" = "LUXEMBOURG" ]
        then
          #Couche DISTRICT
          sed -i -e "s/ARRONDISSEMENT/DISTRICT/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "REPUBLIQUE_CENTRAFRICAINE" ]
        then
          #Couche PREFECTURE
          sed -i -e "s/ARRONDISSEMENT/PREFECTURE/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "TUNISIE" ]
        then
          #Couche GOUVERNORAT
          sed -i -e "s/ARRONDISSEMENT/GOUVERNORAT/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "SUISSE" ]
        then
          #Couche CANTON
          sed -i -e "s/ARRONDISSEMENT/CANTON/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "ANDORRE" ]
        then
          #Couche COMMUNE
          sed -i -e "s/ARRONDISSEMENT/COMMUNE/g" data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/Z_PROJET_OSM2IGEO.qgs
        elif [ "$PAYS" = "FRANCE" ]
        then
            echo "LIMTE - FRANCE"
        else
            echo "LIMTE - Erreur de paramètre"
            exit 0
        fi
    elif [ "$FORMAT_SIG" = "SQL" ];
      then
        cp 'attachement/IMPORT_PG.sql' data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/IMPORT_PG.sql
    else
        echo "SQL >> AUCUN PROJET"
    fi
    #----------------------------------------------------------------------------------
    #ZIP
    cd $REPER/data_out/$PAYS
    zip -r $DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ'.zip' $DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ/*
    rm -r $DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ

    #Envoyer les fichiers sur un espace FTP
    #curl -s -T $REPER/data_out/$PAYS/$DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ.zip ftp://ftp-xxxxxxx/$PAYS/ --user "IDENTIFIANT:PASSWORD"
    #curl -s -u "IDENTIFIANT:PASSWORD" "ftp://ftp-xxxxxxx/$PAYS/" -Q "-DELE $DATE_OLD'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ.zip"

    #rm -r $DATE_T'_OSM2IGEO_'${file%%.*}'_'$FORMAT_SIG$NZ.zip

done
#----------------------------------------------------------------------------------
#Suppression des fichiers temporaires
cd $REPER
cd data_temp/$PAYS/$OUT_EPSG/
rm -rfv *

#----------------------------------------------------------------------------------
end=$(date '+%s')
echo "DUREE: $((($end-$start) / 3600))hrs $(((($end-$start) / 60) % 60))min $((($end-$start) % 60))sec"
