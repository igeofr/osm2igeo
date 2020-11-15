#!/bin/bash

# 2019-2020 Florian Boret
# https://github.com/igeofr/osm2igeo
# https://creativecommons.org/licenses/by-sa/4.0/deed.fr

if [ "$FORMAT_SIG" = "SHP" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU.shp"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/"*.shp)
  do
    if [ -f "$file" ]
      then
        echo "merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln SURFACE_EAU
      else
        echo "creating merge $i"
        $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
    fi
  done
fi
if [ "$FORMAT_SIG" = "GPKG" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE.gpkg"

  for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/"*.gpkg)
  do
    echo "merge $i"
    $LINK_OGR -progress -f 'GPKG' -update -append --debug ON -lco SPATIAL_INDEX=YES $file $i $(basename "${i%.*}") -nln SURFACE_EAU
  done
fi
if [ "$FORMAT_SIG" = "SQL" ]
then
  file="./data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU.sql"
  ( cat "./scripts_V3/D_OSM_HYDROGRAPHIE/SURFACE_EAU_create.sql" ; cat "./data_temp/$PAYS/$OUT_EPSG/D_OSM_HYDROGRAPHIE/SURFACE_EAU/"*.sql) > $file
fi
