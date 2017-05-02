#!/bin/bash
FILES=./outputs/products/guetzli/*
for file in $FILES
do
  echo "Processing $file file..."
  new_file="${file/guetzli/guetzli_progressive/}"
  /usr/local/opt/mozjpeg/bin/jpegtran -optimize -outfile "$new_file" "$file"
done
