#!/bin/bash

GUETZLI_CMD=guetzli

for INPUT_SET in cms products; do
  INPUT_DIR=inputs/$INPUT_SET
  OUTPUT_DIR="${INPUT_DIR/inputs/outputs}"
  mkdir -p $OUTPUT_DIR/guetzli

  find $INPUT_DIR -name '*.jpg' | awk -F'/' '{ print $3 }' | xargs -I{} -P4 \
    bash -c "$GUETZLI_CMD $INPUT_DIR/{} $OUTPUT_DIR/guetzli/{}"
done
