#!/bin/bash

file="./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT.shp"

for i in $(ls "./data_temp/$PAYS/$OUT_EPSG/I_OSM_ZONE_ACTIVITE/PAI_SCIENCE_ENSEIGNEMENT/"*.shp)
do

      if [ -f "$file" ]
      then
           echo "merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON -append $file $i -nln PAI_SCIENCE_ENSEIGNEMENT
      else
           echo "creating merge $i"
           $LINK_OGR -progress -f 'ESRI Shapefile' --debug ON --config SHAPE_ENCODING $ENCODAGE -lco SPATIAL_INDEX=YES -lco ENCODING=$ENCODAGE $file $i
fi
done
