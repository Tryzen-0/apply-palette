#!/bin/sh

# Check if ImageMagick is installed
command -v convert >/dev/null 2>&1 || { echo >&2 "ImageMagick is required but it's not installed.  Aborting."; exit 1; }

# Check if an input file was provided
if [ -z "$1" ]; then
    echo "No input file provided. Please provide an input file as the first argument."
    exit 1
fi

# Check if the input file exists
if [ ! -f "$1" ]; then
    echo "Input file not found."
    exit 1
fi

# Define the output file name
output_file="remapped_colors_$(basename "$1")"

# Apply the color palette
convert "$1" -colorspace RGB -dither None -remap mocha.png "$output_file"

echo "Image has been processed and exported as $output_file"
