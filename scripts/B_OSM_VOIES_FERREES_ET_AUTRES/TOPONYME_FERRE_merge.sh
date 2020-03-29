#!/bin/bash

file="./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE.shp"

for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/B_OSM_VOIES_FERREES_ET_AUTRES/TOPONYME_FERRE/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln TOPONYME_FERRE
      else
           echo "creating merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
