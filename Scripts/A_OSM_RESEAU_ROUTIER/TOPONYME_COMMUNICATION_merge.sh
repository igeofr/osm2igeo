#!/bin/bash

file="./data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION.shp"

for i in $(ls "./data_temp/A_OSM_RESEAU_ROUTIER/TOPONYME_COMMUNICATION/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln TOPONYME_COMMUNICATION
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
