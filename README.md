# DevStart

A simple script manager for development environment setup and tasks.

## Usage

```bash
./init.sh <command>
```

Available commands:
- `svelte` - Start Svelte development environment

## Adding New Commands

1. Create a new script in the `scripts/` directory with a `.sh` extension
2. Make the script executable: `chmod +x scripts/your-script.sh`
3. The script name (without `.sh`) becomes the available command

Example:
```bash
# Create new script
echo '#!/bin/bash\necho "Hello World"' > scripts/hello.sh
chmod +x scripts/hello.sh

# Run it
./init.sh hello
```

## Directory Structure

```
.
├── init.sh         # Main script runner
├── scripts/        # Directory containing all command scripts
│   └── svelte.sh   # Svelte development environment setup
└── README.md       # This documentation
```
