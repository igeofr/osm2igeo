#!/bin/bash

file="./data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU.shp"

for i in $(ls "./data_temp/D_OSM_HYDROGRAPHIE/SURFACE_EAU/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln SURFACE_EAU
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
