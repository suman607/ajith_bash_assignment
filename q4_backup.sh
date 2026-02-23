#!/bin/bash
# q4_backup.sh
# Automated Backup Script

echo "========== AUTOMATED BACKUP SCRIPT =========="

read -p "Enter directory to backup: " SOURCE
read -p "Enter backup destination: " DEST

if [ ! -d "$SOURCE" ]; then
    echo "Source directory does not exist!"
    exit 1
fi

mkdir -p "$DEST"

echo "Backup Type:"
echo "1. Simple Copy"
echo "2. Compressed Archive (tar.gz)"
read -p "Enter choice: " choice

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
START=$(date +%s)

if [ "$choice" -eq 1 ]; then
    cp -r "$SOURCE" "$DEST/backup_$TIMESTAMP"
    BACKUP_FILE="$DEST/backup_$TIMESTAMP"
elif [ "$choice" -eq 2 ]; then
    tar -czf "$DEST/backup_$TIMESTAMP.tar.gz" "$SOURCE"
    BACKUP_FILE="$DEST/backup_$TIMESTAMP.tar.gz"
else
    echo "Invalid choice!"
    exit 1
fi

END=$(date +%s)
DURATION=$((END - START))

if [ -e "$BACKUP_FILE" ]; then
    echo "Backup completed successfully!"
    echo "File: $(basename "$BACKUP_FILE")"
    echo "Location: $DEST"
    echo "Size: $(du -sh "$BACKUP_FILE" | cut -f1)"
    echo "Time taken: $DURATION seconds"
else
    echo "Backup failed!"
fi
