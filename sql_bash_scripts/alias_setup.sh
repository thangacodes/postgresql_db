#!/bin/bash

# Define the aliases
ALIASES=(
    "alias pstart='sh /Users/td/psql_start.sh'"
    "alias pstop='sh /Users/td/psql_stop.sh'"
    "alias pdb='psql postgres'"
)

# Function to add aliases to a file
add_aliases() {
    local file="$1"
    for alias in "${ALIASES[@]}"; do
        # Check if the alias already exists
        if ! grep -Fxq "$alias" "$file"; then
            echo "$alias" >> "$file"
            echo "Added: $alias to $file"
        else
            echo "Already exists: $alias in $file"
        fi
    done
}

# Add aliases to .bashrc and .zshrc
add_aliases "$HOME/.bashrc"
add_aliases "$HOME/.zshrc"

# Reload .bashrc and .zshrc
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
    echo "Reloaded .bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
    echo "Reloaded .zshrc"
fi

echo "Aliases have been set up."
