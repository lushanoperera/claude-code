# 🔧 MCP Complete Setup & Documentation

## 📊 Current MCP Configuration Status

All MCP servers are configured and active in your `~/.claude/settings.json`:

| MCP Server | Status | Transport | Primary Role |
|------------|--------|-----------|--------------|
| gemini-mcp | ✅ Active | stdio | Semantic validation & consultation |
| playwright-mcp | ✅ Active | stdio | Browser automation & testing |
| context7-mcp | ✅ Active | SSE | Real-time documentation |
| memory-bank-mcp | ✅ Active | stdio | Project memory persistence |
| knowledge-graph-mcp | ✅ Active | stdio | Structured knowledge base |
| notion-mcp | ✅ Active | stdio | Document collaboration |
| asana-mcp | ✅ Active | stdio | Task & project management |

## 🚀 Installation & Setup Guide

### 1. Gemini MCP (Semantic Validation)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add gemini-mcp -- npx -y gemini-mcp-tool

# Environment Required
export GEMINI_API_KEY="your-api-key"
```

**Available Tools:**
- `ask-gemini` - Alternative AI consultation with changeMode for structured edits
- `brainstorm` - Creative problem solving with domain context
- `fetch-chunk` - Handle large responses in chunks

**Usage Examples:**
```bash
# Validation
"Consult Gemini about this architecture design"

# Brainstorming
"Brainstorm solutions for optimizing database queries"

# Code Review
"Ask Gemini to review this code with changeMode enabled"
```

### 2. Playwright MCP (Browser Automation)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add playwright-mcp npx @playwright/mcp@latest

# Install browsers if needed
npx playwright install
```

**Available Tools:**
- Navigation: `browser_navigate`, `browser_click`, `browser_type`
- Content: `browser_snapshot`, `browser_take_screenshot`, `browser_evaluate`
- Tabs: `browser_tab_list`, `browser_tab_new`, `browser_tab_select`
- Advanced: `browser_file_upload`, `browser_wait_for`, `browser_network_requests`

**Usage Examples:**
```bash
# Testing
"Navigate to localhost:8000 and test the login flow"

# Screenshot
"Take a full-page screenshot of the dashboard"

# Data Extraction
"Extract all product prices from the catalog using browser_snapshot"
```

### 3. Context7 MCP (Real-time Documentation)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add --transport sse context7-mcp https://mcp.context7.com/sse

# No environment variables required
# Uses Server-Sent Events for persistent connection
```

**Available Tools:**
- `resolve-library-id` - Find documentation for any library
- `get-library-docs` - Retrieve specific API documentation

**Usage Examples:**
```bash
# Find documentation
"Resolve library ID for Laravel 11"

# Get specific docs
"Get Laravel documentation for Eloquent ORM"

# Version-specific
"Get React 19 hooks documentation"
```

### 4. Memory Bank MCP (Project Memory)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add --scope user memory-bank \
  -e MEMORY_BANK_ROOT=~/.claude/memory-bank \
  -- npx -y @allpepper/memory-bank-mcp
```

**Available Tools:**
- `memory_bank_read` - Read project memory files
- `memory_bank_write` - Create/update memory files
- `list_projects` - List all projects with memory
- `list_project_files` - List files in a project

**Usage Examples:**
```bash
# Save project context
"Save this architecture decision to memory bank"

# Retrieve context
"Read the Laravel project context from memory bank"

# List memories
"Show all projects in memory bank"
```

### 5. Knowledge Graph MCP (Structured Knowledge)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add --scope user knowledge-graph \
  -e GRAPH_STORAGE_PATH=~/.claude/knowledge-graph \
  -- npx -y mcp-knowledge-graph
```

**Available Tools:**
- `create_entities` - Create knowledge nodes
- `create_relations` - Link entities
- `search_nodes` - Query knowledge base
- `read_graph` - View entire graph

**Usage Examples:**
```bash
# Store knowledge
"Create entity for Laravel authentication patterns"

# Create relationships
"Link Laravel entity to PHP entity"

# Query knowledge
"Search for all security-related knowledge"
```

### 6. Notion MCP (Document Collaboration)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add --scope user notion -- npx -y @notionhq/notion-mcp

# Environment Required
export NOTION_API_KEY="your-api-key"
```

**Available Tools:**
- Create/update/query Notion pages
- Database operations
- Content synchronization

**Usage Examples:**
```bash
# Documentation
"Create a Notion page with the API documentation"

# Project notes
"Update the project status in Notion"
```

### 7. Asana MCP (Task Management)

**Already Configured** ✅

```bash
# Installation (already done)
claude mcp add --scope user asana -- npx -y asana-mcp

# Environment Required
export ASANA_ACCESS_TOKEN="your-token"
```

**Available Tools:**
- Task CRUD operations
- Project management
- Team collaboration
- Goal tracking

