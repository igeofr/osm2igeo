#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr

if [ "$FORMAT_SIG" = "SHP" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT.shp"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/"*.shp)
  do
    if [ -f "$file" ]
      then
        echo "merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln PAI_SCIENCE_ENSEIGNEMENT
      else
        echo "creating merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
    fi
  done
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE.gpkg"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/"*.gpkg)
  do

    echo "merge $i"
    $LINK_OGR -progress -f 'GPKG' -update -append --debug ON -lco SPATIAL_INDEX=YES $file $i $(basename "${i%.*}") -nln PAI_SCIENCE_ENSEIGNEMENT
  done
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT.sql"
  ( cat "./scripts/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT_create.sql" ; cat "./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/"*.sql) > $file
fi
