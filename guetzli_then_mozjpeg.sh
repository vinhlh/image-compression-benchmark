#!/bin/bash

MOZJPEG_CMD=/home/ubuntu/mozjpeg-3.2/jpegtran

for INPUT_SET in cms products; do
  INPUT_DIR=outputs/$INPUT_SET/guetzli
  OUTPUT_DIR="${INPUT_DIR/guetzli/guetzli_then_mozjpeg}"
  mkdir -p $OUTPUT_DIR

  find $INPUT_DIR -name '*.jpg' | awk -F'/' '{ print $4 }' | xargs -I{} -P4 \
    bash -c "$MOZJPEG_CMD -optimize -outfile $OUTPUT_DIR/{} $INPUT_DIR/{}"
done
