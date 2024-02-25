#!/bin/bash

# Directory containing the components
SEARCH_DIR="src/app/components"

# Global styles file
GLOBAL_STYLES="src/styles.css"

# Output file
OUTPUT_FILE="combined_files.txt"

# Check if output file already exists and remove it to start fresh
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# Function to append file content with a header
append_with_label () {
    echo "===== $1 =====" >> "$OUTPUT_FILE"
    cat "$1" >> "$OUTPUT_FILE"
}

# Find and process .ts, .html, and .css files
find "$SEARCH_DIR" -type f \( -iname "*.ts" -o -iname "*.html" -o -iname "*.css" \) | while read -r file; do
    append_with_label "$file"
done

# Append the global styles file separately
if [ -f "$GLOBAL_STYLES" ]; then
    echo "===== $GLOBAL_STYLES =====" >> "$OUTPUT_FILE"
    cat "$GLOBAL_STYLES" >> "$OUTPUT_FILE"
fi

echo "Combination complete. Output is in $OUTPUT_FILE"

