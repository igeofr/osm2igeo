# **osm2igeo**

**[Pour télécharger les données disponibles sur la France métropolitaine](https://cloud.data-wax.com/index.php/s/myFFjcLzMFk9QB7) (Découpage suivant les anciennes régions)**

## Objectif du projet

Utiliser la richesse des informations disponibles dans [OpenStreetMap](http://www.openstreetmap.fr) et les valoriser sous la forme d'une pseudo "BDTOPO® | IGN" afin qu'elles puissent facilement être exploitées dans une application SIG.

![Exemple sur Limoges](/exemples_visuels/exemple2.jpg)

## Pourquoi cette idée ?

Je rejoins ce qu'à écrit P. Archambault au sujet des données OSM et de leur utilisation par des géomaticiens :
> La structure de la base de données sous-jacente est [...] un peu complexe et nécessite un investissement chronophage pour réussir ses extractions. Il faut quelques connaissances en géomatique pour plonger dans le bain de données OSM. Le format du fichier .osm, xml tout en un, est déroutant pour les utilisateurs de SIG et les statisticiens. Le fichier .osm est un format texte balisé (xml) facile à manipuler par les développeurs. Mais il l’est beaucoup moins par les analystes. Les informations ne sont pas tabulées en colonne et les objets géographiques sont, le plus souvent, mal lus par les SIG classiques. QGIS réussit à lire nativement les fichers .osm. Mais il est impossible d’espérer lire et requêter sur un fichier France.osm directement : les structure et volumétrie de données [...] ne passent pas…   

*Source : [Comment accéder en masse aux informations vectorielles d'Open Street Map ?](http://tempogeo.blogspot.com/2016/12/comment-acceder-en-masse-aux.html)*

 Partant de ce constat, l'idée était donc de créer une solution permettant d'exploiter la masse d'informations présente dans OSM pour en faire un produit "SIG" facilement exploitable.

## Fonctionnement d'osm2igeo

1. La donnée OSM est récupérée au format .pbf depuis le site [Geofabrik](https://download.geofabrik.de/europe/france.html)
    * le script permettant le téléchargement des données : 00_Script_download.sh
2. Un script "maître" fait appel à une série de scripts "esclaves" et qui font eux-mêmes appel à ogr2ogr pour mettre en forme et convertir la donnée au format .shp (En projet : .gpk)
    *  le script "maître" : 01_Script_complet.sh
    *  les scripts "esclaves" sont classés par grandes catégories :
        * A_OSM_RESEAU_ROUTIER
        * B_OSM_VOIES_FERREES_ET_AUTRES
        * C_OSM_TRANSPORT_ENERGIE
        * D_OSM_HYDROGRAPHIE
        * E_OSM_BATI
        * F_OSM_VEGETATION
        * H_OSM_ADMINISTRATIF
        * I_OSM_ZONE_ACTIVITE
        * T_OSM_TOPONYMES
    * ils exploitent la puissance d'ogr2ogr pour traiter l'information. Les commandes ogr2ogr sont toutes basées sur l'utilisation du dialect SQL (SQLITE) qui travaille en association avec [le pilote OSM](https://www.gdal.org/drv_osm.html).
    * à chaque script "esclave" est associé un fichier xxx_osmconf.ini

  Plus d'infos sur les points 3 et 4 : [OpenStreetMap – Convertir les données au format SHP](https://wiki.cartocite.fr/doku.php?id=openstreetmap:geomatique:convertir_les_donnees_au_format_shp)

## Les points forts

  * Adaptabilité de la chaîne
  * Donnée ouverte basée sur le projet collaboratif [OpenStreetMap](http://www.openstreetmap.fr)
  * Couverture régionale
  * Mise à jour en continu

## Les points faibles

  * Hétérogénéité spatiale & attributaire (Hétérogénéités des sources et des compétences des contributeurs)

## Formats

* Shapefile
* Geopackage (Bientôt)

*Il est possible d'envisager d'autres formats si le besoin se fait sentir*

## Projections disponibles

Pour la métropole : (RGF 93) projection Lambert-93 (EPSG : 2154)

*Il est possible de générer les fichiers dans d'autres systèmes de projection en modifiant les variables dans les scripts.*

## Pistes d'évolution
* Créer un wiki pour décrire les couches/requêtes
* Compléter les métadonnées de chacune des couches
* Compléter/affiner certaines requêtes
* Améliorer le rendu du projet QGIS
* Générer du geopackage (EN COURS) et créer un projet associé

* Adapter les scripts pour générer de la donnée sur l'Afrique de l'Ouest


## A vous de jouer maintenant!
