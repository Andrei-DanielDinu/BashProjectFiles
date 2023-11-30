#!/bin/bash

# Directory path to search for duplicates
directory="/home/andreidinu/BashScripts/listDuplicates/folder"

# Create an associative array to store file hashes
declare -A file_hashes

# Function to calculate file hashes
calculate_hash() {
    local file="$1"
    md5sum "$file" | awk '{print $1}'
}

# Check if the directory exists
if [ -d "$directory" ]; then
    # Loop through each file in the directory
    while IFS= read -r file; do
        # Calculate hash of the file
        file_hash=$(calculate_hash "$file")
        
        # Check if the hash already exists in the array
        if [[ -n "${file_hashes[$file_hash]}" ]]; then
            echo "Duplicate found:"
            echo "  File 1: ${file_hashes[$file_hash]}"
            echo "  File 2: $file"
            echo "----"
        else
            # Store file hash in the array
            file_hashes[$file_hash]="$file"
        fi
    done < <(find "$directory" -type f)
else
    echo "Directory '$directory' does not exist."
fi

