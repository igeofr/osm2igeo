#!/bin/bash

file="./data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI.shp"

for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/X_OSM_TOPO/TOPO_POI/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln TOPO_POI
      else
           echo "creating merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
