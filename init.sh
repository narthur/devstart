#!/bin/bash

# Check if a command was provided
if [ -z "$1" ]; then
    echo "Usage: ./devstart.sh <command>"
    echo "Available commands:"
    for script in *.sh; do
        if [ "$script" != "devstart.sh" ]; then
            echo "  ${script%.sh}"
        fi
    done
    exit 1
fi

# Get the command
command="$1"
script_path="./scripts/${command}.sh"

# Check if the script exists
if [ ! -f "$script_path" ]; then
    echo "Error: Script '$script_path' not found"
    exit 1
fi

# Execute the script
bash "$script_path"
