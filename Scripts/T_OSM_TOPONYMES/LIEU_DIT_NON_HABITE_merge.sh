#!/bin/bash

file="./data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE.shp"

for i in $(ls "./data_temp/T_OSM_TOPONYMES/LIEU_DIT_NON_HABITE/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln LIEU_DIT_NON_HABITE
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
