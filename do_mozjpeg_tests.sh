#!/bin/bash

LIBJPEG_CMD=/home/ubuntu/libjpeg-turbo-1.5.1/jpegtran
MOZJPEG_CMD=/home/ubuntu/mozjpeg-3.2/jpegtran

for INPUT_SET in cms products; do
  INPUT_DIR=inputs/$INPUT_SET/
  OUTPUT_DIR="${INPUT_DIR/inputs/outputs/}"

  mkdir -p $OUTPUT_DIR/mozjpeg $OUTPUT_DIR/libjpeg
  rm -rf $OUTPUT_DIR/mozjpeg/*.jpg $OUTPUT_DIR/libjpeg/*.jpg

  find $INPUT_DIR -name '*.jpg' | awk -F'/' '{ print $3 }' | xargs -I{} -P4 \
    bash -c "$LIBJPEG_CMD -optimize -outfile $OUTPUT_DIR/libjpeg/{} $INPUT_DIR/{} && $MOZJPEG_CMD -optimize -outfile '$OUTPUT_DIR/mozjpeg/{}' '$INPUT_DIR/{}'"

  INPUT_SIZE=$(expr $(cat $INPUT_DIR/*.jpg | wc -c) '/' '1024')
  MOZJPEG_SIZE=$(expr $(cat $OUTPUT_DIR/mozjpeg/*.jpg | wc -c) '/' '1024')
  LIBJPEG_SIZE=$(expr $(cat $OUTPUT_DIR/libjpeg/*.jpg | wc -c) '/' '1024')
  echo inputs  $INPUT_SIZE kB $(ls -lah $INPUT_DIR/*.jpg | wc -l) files
  echo libjpeg $LIBJPEG_SIZE kB $(ls -lah $OUTPUT_DIR/libjpeg/*.jpg | wc -l) files
  echo mozjpeg $MOZJPEG_SIZE kB $(ls -lah $OUTPUT_DIR/mozjpeg/*.jpg | wc -l) files \
    $(( ($MOZJPEG_SIZE - $LIBJPEG_SIZE) * 100 / $LIBJPEG_SIZE))% smaller
done
