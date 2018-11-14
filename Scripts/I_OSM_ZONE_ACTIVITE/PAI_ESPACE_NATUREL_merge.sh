#!/bin/bash

file="./data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL.shp"

for i in $(ls "./data_temp/I_OSM_ZONE_ACTIVITE/PAI_ESPACE_NATUREL/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "creating merge"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco ENCODING=$ENCODAGE -update -append $file $i -nln PAI_ESPACE_NATUREL
      else
           echo "merging…… $i"
           $LINK_OGR -f 'ESRI Shapefile' --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
