#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if a command was provided
if [ -z "$1" ]; then
    echo "Usage: ./devstart.sh <command>"
    echo "Available commands:"
    for script in "$SCRIPT_DIR"/scripts/*.sh; do
        if [ -f "$script" ]; then
            basename=$(basename "$script")
            echo "  ${basename%.sh}"
        fi
    done
    exit 1
fi

# Get the command
command="$1"
script_path="$SCRIPT_DIR/scripts/${command}.sh"

# Check if the script exists
if [ ! -f "$script_path" ]; then
    echo "Error: Script '$script_path' not found"
    exit 1
fi

# Execute the script
bash "$script_path"
