#!/bin/bash

target_path="$1"
cd "$target_path" || exit 1

echo "Setting up new Supabase project in $target_path..."

# Check if Supabase CLI is installed
if ! command -v supabase &> /dev/null; then
    echo "Supabase CLI not found. Please install it first."
    exit 1
fi

# Initialize new Supabase project
supabase init

# Generate types (optional but recommended)
echo "Generating database types..."
supabase gen types typescript --local > types/supabase.ts

echo "Supabase project initialized successfully!"
echo "Next steps:"
echo "1. Configure your project in supabase/config.toml"
echo "2. Run 'supabase start' to start your local development environment"
echo "3. Run 'supabase db diff' to create your first migration"
