#!/bin/bash
# Extract the date from the filename
filename=$(basename "$1")
date_part=$(echo "$filename" | cut -d'_' -f2)
year=$(echo "$date_part" | cut -d'-' -f1)
month=$(echo "$date_part" | cut -d'-' -f2)
day=$(echo "$date_part" | cut -d'-' -f3)

# Create the target directory
target_dir="/var/www/html/motion/$year/$month/$day"
mkdir -p "$target_dir"

# Move the file to the target directory
mv "$1" "$target_dir/"

