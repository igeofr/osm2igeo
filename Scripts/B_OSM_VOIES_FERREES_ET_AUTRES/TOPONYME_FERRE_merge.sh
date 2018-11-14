#!/bin/bash

file="./data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE.shp"

for i in $(ls "./data_temp/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln TOPONYME_FERRE
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
