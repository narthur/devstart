#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if a command was provided
if [ -z "$1" ]; then
    echo "Usage: ./init.sh <command> [path]"
    echo "Available commands:"
    for script in "$SCRIPT_DIR"/scripts/*.sh; do
        if [ -f "$script" ]; then
            basename=$(basename "$script")
            echo "  ${basename%.sh}"
        fi
    done
    exit 1
fi

# Get the command and path
command="$1"
target_path="${2:-.}"  # Use second argument if provided, otherwise default to "."

# Create target directory if it doesn't exist
mkdir -p "$target_path"

# Check if directory is not empty and prompt user
if [ -n "$(ls -A "$target_path" 2>/dev/null)" ]; then
    echo "Warning: Directory '$target_path' is not empty."
    read -p "Do you want to continue? (y/N) " response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Operation cancelled."
        exit 1
    fi
fi

# Get the script path
script_path="$SCRIPT_DIR/scripts/${command}.sh"

# Check if the script exists
if [ ! -f "$script_path" ]; then
    echo "Error: Script '$script_path' not found"
    exit 1
fi

# Execute the script with the target path as an argument
bash "$script_path" "$target_path"
