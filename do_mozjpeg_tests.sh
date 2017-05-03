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
done
