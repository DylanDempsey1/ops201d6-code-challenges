#!/bin/bash

# Ops-201d6-Code-Challenge-06
# Dylan Dempsey
# 02/13/23
# Create a script that detects if a file or directory exists, then creates it if it does not exist.

# Main 

# array of file/directory names to check
files=("file1.txt" "dir1" "file2.txt")

# loop through each file/directory name
for f in "${files[@]}"; do
  # check if the file/directory exists
  if [ -e "$f" ]; then
    echo "$f already exists."
  else
    # create the file/directory
    if [ -d "$f" ]; then
      mkdir "$f"
      echo "Created directory: $f"
    else
      touch "$f"
      echo "Created file: $f"
    fi
  fi
done

# ChatGPT assisted in the creation of this script.

# End