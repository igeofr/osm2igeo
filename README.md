# **osm2igeo**

**[Télécharger les données générées sur la France métropolitaine](https://cloud.data-wax.com/index.php/s/myFFjcLzMFk9QB7)** (Découpage suivant les anciennes régions)

---
## Objectif du projet

Utiliser la richesse des informations disponibles dans [OpenStreetMap](http://www.openstreetmap.fr) et les valoriser sous la forme d'une pseudo "BDTOPO® | IGN" afin qu'elles puissent facilement être exploitées dans une application SIG.

![Exemple sur Limoges](/exemples_visuels/exemple2.jpg)

## Pourquoi cette idée ?

Je rejoins ce qu'à écrit P. Archambault au sujet des données OSM et de leur utilisation par des géomaticiens :
> La structure de la base de données sous-jacente est [...] un peu complexe et nécessite un investissement chronophage pour réussir ses extractions. Il faut quelques connaissances en géomatique pour plonger dans le bain de données OSM. Le format du fichier .osm, xml tout en un, est déroutant pour les utilisateurs de SIG et les statisticiens. Le fichier .osm est un format texte balisé (xml) facile à manipuler par les développeurs. Mais il l’est beaucoup moins par les analystes. Les informations ne sont pas tabulées en colonne et les objets géographiques sont, le plus souvent, mal lus par les SIG classiques. QGIS réussit à lire nativement les fichers .osm. Mais il est impossible d’espérer lire et requêter sur un fichier France.osm directement : les structure et volumétrie de données [...] ne passent pas…   

*Source : [Comment accéder en masse aux informations vectorielles d'Open Street Map ?](http://tempogeo.blogspot.com/2016/12/comment-acceder-en-masse-aux.html)*

 Partant de ce constat, l'idée était donc de trouver une solution permettant d'exploiter la masse d'informations présente dans OSM pour en faire un produit "SIG" facilement exploitable.


## Les données générées
**[Télécharger les données générées sur la France métropolitaine](https://cloud.data-wax.com/index.php/s/myFFjcLzMFk9QB7)** (Découpage suivant les anciennes régions)

**Attention :** Les fichiers en générés ne respectent pas les spécifications de la BD TOPO ils visent seulement à s'en rapprocher pour pallier à un besoin de données/informations.

## Origine des données

Les données OSM utilisées pour générer ces fichiers régionaux proviennent de [Geofabrik](https://download.geofabrik.de/europe/france.html).

*Il est possible d'utiliser des données OSM provenant d'autres sources.*

## Les points forts

  * Adaptabilité de la chaîne
  * Donnée ouverte basée sur le projet collaboratif [OpenStreetMap](http://www.openstreetmap.fr)
  * Couverture régionale
  * Mise à jour en continu possible

## Les points faibles

  * Hétérogénéité spatiale & attributaire (Hétérogénéités des sources et des compétences des contributeurs)

## Formats

* Shapefile
* Geopackage (Ce format est produit mais pas publié car notre serveur est un peu trop petit. N'hésitez pas à nous envoyer un mail en cas de besoin))

*Il est possible d'envisager d'autres formats si le besoin se fait sentir.*

## Projections disponibles

Pour la France métropole : (RGF 93) projection Lambert-93 (EPSG : 2154)
Pour la Belgique : (ETRS89) projection Lambert 2008 (EPSG : 3812)
Pour les différents pays d'Afrique : (WGS84) projection WGS84 (EPSG : 4326)

*Il est possible de générer les fichiers dans d'autres systèmes de projection en modifiant les variables dans les scripts.*

## Mises à jour
Une mise à jour est disponible chaque mois.

## Fonctionnement de la chaine osm2igeo

1. Les données OSM sont récupérées au format .pbf depuis le site [Geofabrik](https://download.geofabrik.de/europe/france.html)
    * les script permettant le téléchargement des données : 00_Download
2. Un script "maître" fait appel à une série de scripts "esclaves" et qui font eux-mêmes appel à ogr2ogr pour mettre en forme et convertir la donnée au format .shp et prochainement .gpk
    *  des scripts "maître" : 01_Script_pays
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

## Pistes d'évolution
* Créer un wiki pour décrire les couches/requêtes
* Compléter les métadonnées de chacune des couches
* Compléter/affiner certaines requêtes
* Améliorer le rendu du projet QGIS

## Licence
Les données sont fournies sous licence ODbL (Open Database Licence). Cette licence implique : l'attribution et le partage à l'identique.

* Pour la mention d'attribution veuillez indiquer "source: osm2igeo par Data\Wax" ainsi que la date du jeu de données.
* Pour le partage à l'identique, toute amélioration des données de osm2igeo doit être repartagée sous licence identique.

## Le mot de la fin
Merci de nous faire remonter : les erreurs et/ou les problèmes que vous rencontrez.

Pour toute question concernant le projet ou le jeu de données, vous pouvez me contacter : florian.boret)at(data-wax.com

---
## Pour aller plus loin :
* [Récupérer des données OpenStreetMap via GDAL/OGR](http://www.portailsig.org/content/recuperer-des-donnees-openstreetmap-gdalogr)  
* [OpenStreetMap – Convertir les données au format SHP](https://wiki.cartocite.fr/doku.php?id=openstreetmap:geomatique:convertir_les_donnees_au_format_shp)
* [Comment accéder en masse aux informations vectorielles d'Open Street Map ?](http://tempogeo.blogspot.com/2016/12/comment-acceder-en-masse-aux.html)
