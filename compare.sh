#!/bin/bash
GUETZLI_CMD=guetzli

for INPUT_SET in cms products; do
  INPUT_DIR=inputs/$INPUT_SET
  OUTPUT_DIR="${INPUT_DIR/inputs/outputs}"
  mkdir -p $OUTPUT_DIR/guetzli

  INPUT_SIZE=$(expr $(cat $INPUT_DIR/*.jpg | wc -c) '/' '1024')
  LIBJPEG_SIZE=$(expr $(cat $OUTPUT_DIR/libjpeg/*.jpg | wc -c) '/' '1024')
  MOZJPEG_SIZE=$(expr $(cat $OUTPUT_DIR/mozjpeg/*.jpg | wc -c) '/' '1024')
  GUETZLI_SIZE=$(expr $(cat $OUTPUT_DIR/guetzli/*.jpg | wc -c) '/' '1024')
  GUETZLI_THEN_MOZJPEG_SIZE=$(expr $(cat $OUTPUT_DIR/guetzli_then_mozjpeg/*.jpg | wc -c) '/' '1024')

  echo inputs  $INPUT_SIZE kB $(ls -lah $INPUT_DIR/*.jpg | wc -l) files
  echo libjpeg $LIBJPEG_SIZE kB $(ls -lah $OUTPUT_DIR/libjpeg/*.jpg | wc -l) files \
    $(( ($LIBJPEG_SIZE - $INPUT_SIZE) * 100 / $INPUT_SIZE))% smaller
  echo mozjpeg $MOZJPEG_SIZE kB $(ls -lah $OUTPUT_DIR/mozjpeg/*.jpg | wc -l) files \
    $(( ($MOZJPEG_SIZE - $INPUT_SIZE) * 100 / $INPUT_SIZE))% smaller
  echo guetzli $GUETZLI_SIZE kB $(ls -lah $OUTPUT_DIR/guetzli/*.jpg | wc -l) files \
    $(( ($GUETZLI_SIZE - $INPUT_SIZE) * 100 / $INPUT_SIZE))% smaller
  echo guetzli_then_mozjpeg $GUETZLI_THEN_MOZJPEG_SIZE kB $(ls -lah $OUTPUT_DIR/guetzli/*.jpg | wc -l) files \
    $(( ($GUETZLI_THEN_MOZJPEG_SIZE - $INPUT_SIZE) * 100 / $INPUT_SIZE))% smaller
done
