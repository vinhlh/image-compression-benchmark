#!/bin/bash

INPUT_DIR=inputs/products
OUTPUT_DIR=outputs/products
COMPRESSOR=guetzli

mkdir -p $OUTPUT_DIR/$COMPRESSOR

start=$(date)
find $INPUT_DIR -name '*.jpg' | awk -F'/' '{ print $3 }' | xargs -I{} -P4 bash -c "echo 'Processing {}' && $COMPRESSOR $INPUT_DIR/{} $OUTPUT_DIR/$COMPRESSOR/{}"
echo "Start : $start"
echo "Finish: $(date)"
