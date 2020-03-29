#!/bin/bash

file="./data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE.shp"

for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/T_OSM_TOPONYMES/LIEU_DIT_HABITE/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln LIEU_DIT_HABITE
      else
           echo "creating merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
