#!/bin/bash

# Set the directory path where the files are located
directory="/home/andreidinu/BashScripts/escapeSpaces"

# Move to the directory
cd "$directory" || exit

# Check if the directory exists
if [ -d "$directory" ]; then
    # Loop through each file in the directory
    for file in *; do
        # Replace spaces in file names with underscores
        new_name=$(echo "$file" | tr ' ' '_')
        
        # Rename the file
        if [ "$file" != "$new_name" ]; then
            mv -i "$file" "$new_name"
            echo "Renamed '$file' to '$new_name'"
        fi
    done
else
    echo "Directory '$directory' does not exist."
fi

