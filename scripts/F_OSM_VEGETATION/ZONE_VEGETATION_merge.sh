#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr
if [ "$FORMAT_SIG" = "SHP" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION.shp"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION/"*.shp)
  do
    if [ -f "$file" ]
      then
        echo "merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln ZONE_VEGETATION
      else
        echo "creating merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
    fi
  done
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION.gpkg"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION/"*.gpkg)
  do
    echo "merge $i"
    $LINK_OGR -progress -f 'GPKG' -update -append --debug ON -lco SPATIAL_INDEX=YES $file $i $(basename "${i%.*}") -nln ZONE_VEGETATION
  done
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION.sql"
  ( cat "./scripts_V3/F_OSM_VEGETATION/ZONE_VEGETATION_create.sql" ; cat "./data_temp/$PAYS/$OUT_EPSG/F_OSM_VEGETATION/ZONE_VEGETATION/"*.sql) > $file
fi
