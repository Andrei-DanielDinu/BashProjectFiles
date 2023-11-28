#!/bin/bash

# Define directories/files to backup
backup_source="filesToBeSaved"
backup_destination="savedFiles"

# Create timestamp for backup files
timestamp=$(date +"%Y-%m-%d")

# Create a backup directory with today's date
backup_folder="$backup_destination/backup_$timestamp"
mkdir -p "$backup_folder"

# Perform backup using rsync
rsync -avz "$backup_source" "$backup_folder"

echo "Backup completed at $timestamp"

