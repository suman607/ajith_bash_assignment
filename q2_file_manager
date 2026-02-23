#!/bin/bash
# q2_file_manager.sh
# File and Directory Manager Script

while true
do
    echo "========== FILE & DIRECTORY MANAGER =========="
    echo "1. List files in current directory"
    echo "2. Create a new directory"
    echo "3. Create a new file"
    echo "4. Delete a file"
    echo "5. Rename a file"
    echo "6. Search for a file"
    echo "7. Count files and directories"
    echo "8. Exit"
    echo "=============================================="
    read -p "Enter your choice: " choice

    case $choice in
        1) ls -lh ;;
        
        2) read -p "Enter directory name: " dirname
           mkdir -p "$dirname" && echo "Directory created successfully." ;;
        
        3) read -p "Enter file name: " filename
           touch "$filename" && echo "File created successfully." ;;
        
        4) read -p "Enter file name to delete: " filename
           if [ -f "$filename" ]; then
               read -p "Are you sure? (y/n): " confirm
               if [ "$confirm" = "y" ]; then
                   rm "$filename"
                   echo "File deleted."
               fi
           else
               echo "File does not exist!"
           fi ;;
        
        5) read -p "Enter old file name: " oldname
           read -p "Enter new file name: " newname
           if [ -f "$oldname" ]; then
               mv "$oldname" "$newname"
               echo "File renamed successfully."
           else
               echo "File does not exist!"
           fi ;;
        
        6) read -p "Enter file name pattern to search: " pattern
           find . -name "*$pattern*" ;;
        
        7) echo "Total Files: $(find . -type f | wc -l)"
           echo "Total Directories: $(find . -type d | wc -l)" ;;
        
        8) echo "Exiting..."
           break ;;
        
        *) echo "Invalid choice!" ;;
    esac
done
