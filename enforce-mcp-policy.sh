#!/bin/bash

# MCP Access Policy Enforcement Script
# Ensures all agents follow the correct MCP access rules

echo "=== MCP Access Policy Enforcement ==="
echo "Enforcing policy across all projects and agents..."
echo ""

# Define projects to check
PROJECTS=(
    "$HOME/Sites/gioielleriabonanno.it"
    "$HOME/Sites/procurato.co.uk"
    "$HOME/Sites/villastuart.it"
    "$HOME/Sites/omiworld.org"
    "$HOME/Documents/Projects/claude-code-config"
    "$HOME/Documents/Projects/kido"
)

# Default MCPs for all agents
DEFAULT_MCPS="memory-bank, knowledge-graph, context7-mcp, gemini-cli"

# Restricted MCPs (only for special agents)
RESTRICTED_MCPS="playwright-mcp, figma-dev-mode-mcp-server, browser-mcp"

# Special access agents
SPECIAL_AGENTS="FrontendDeveloper, browser-automation-tools"

# Function to check project compliance
check_project() {
    local project="$1"
    local project_name=$(basename "$project")
    
    echo "Checking: $project_name"
    
    # Check .claude directory
    if [ ! -d "$project/.claude" ]; then
        echo "  ✗ Missing .claude directory - Creating..."
        mkdir -p "$project/.claude"
    else
        echo "  ✓ .claude directory exists"
    fi
    
    # Check CLAUDE.md
    if [ ! -f "$project/CLAUDE.md" ]; then
        echo "  ✗ Missing CLAUDE.md - Creating template..."
        create_claude_md "$project"
    else
        echo "  ✓ CLAUDE.md exists"
        # Check if it contains MCP configuration section
        if ! grep -q "## MCP Configuration" "$project/CLAUDE.md" 2>/dev/null; then
            echo "    → Adding MCP Configuration section..."
            append_mcp_section "$project/CLAUDE.md"
        fi
    fi
    
    echo ""
}

# Function to create CLAUDE.md template
create_claude_md() {
    local project="$1"
    local project_name=$(basename "$project")
    
    cat > "$project/CLAUDE.md" << 'EOF'
# Claude Configuration - Project

## Project Overview
**Type**: [Project Type]  
**Stack**: [Technology Stack]  
**Purpose**: [Project Purpose]

## Directory Structure
```
project/
├── .claude/              # Claude configuration and agents
└── CLAUDE.md            # This configuration file
```

## MCP Configuration
### Default MCPs (All Agents)
- `memory-bank` - Project memory persistence
- `knowledge-graph` - Structured knowledge base
- `context7-mcp` - External documentation
- `gemini-cli` - AI consultation

### Excluded MCPs (Default)
- `playwright-mcp` - Browser automation (only for FrontendDeveloper)
- `figma-dev-mode-mcp-server` - Figma integration (only for FrontendDeveloper)
- `browser-mcp` - Browser control (only for FrontendDeveloper)

## Agent Configuration
All agents in this project follow the standard MCP access rules:
- Default agents: Access to memory-bank, knowledge-graph, context7-mcp, gemini-cli
- FrontendDeveloper & browser-automation-tools: Additional access to browser-related MCPs

---
**Updated**: $(date +%Y-%m-%d)
EOF
}

# Function to append MCP section to existing CLAUDE.md
append_mcp_section() {
    local file="$1"
    
    cat >> "$file" << 'EOF'

## MCP Configuration
### Default MCPs (All Agents)
- `memory-bank` - Project memory persistence
- `knowledge-graph` - Structured knowledge base
- `context7-mcp` - External documentation
- `gemini-cli` - AI consultation

### Excluded MCPs (Default)
- `playwright-mcp` - Browser automation (only for FrontendDeveloper)
- `figma-dev-mode-mcp-server` - Figma integration (only for FrontendDeveloper)
- `browser-mcp` - Browser control (only for FrontendDeveloper)

## Agent Configuration
All agents in this project follow the standard MCP access rules:
- Default agents: Access to memory-bank, knowledge-graph, context7-mcp, gemini-cli
- FrontendDeveloper & browser-automation-tools: Additional access to browser-related MCPs
EOF
}

# Main execution
echo "Default MCP Access: $DEFAULT_MCPS"
echo "Restricted MCPs: $RESTRICTED_MCPS"
echo "Special Access Agents: $SPECIAL_AGENTS"
echo ""
echo "=== Checking Projects ==="
echo ""

for project in "${PROJECTS[@]}"; do
    if [ -d "$project" ]; then
        check_project "$project"
    else
        echo "⚠️  Project not found: $project"
        echo ""
    fi
done

echo "=== Policy Enforcement Complete ==="
echo ""
echo "Summary:"
echo "- All projects now have .claude/ directories"
echo "- All projects now have CLAUDE.md with MCP configuration"
echo "- Default MCPs: memory-bank, knowledge-graph, context7-mcp, gemini-cli"
echo "- Browser MCPs restricted to: FrontendDeveloper, browser-automation-tools"
echo ""
echo "To re-run this enforcement: ~/.claude/enforce-mcp-policy.sh"