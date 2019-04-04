#Variable
export REPER=/home/datafolder
export PAYS=BURKINA_FASO

cd $REPER/data_in/AFRIQUE/

for file in $PAYS.pbf

do
    #Variables
    export OUT_EPSG=4326
    export LINK_OGR=ogr2ogr
    export DATA_IN=data_in/AFRIQUE/${file}
    export ENCODAGE=UTF-8
    export DATE=$(date '+%Y%m')
    export EMPRISE='-180 -90 180 90'
    export NZ='_WGS84_4326'

    cd $REPER/data_temp
    rm -rfv *
    cd $REPER

    #----------------------------------------------------------------------------------
    #A_OSM_RESEAU_ROUTIER
    mkdir data_temp/A_OSM_RESEAU_ROUTIER
    #Couche CHEMIN
    sh Scripts/A_OSM_RESEAU_ROUTIER/CHEMIN.sh > data_temp/A_OSM_RESEAU_ROUTIER/CHEMIN.txt 2>&1
    #Couche ROUTE
    sh Scripts/A_OSM_RESEAU_ROUTIER/ROUTE.sh > data_temp/A_OSM_RESEAU_ROUTIER/ROUTE.txt 2>&1
        #Couche SURFACE ROUTE
        mkdir data_temp/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE
            sh Scripts/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_parking.sh > data_temp/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_parking.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_peage.sh > data_temp/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_peage.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_place.sh > data_temp/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE/SURFACE_ROUTE_place.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE_merge.sh
        rm -r data_temp/A_OSM_RESEAU_ROUTIER/SURFACE_ROUTE
        #Couche TOPONYME COMMUNICATION
        mkdir data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_aire_repos.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_aire_repos.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_service.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_service.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_echangeur.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_echangeur.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_parking.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_parking.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_peage.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_peage.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_pont.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_pont.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_rond_point.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_rond_point.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_tunnel.sh > data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/TOPONYME_COMMUNICATION_tunnel.txt 2>&1
            sh Scripts/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION_merge.sh
        rm -r data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION
    #----------------------------------------------------------------------------------
    #B_OSM_VOIES_FERREES_ET_AUTRES
    mkdir data_temp/B_OSM_VOIES_FERREES_ET_AUTRES
        #Couche GARE
        sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/GARE.sh > data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/GARE.txt 2>&1
        #Couche TOPONYME FERRE
        mkdir data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE
            sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_gare_ferroviaire.sh > data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_gare_ferroviaire.txt 2>&1
            sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_telepherique.sh > data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_telepherique.txt 2>&1
            sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_halte_ferroviaire.sh > data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_halte_ferroviaire.txt 2>&1
            sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_voie_ferree.sh > data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/TOPONYME_FERRE_voie_ferree.txt 2>&1
            sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_merge.sh
        rm -r data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE
        #Couche TRONCON VOIE FERREE
        sh Scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TRONCON_VOIE_FERREE.sh > data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TRONCON_VOIE_FERREE.txt 2>&1
    #----------------------------------------------------------------------------------
    #C_OSM_TRANSPORT_ENERGIE
    mkdir data_temp/C_OSM_TRANSPORT_ENERGIE
        #Couche LIGNE ELECTRIQUE
        sh Scripts/C_OSM_TRANSPORT_ENERGIE/LIGNE_ELECTRIQUE.sh > data_temp/C_OSM_TRANSPORT_ENERGIE/LIGNE_ELECTRIQUE.txt 2>&1
        #Couche POSTE TRANSFORMATION
        sh Scripts/C_OSM_TRANSPORT_ENERGIE/POSTE_TRANSFORMATION.sh > data_temp/C_OSM_TRANSPORT_ENERGIE/POSTE_TRANSFORMATION.txt 2>&1
        #Couche PYLONE
        sh Scripts/C_OSM_TRANSPORT_ENERGIE/PYLONE.sh > data_temp/C_OSM_TRANSPORT_ENERGIE/PYLONE.txt 2>&1
    #----------------------------------------------------------------------------------
    #D_OSM_HYDROGRAPHIE
    mkdir data_temp/D_OSM_HYDROGRAPHIE
        #Couche CANALISATION EAU
        sh Scripts/D_OSM_HYDROGRAPHIE/CANALISATION_EAU.sh > data_temp/D_OSM_HYDROGRAPHIE/CANALISATION_EAU.txt 2>&1
        #Couche HYDRONYME
        #A créer #####################################################################
        #Couche POINT EAU
        mkdir data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU
            sh Scripts/D_OSM_HYDROGRAPHIE/POINT_EAU_fontaine.sh > data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_fontaine.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/POINT_EAU_source.sh > data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_source.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/POINT_EAU_station_pompage.sh > data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_station_pompage.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/POINT_EAU_lavoir.sh > data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_lavoir.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/POINT_EAU_puits.sh > data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU/POINT_EAU_puits.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/POINT_EAU_merge.sh
        rm -r data_temp/D_OSM_HYDROGRAPHIE/POINT_EAU
        #Couche RESERVOIR_EAU
        mkdir data_temp/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU
            sh Scripts/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU_chateau_d_eau.sh > data_temp/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU/RESERVOIR_EAU_chateau_d_eau.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU_reservoir_d_eau.sh > data_temp/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU/RESERVOIR_EAU_reservoir_d_eau.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU_merge.sh
        rm -r data_temp/D_OSM_HYDROGRAPHIE/RESERVOIR_EAU
        #Couche SURFACE EAU
        mkdir data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU
            sh Scripts/D_OSM_HYDROGRAPHIE/SURFACE_EAU_lac_etang.sh > data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_lac_etang.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/SURFACE_EAU_bassin.sh > data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_bassin.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/SURFACE_EAU_fleuve_riviere.sh > data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU/SURFACE_EAU_fleuve_riviere.txt 2>&1
            sh Scripts/D_OSM_HYDROGRAPHIE/SURFACE_EAU_merge.sh
        rm -r data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU
        #Couche TRONCON COURS EAU
        sh Scripts/D_OSM_HYDROGRAPHIE/TRONCON_COURS_EAU.sh > data_temp/D_OSM_HYDROGRAPHIE/TRONCON_COURS_EAU.txt 2>&1
    #----------------------------------------------------------------------------------
    #E_OSM_BATI
    mkdir data_temp/E_OSM_BATI
        #Couche BATI
        sh Scripts/E_OSM_BATI/BATI.sh > data_temp/E_OSM_BATI/BATI.txt 2>&1
        #Couche Cimetière
        sh Scripts/E_OSM_BATI/CIMETIERE.sh > data_temp/E_OSM_BATI/CIMETIERE.txt 2>&1
        #Couche PISTE AERODROME
        sh Scripts/E_OSM_BATI/PISTE_AERODROME.sh > data_temp/E_OSM_BATI/PISTE_AERODROME.txt 2>&1
        #Couche RESERVOIR
        mkdir data_temp/E_OSM_BATI/RESERVOIR
            sh Scripts/E_OSM_BATI/RESERVOIR_chateau_d_eau.sh > data_temp/E_OSM_BATI/RESERVOIR/RESERVOIR_chateau_d_eau.txt 2>&1
            sh Scripts/E_OSM_BATI/RESERVOIR_reservoir_d_eau.sh > data_temp/E_OSM_BATI/RESERVOIR/RESERVOIR_reservoir_d_eau.txt 2>&1
            sh Scripts/E_OSM_BATI/RESERVOIR_reservoir_industriel.sh > data_temp/E_OSM_BATI/RESERVOIR/RESERVOIR_reservoir_industriel.txt 2>&1
            sh Scripts/E_OSM_BATI/RESERVOIR_merge.sh
        rm -r data_temp/E_OSM_BATI/RESERVOIR
        #Couche TERRAIN SPORT
        mkdir data_temp/E_OSM_BATI/TERRAIN_SPORT
            sh Scripts/E_OSM_BATI/TERRAIN_SPORT_bassin_de_natation.sh > data_temp/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_bassin_de_natation.txt 2>&1
            sh Scripts/E_OSM_BATI/TERRAIN_SPORT_indifferencie.sh > data_temp/E_OSM_BATI/TERRAIN_SPORT/TERRAIN_SPORT_indifferencie.txt 2>&1
            sh Scripts/E_OSM_BATI/TERRAIN_SPORT_merge.sh
        rm -r data_temp/E_OSM_BATI/TERRAIN_SPORT
    #----------------------------------------------------------------------------------
    #F_OSM_VEGETATION
    mkdir data_temp/F_OSM_VEGETATION
        #Couche VEGETATION
        mkdir data_temp/F_OSM_VEGETATION/ZONE_VEGETATION
            sh Scripts/F_OSM_VEGETATION/ZONE_VEGETATION_foret.sh > data_temp/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_foret.txt 2>&1
            sh Scripts/F_OSM_VEGETATION/ZONE_VEGETATION_verger.sh > data_temp/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_verger.txt 2>&1
            sh Scripts/F_OSM_VEGETATION/ZONE_VEGETATION_vigne.sh > data_temp/F_OSM_VEGETATION/ZONE_VEGETATION/ZONE_VEGETATION_vigne.txt 2>&1
            sh Scripts/F_OSM_VEGETATION/ZONE_VEGETATION_merge.sh
        rm -r data_temp/F_OSM_VEGETATION/ZONE_VEGETATION
    #----------------------------------------------------------------------------------
    #H_OSM_ADMINISTRATIF
    mkdir data_temp/H_OSM_ADMINISTRATIF
        #Couche REGION
        sh Scripts/H_OSM_ADMINISTRATIF/REGION_BURKINA_FASO.sh > data_temp/H_OSM_ADMINISTRATIF/REGION.txt 2>&1
        #Couche CHEF LIEU
        sh Scripts/H_OSM_ADMINISTRATIF/CHEF_LIEU_POINT.sh > data_temp/H_OSM_ADMINISTRATIF/CHEF_LIEU.txt 2>&1
    #----------------------------------------------------------------------------------
    #I_OSM_ZONE_ACTIVITE
    mkdir data_temp/I_OSM_ZONE_ACTIVITE
        #Couche PAI ADMINISTRATIF MILITAIRE
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_borne.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_borne.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_poste.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_poste.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_pompier.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_pompier.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_penitentiaire.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_penitentiaire.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_gendarmerie.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_gendarmerie.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_hotel_departement.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_hotel_region.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_hotel_region.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_mairie.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_mairie.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_maison_forestiere.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_maison_forestiere.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_palais_de_justice.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_palais_de_justice.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_police.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_police.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_prefecture.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE/PAI_ADMINISTRATIF_MILITAIRE_prefecture.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_ADMINISTRATIF_MILITAIRE
        #Couche PAI CULTURE LOISIRS
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_camping.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_camping.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_digue.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_digue.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_dolmen.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_dolmen.txt 2>&1
            #A créer : Espace public #################################################
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_menhir.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_menhir.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_monument.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_monument.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_musee.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_musee.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_parc_de_loisirs.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_parc_de_loisirs.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_parc_des_expositions.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_parc_des_expositions.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_parc_zoologique.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_parc_zoologique.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_refuge.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_refuge.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_vestige.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_vestige.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_village_de_vacances.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS/PAI_CULTURE_LOISIRS_village_de_vacances.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_CULTURE_LOISIRS
        #Couche PAI ESPACE NATUREL
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_arbre.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_arbre.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_bois.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_bois.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_lieu_dit_non_habite.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_lieu_dit_non_habite.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_parc.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_parc.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_point_de_vue.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/PAI_ESPACE_NATUREL_point_de_vue.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL
        #Couche PAI GESTION EAUX
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_station_pompage.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX/PAI_GESTION_EAUX_station_pompage.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_station_epuration.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX/PAI_GESTION_EAUX_station_epuration.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_GESTION_EAUX
        #Couche PAI HYDROGRAPHIE
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_amer.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_amer.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_cascade.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_cascade.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_marais.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_marais.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_point_eau.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE/PAI_HYDROGRAPHIE_point_eau.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_HYDROGRAPHIE
        #Couche PAI INDUSTRIEL COMMERCIAL
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_aquaculture.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_aquaculture.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_carriere.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_carriere.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_centrale_electrique.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_centrale_electrique.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_divers_commercial.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_divers_commercial.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_divers_industriel.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_divers_industriel.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_marais_salant.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_marais_salant.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_marche.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_marche.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_mine.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL/PAI_INDUSTRIEL_COMMERCIAL_mine.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_INDUSTRIEL_COMMERCIAL
        #Couche PAI OROGRAPHIE
        #A créer #######################################################################
        #Couche PAI RELIGIEUX
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_croix.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_croix.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_catholique.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_catholique.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_orthodoxe.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_orthodoxe.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_protestant.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_protestant.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_islamique.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_islamique.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_israelite.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_israelite.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_culte_divers.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_culte_divers.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_tombeau.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX/PAI_RELIGIEUX_tombeau.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_RELIGIEUX
        #Couche PAI SANTE
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_SANTE
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SANTE_etablissement_hospitalier.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SANTE/PAI_SANTE_etablissement_hospitalier.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SANTE_etablissement_thermal.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SANTE/PAI_SANTE_etablissement_thermal.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SANTE_hopital.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SANTE/PAI_SANTE_hopital.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SANTE_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_SANTE
        #Couche PAI SCIENCE ENSEIGNEMENT
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_enseignement_primaire.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_enseignement_primaire.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_enseignement_secondaire.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_enseignement_secondaire.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_enseignement_superieur.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_enseignement_superieur.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_science.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/PAI_SCIENCE_ENSEIGNEMENT_science.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT
        #Couche PAI SPORT
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_SPORT
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SPORT_golf.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_golf.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SPORT_hippodrome.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_hippodrome.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SPORT_piscine.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_piscine.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SPORT_stade.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_SPORT/PAI_SPORT_stade.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_SPORT_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_SPORT
        #Couche PAI TRANSPORT
        #A créer : ###############################################################
        #mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_TRANSPORT
            #sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_TRANSPORT_merge.sh
        #rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_TRANSPORT
        #Couche PAI ZONE HABITATION
        mkdir data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_chateau.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_chateau.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_lieu_dit_habite.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_lieu_dit_habite.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_moulin.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_moulin.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_quartier.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_quartier.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_ruines.sh > data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION/PAI_ZONE_HABITATION_ruines.txt 2>&1
            sh Scripts/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION_merge.sh
        rm -r data_temp/I_OSM_ZONE_ACTIVITE/PAI_ZONE_HABITATION
    #----------------------------------------------------------------------------------
    #T_TOPONYMES
    mkdir data_temp/T_OSM_TOPONYMES
        #Couche LIEU DIT HABITE
        mkdir data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_chateau.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_chateau.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_lieu_dit_habite.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_lieu_dit_habite.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_moulin.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_moulin.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_quartier.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_quartier.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_refuge.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_refuge.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_ruines.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE/LIEU_DIT_HABITE_ruines.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_HABITE_merge.sh
        rm -r data_temp/T_OSM_TOPONYMES/LIEU_DIT_HABITE
        #Couche LIEU DIT NON HABITE
        mkdir data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_barrage.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_barrage.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_croix.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_croix.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_digue.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_digue.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_dolmen.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_dolmen.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_lieu_dit_non_habite.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_lieu_dit_non_habite.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_marais_salant.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_marais_salant.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_mine.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_mine.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_point_de_vue.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_point_de_vue.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_tombeau.sh > data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/LIEU_DIT_NON_HABITE_tombeau.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE_merge.sh
        rm -r data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE
        #Couche TOPONYME DIVERS
        mkdir data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_aerodrome.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_aerodrome.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_arbre.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_arbre.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_bois.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_bois.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_camping.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_camping.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_centrale_electrique.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_centrale_electrique.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_enceinte_militaire.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_enceinte_militaire.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_enseignement_superieur.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_enseignement_superieur.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_etablissement_hospitalier.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_hospitalier.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_etablissement_penitentiaire.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_penitentiaire.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_etablissement_thermal.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_etablissement_thermal.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_golf.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_golf.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_hopital.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_hopital.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_hippodrome.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_hippodrome.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_maison_forestiere.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_maison_forestiere.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_menhir.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_menhir.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_monument.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_monument.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_musee.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_musee.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc_de_loisirs.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc_de_loisirs.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc_des_expositions.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc_des_expositions.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_parc_zoologique.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_parc_zoologique.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_science.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_science.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_stade.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_stade.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_village_de_vacances.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_village_de_vacances.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_zone_industrielle.sh > data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/TOPONYME_DIVERS_zone_industrielle.txt 2>&1
            sh Scripts/T_OSM_TOPONYMES/TOPONYME_DIVERS_merge.sh
        rm -r data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS

    #----------------------------------------------------------------------------------
    #SORTIE SHP
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ
    mkdir data_out/$PAYS
    
    
    mkdir data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ
    cp -r data_temp/* data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/
    cp X_PROJET_V3_$PAYS'_SHP_'$OUT_EPSG.qgs.qgz data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/X_PROJET_V3.qgs.qgz
    cp X_Licence.txt data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/X_Licence.txt

    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/A_OSM_RESEAU_ROUTIER/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/B_OSM_VOIES_FERREES_ET_AUTRES/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/C_OSM_TRANSPORT_ENERGIE/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/D_OSM_HYDROGRAPHIE/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/E_OSM_BATI/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/F_OSM_VEGETATION/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/H_OSM_ADMINISTRATIF/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/I_OSM_ZONE_ACTIVITE/*.txt
    rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/T_OSM_TOPONYMES/*.txt

    #----------------------------------------------------------------------------------
    #SORTIE GEOPACKAGE
    
    mkdir data_out/$PAYS/$DATE'_'${file%%.*}'_GEOPACKAGE'$NZ
    cp X_PROJET_V3_$PAYS'_GEOPACKAGE_'$OUT_EPSG.qgs.qgz data_out/$PAYS/$DATE'_'${file%%.*}'_GEOPACKAGE'$NZ/X_PROJET_V3.qgs.qgz
    cp X_Licence.txt data_out/$PAYS/$DATE'_'${file%%.*}'_GEOPACKAGE'$NZ/X_Licence.txt
    for d in data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ/*;
    do
      for file_shp in $d/*.shp
      do
          $LINK_OGR -progress -s_srs EPSG:$OUT_EPSG -t_srs EPSG:$OUT_EPSG -append -update -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES -lco OVERWRITE=YES --debug ON -f "GPKG" data_out/$PAYS/$DATE'_'${file%%.*}'_GEOPACKAGE'$NZ/${d##*/}.gpkg ${file_shp}
      done
    done

    #----------------------------------------------------------------------------------
    #ZIP
    #zip -r ${file%%.*}$NZ.zip data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ
    #zip -r ${file%%.*}$NZ.zip data_out/$PAYS/$DATE'_'${file%%.*}'_GEOPACKAGE'$NZ
    #rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_SHP'$NZ
    #rm -r data_out/$PAYS/$DATE'_'${file%%.*}'_GEOPACKAGE'$NZ

done
