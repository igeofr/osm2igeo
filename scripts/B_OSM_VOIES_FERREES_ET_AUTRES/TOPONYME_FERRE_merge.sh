#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
if [ "$FORMAT_SIG" = "SHP" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE.shp"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/"*.shp)
  do
    if [ -f "$file" ]
      then
        echo "merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln TOPONYME_FERRE
      else
        echo "creating merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
    fi
  done
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES.gpkg"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/"*.gpkg)
  do
    echo "merge $i"
    $LINK_OGR -progress -f 'GPKG' -update -append --debug ON -lco SPATIAL_INDEX=YES $file $i $(basename "${i%.*}") -nln TOPONYME_FERRE
  done
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE.sql"
  ( cat "./scripts/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE_create.sql" ; cat "./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/"*.sql) > $file
fi
