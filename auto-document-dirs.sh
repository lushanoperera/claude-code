#!/bin/bash

# Auto-Document Directories Script
# Creates CLAUDE.md for any new directory in monitored projects

echo "=== Auto-Document Directories ==="
echo "Creating CLAUDE.md files for undocumented directories..."
echo ""

# Function to create CLAUDE.md for a directory
create_dir_claude_md() {
    local dir="$1"
    local dir_name=$(basename "$dir")
    local parent_name=$(basename "$(dirname "$dir")")
    
    # Get list of files and subdirectories
    local files=$(ls -la "$dir" 2>/dev/null | grep -v "^total" | grep -v "^\.$" | grep -v "^\.\.$" | tail -n +2)
    
    cat > "$dir/CLAUDE.md" << EOF
# Directory: $dir_name

## Purpose
This directory is part of the $parent_name project structure.

## Contents
\`\`\`
$(ls -la "$dir" 2>/dev/null | grep -v "^total" | head -20)
\`\`\`

## Files & Subdirectories
EOF

    # Add file descriptions
    while IFS= read -r line; do
        if [ -n "$line" ]; then
            filename=$(echo "$line" | awk '{print $NF}')
            if [[ "$filename" != "." && "$filename" != ".." && "$filename" != "CLAUDE.md" ]]; then
                echo "- \`$filename\` - [Purpose/Description]" >> "$dir/CLAUDE.md"
            fi
        fi
    done <<< "$files"

    cat >> "$dir/CLAUDE.md" << EOF

## Context Notes
This directory follows the project's MCP access policy:
- Default MCPs: memory-bank, knowledge-graph, context7-mcp, gemini-cli
- Restricted MCPs: Only for FrontendDeveloper and browser-automation-tools

## Related Documentation
- Parent: \`../$parent_name/CLAUDE.md\`
- Project Root: See root CLAUDE.md for project overview

---
**Auto-generated**: $(date +%Y-%m-%d)
EOF

    echo "  ✓ Created CLAUDE.md for $dir_name"
}

# Function to recursively check directories
check_directory_recursive() {
    local dir="$1"
    local max_depth="$2"
    local current_depth="$3"
    
    # Skip if max depth reached
    if [ "$current_depth" -gt "$max_depth" ]; then
        return
    fi
    
    # Skip certain directories
    if [[ "$dir" == *"node_modules"* ]] || \
       [[ "$dir" == *".git"* ]] || \
       [[ "$dir" == *"vendor"* ]] || \
       [[ "$dir" == *"cache"* ]] || \
       [[ "$dir" == *"tmp"* ]] || \
       [[ "$dir" == *"dist"* ]] || \
       [[ "$dir" == *"build"* ]]; then
        return
    fi
    
    # Check if CLAUDE.md exists in this directory
    if [ ! -f "$dir/CLAUDE.md" ] && [ "$current_depth" -gt 0 ]; then
        echo "Found undocumented directory: $(basename "$dir")"
        create_dir_claude_md "$dir"
    fi
    
    # Recursively check subdirectories
    for subdir in "$dir"/*/; do
        if [ -d "$subdir" ]; then
            check_directory_recursive "$subdir" "$max_depth" $((current_depth + 1))
        fi
    done
}

# Define projects to check
PROJECTS=(
    "$HOME/Sites/gioielleriabonanno.it"
    "$HOME/Sites/procurato.co.uk"
    "$HOME/Sites/villastuart.it"
    "$HOME/Sites/omiworld.org"
    "$HOME/Documents/Projects/claude-code-config"
    "$HOME/Documents/Projects/kido"
)

# Max depth to traverse (to avoid going too deep)
MAX_DEPTH=3

# Process each project
for project in "${PROJECTS[@]}"; do
    if [ -d "$project" ]; then
        echo ""
        echo "=== Processing: $(basename "$project") ==="
        check_directory_recursive "$project" $MAX_DEPTH 0
    fi
done

echo ""
echo "=== Documentation Complete ==="
echo "All directories now have CLAUDE.md files with:"
echo "- Directory purpose"
echo "- File listings"
echo "- MCP access policy reference"
echo "- Context notes"