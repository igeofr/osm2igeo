#!/bin/bash

file="./data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS.shp"

for i in $(ls "./data_temp/T_OSM_TOPONYMES/TOPONYME_DIVERS/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln TOPONYME_DIVERS
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
