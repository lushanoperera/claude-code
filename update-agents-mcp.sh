#!/bin/bash

# MCP tools to add to all agents
MCP_TOOLS="mcp__gemini-cli__ask-gemini, mcp__gemini-cli__brainstorm, mcp__gemini-cli__fetch-chunk, mcp__playwright-mcp__browser_navigate, mcp__playwright-mcp__browser_click, mcp__playwright-mcp__browser_snapshot, mcp__playwright-mcp__browser_take_screenshot, mcp__playwright-mcp__browser_evaluate, mcp__context7-mcp__resolve-library-id, mcp__context7-mcp__get-library-docs, mcp__memory-bank__memory_bank_read, mcp__memory-bank__memory_bank_write, mcp__memory-bank__list_projects, mcp__knowledge-graph__create_entities, mcp__knowledge-graph__search_nodes, mcp__knowledge-graph__read_graph, mcp__asana__asana_create_task, mcp__asana__asana_update_task, mcp__asana__asana_typeahead_search"

# List of new agent files to update
AGENTS=(
    "PHPMaster.md"
    "APIArchitect.md"
    "DatabaseOptimizer.md"
    "ContainerSpecialist.md"
    "ServerManager.md"
    "CICDPipeline.md"
    "PHPCodeQuality.md"
    "TestingSpecialist.md"
    "SecurityGuard.md"
    "WorkflowCoordinator.md"
    "DocumentationWriter.md"
)

echo "Updating agents with MCP tools..."

for agent in "${AGENTS[@]}"; do
    file="$HOME/.claude/agents/$agent"
    if [ -f "$file" ]; then
        echo "Updating $agent..."
        # Check if agent already has MCP tools
        if ! grep -q "mcp__gemini-cli" "$file"; then
            # Add MCP tools to the tools line
            sed -i.bak "s/^tools: \(.*\)$/tools: \1, $MCP_TOOLS/" "$file"
            echo "✓ Updated $agent with MCP tools"
        else
            echo "→ $agent already has MCP tools"
        fi
    else
        echo "✗ $agent not found"
    fi
done

echo "Done! Cleaning up backup files..."
rm -f ~/.claude/agents/*.bak

echo "MCP tools update complete!"