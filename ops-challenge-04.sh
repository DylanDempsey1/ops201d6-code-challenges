#!/bin/bash

# Ops 201d6 
# Dylan Dempsey
# 02/09/2023
# Write a script that: Creates four directories: dir1, dir2, dir3, dir4, Put the names of the four directories in an array, References the array variable to create a new .txt file in each directory


# Main

mkdir dir1 dir2 dir3 dir4

dirs=(dir1 dir2 dir3 dir4)

for dir in "${dirs[@]}"; do 
touch "$dir"/"dir".txt
done

# ChatGPT was used to create this!

#End