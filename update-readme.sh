#!/bin/bash

# Script per aggiornare README con acknowledgments

echo "Updating README with proper acknowledgments..."

cd ~/Sites/claude-code-config

# Crea backup
cp README.md README.md.backup

# Sostituisci la sezione acknowledgments
sed -i.bak '/## 🙏 Acknowledgments/,/## 📞 Support/ {
/## 🙏 Acknowledgments/r /dev/stdin
/## 📞 Support/!d
}' README.md << 'EOF'

This configuration builds upon excellent work from the open-source community:

### 🤖 Agent Sources & Inspirations
- **[Agent OS](https://github.com/buildermethods/agent-os)** - Core orchestration patterns and multi-agent coordination
- **[Awesome Claude Code Agents](https://github.com/hesreallyhim/awesome-claude-code-agents)** - Curated agent collection and specializations  
- **[Agents Repository](https://github.com/wshobson/agents)** - Agent definitions and development patterns

### 🛠️ Platform & Integration
- **[Anthropic](https://anthropic.com)** - Claude and Claude Code platform
- **[Context7](https://context7.com)** - MCP integration for real-time documentation
- **[MCP Protocol](https://modelcontextprotocol.io)** - Model Context Protocol specifications

### 💡 Our Contributions
Building on these foundations, we've added:
- Intelligent agent orchestration with automatic model selection
- Bidirectional sync between Claude config and Git repository
- Advanced Context7 MCP integration with caching
- Comprehensive workflow templates and automation
- Developer experience enhancements with quick setup

See [CREDITS.md](CREDITS.md) for detailed attributions and licensing information.

EOF

echo "✅ README updated with acknowledgments"

# Copia anche il CREDITS.md
cp ~/.claude/CREDITS.md ./CREDITS.md

echo "✅ CREDITS.md added to repository"