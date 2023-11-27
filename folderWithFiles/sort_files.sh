#!/bin/bash

# Check if at least one file type argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_extension1> <file_extension2> ..."
    exit 1
fi

# Loop through each file type argument
for file_extension in "$@"; do
    target_dir="${file_extension}_files"

    # Create a directory for the specified file type
    mkdir -p "$target_dir"

    # Move files of the specified type to the target directory
    for file in *."$file_extension"; do
        if [ -f "$file" ]; then
            mv "$file" "$target_dir/$file"
        fi
    done

    echo "Files of type .$file_extension sorted into $target_dir folder."
done

