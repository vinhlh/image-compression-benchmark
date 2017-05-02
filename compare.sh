#!/bin/bash

ORIG_SIZE=$(expr $(cat inputs/products/* | wc -c) '/' '1024')

echo original $ORIG_SIZE kB
for DIR in mozjpeg guetzli guetzli_progressive; do
  SIZE=$(expr $(cat outputs/products/$DIR/* | wc -c) '/' '1024')
  echo $DIR $SIZE kB, $(( ($ORIG_SIZE - $SIZE) * 100 / $ORIG_SIZE))% smaller
done
