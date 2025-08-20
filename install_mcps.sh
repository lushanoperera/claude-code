#!/bin/bash

# Claude Code - MCP Installation Script
# Installa gli MCP per il multi-layered memory system

echo "🚀 Installing Claude Code MCP servers..."

# Memory Bank MCP - Project-specific memory
echo "📝 Installing memory-bank-mcp..."
claude mcp add --scope user memory-bank -e MEMORY_BANK_ROOT=~/.claude/memory-bank -- npx -y @allpepper/memory-bank-mcp

# Knowledge Graph MCP - Structured knowledge base  
echo "🧠 Installing knowledge-graph-mcp..."
claude mcp add --scope user knowledge-graph -e GRAPH_STORAGE_PATH=~/.claude/knowledge-graph -- npx -y mcp-knowledge-graph

# Notion MCP (se non già presente)
echo "📄 Installing notion-mcp..."
claude mcp add --scope user notion -- npx -y @notionhq/notion-mcp

# Asana MCP (se non già presente) 
echo "📋 Installing asana-mcp..."
claude mcp add --scope user asana -- npx -y asana-mcp

echo "✅ Tutti gli MCP sono stati installati!"
echo "🔄 Riavvia Claude Code per applicare le modifiche."
echo ""
echo "📖 Leggi env_setup_instructions.md per configurare le API key."