**Usage Examples:**
```bash
# Task creation
"Create an Asana task for implementing the auth system"

# Project overview
"List all tasks in the Laravel project"

# Updates
"Mark the database migration task as complete"
```

## 🔄 MCP Orchestration Patterns

### Multi-MCP Workflows

```yaml
planning_validation:
  1. OPUS creates plan
  2. gemini-mcp validates via ask-gemini
  3. context7-mcp provides latest docs
  4. memory-bank saves decisions

implementation_testing:
  1. Agent implements feature
  2. playwright-mcp runs E2E tests
  3. gemini-mcp reviews code quality
  4. asana-mcp updates task status

documentation_sync:
  1. context7-mcp fetches latest API docs
  2. notion-mcp creates documentation
  3. knowledge-graph stores patterns
  4. memory-bank preserves context
```

## 🛠️ Environment Variables Setup

Create `~/.claude/.env`:

```bash
# Gemini MCP
export GEMINI_API_KEY="your-gemini-api-key"

# Notion MCP
export NOTION_API_KEY="your-notion-api-key"

# Asana MCP
export ASANA_ACCESS_TOKEN="your-asana-token"

# Memory paths (already configured)
export MEMORY_BANK_ROOT="~/.claude/memory-bank"
export GRAPH_STORAGE_PATH="~/.claude/knowledge-graph"
```

Load in your shell:
```bash
echo 'source ~/.claude/.env' >> ~/.zshrc  # or ~/.bashrc
source ~/.claude/.env
```

## 🚦 Verification Commands

Test each MCP is working:

```bash
# Gemini
"Ask Gemini to explain async/await"

# Playwright
"Navigate to https://example.com"

# Context7
"Get React documentation"

# Memory Bank
"List all projects in memory bank"

# Knowledge Graph
"Read the entire knowledge graph"

# Notion (requires API key)
"Query Notion databases"

# Asana (requires token)
"List my Asana workspaces"
```

## 📊 MCP Usage Statistics

Monitor MCP usage in your workflows:

```typescript
interface McpUsageTracking {
  gemini: {
    validations: number,
    brainstorms: number,
    consultations: number
  },
  playwright: {
    navigations: number,
    screenshots: number,
    tests_run: number
  },
  context7: {
    docs_fetched: number,
    libraries_resolved: number
  },
  memory: {
    reads: number,
    writes: number,
    projects: number
  }
}
```

## 🔍 Troubleshooting

### Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| MCP not responding | Restart Claude Code |
| Playwright browser not opening | Run `npx playwright install` |
| Gemini timeout | Check API key and rate limits |
| Context7 SSE disconnection | Check network, auto-reconnects |
| Memory Bank path error | Verify MEMORY_BANK_ROOT exists |
| Notion/Asana auth fails | Verify API keys are set |

### Debug Commands

```bash
# Check MCP status
claude mcp list

# View MCP logs
tail -f ~/.claude/logs/mcp.log

# Test specific MCP
claude mcp test [mcp-name]

# Reinstall MCP
claude mcp remove [mcp-name]
claude mcp add [mcp-name] [args]
```

## 🎯 Best Practices

1. **Use MCPs in combination** - Leverage multiple MCPs for comprehensive workflows
2. **Cache responses** - Memory Bank for persistence, Knowledge Graph for relationships
3. **Validate with Gemini** - Always cross-validate critical decisions
4. **Test with Playwright** - Automate testing for all implementations
5. **Document with Context7** - Keep documentation current with latest APIs
6. **Track with Asana** - Maintain project visibility
7. **Collaborate via Notion** - Share documentation and decisions

## 📈 Performance Optimization

```yaml
optimization_tips:
  gemini:
    - Use changeMode for structured responses
    - Batch related questions
    - Cache frequent consultations
  
  playwright:
    - Use headless mode (default)
    - Leverage browser_snapshot over screenshots
    - Reuse browser sessions
  
  context7:
    - SSE maintains persistent connection
    - Cache documentation locally
    - Request specific topics
  
  memory_bank:
    - Organize by project structure
    - Regular cleanup of old memories
    - Use descriptive file names
```

## 🔄 Update & Maintenance

Keep MCPs updated:

```bash
# Update all MCPs
npm update -g @playwright/mcp
npm update -g gemini-mcp-tool
npm update -g @allpepper/memory-bank-mcp
npm update -g mcp-knowledge-graph
npm update -g @notionhq/notion-mcp
npm update -g asana-mcp

# Or reinstall with latest
claude mcp remove [mcp-name]
claude mcp add [mcp-name] [latest-args]
```

---

**Last Updated**: 2025-08-21
**Total MCPs**: 7 Active
**Configuration**: `~/.claude/settings.json`
**Environment**: `~/.claude/.env`