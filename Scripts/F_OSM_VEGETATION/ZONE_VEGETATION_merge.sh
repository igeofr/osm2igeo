#!/bin/bash

file="./data_temp/F_OSM_VEGETATION/ZONE_VEGETATION.shp"

for i in $(ls "./data_temp/F_OSM_VEGETATION/ZONE_VEGETATION/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln ZONE_VEGETATION
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
