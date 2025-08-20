# Claude Code - Global Configuration v4.2
**Version**: 4.2 Optimized | **Updated**: 2025-08-20  
**Model**: `claude-opus-4-1-20250805` (Default)

## 🎯 Core Strategy: Three-Phase Development
1. **Planning**: OPUS 4.1 + GEMINI-2.5-PRO cross-validation
2. **Implementation**: Domain-specific agents with SONNET/HAIKU
3. **Validation**: Multi-model review with GEMINI-2.5-PRO

## 📋 Session Management

### Initialization Checklist
```yaml
startup_sequence:
  1_check_todos: "./TODO.md, ../TODO.md, ~/TODO.md"
  2_load_agents: "~/.claude/agents/*.md (94+ agents)"
  3_validate_mcp: ["gemini-mcp", "playwright-mcp", "context7-mcp", "memory-bank", "knowledge-graph"]
  4_scan_temp: ["temp_*", "debug_*", "*.tmp", "*.bak"]
  5_restore_context: "previous session state"

todo_system:
  auto_creation: true
  location: "project_root/TODO.md"
  format: "# TODO - [Project] - [Date]"
  sections: [goals, in_progress, completed, temp_files, agents_used, cleanup_status]
  persistence: cross_session
```

## 🤖 Agent Registry

### Domain Mapping
```yaml
backend: [laravel-specialist, php-pro, backend-typescript-architect, python-backend-engineer]
frontend: [ui-engineer, react-specialist, nextjs-developer, vue-expert]
database: [database-specialist, postgres-pro, sql-pro, database-optimizer]
security: [security-engineer, penetration-tester, security-auditor, compliance-auditor]
devops: [docker-specialist, kubernetes-specialist, terraform-engineer, platform-engineer]
ai_ml: [ai-engineer, ml-engineer, llm-architect, prompt-engineer]
testing: [qa-expert, test-automator, test-runner]
architecture: [architect-reviewer, senior-code-reviewer, microservices-architect]
orchestration: [multi-agent-coordinator, workflow-orchestrator, agent-organizer]
```

### Agent Selection Algorithm
```typescript
function selectAgents(task: TaskAnalysis): AgentStrategy {
  const complexity = assessComplexity(task); // 1-10 scale
  const domain = extractDomain(task);
  
  return {
    orchestrator: 'multi-agent-coordinator',
    primary: domainMapping[domain][0],
    supporting: domainMapping[domain].slice(1, complexity > 5 ? 3 : 2),
    model: complexity > 7 ? 'sonnet-4' : 'haiku-3.5'
  };
}
```

## 🔧 MCP Integration

### Available MCPs
```yaml
gemini-mcp:
  transport: stdio
  model: gemini-2.5-pro
  capabilities: [ask-gemini, brainstorm, fetch-chunk]
  
playwright-mcp:
  transport: stdio
  capabilities: [browser_navigate, browser_click, browser_snapshot, browser_evaluate]
  
context7-mcp:
  transport: sse
  endpoint: https://mcp.context7.com/sse
  capabilities: [resolve-library-id, get-library-docs]
  
memory-bank-mcp:
  transport: stdio
  storage: ~/.claude/memory-bank
  capabilities: [project-context, persistence]
  
knowledge-graph-mcp:
  transport: stdio
  storage: ~/.claude/knowledge-graph
  capabilities: [relationships, preferences, workflows]
```

## 🗑️ File Management

### Cleanup Rules
```yaml
auto_cleanup:
  debug_files: ["debug_*.log", "temp_*.txt", "test_output_*"] # Always cleanup
  temp_configs: ["*.bak", "*.tmp"] # Cleanup on success
  test_artifacts: ["coverage_*", "test_results_*"] # Cleanup after validation
  
preserve:
  documentation: ["*.md", "README*", "CHANGELOG*"]
  configurations: ["*.json", "*.yaml", "*.toml"]
  source_code: ["*.php", "*.js", "*.ts", "*.py"]
  deliverables: ["final_*", "production_*", "release_*"]
```

## 🚀 Workflow Templates

### Standard Feature Development
```yaml
planning:
  models: [opus-4.1, gemini-2.5-pro]
  output: cross_validated_plan
  
implementation:
  orchestrator: multi-agent-coordinator
  agents: auto_selected_by_domain
  model: based_on_complexity
  
validation:
  code_review: gemini-2.5-pro
  security: opus-4.1
  performance: gemini-2.5-pro
```

## 🔧 Quick Commands
- `/session init` - Initialize with TODO check
- `/plan [task]` - Cross-model planning
- `/agents auto` - Automatic agent selection
- `/cleanup auto` - Auto-cleanup temp files
- `/mcp list` - Show available MCPs

## 📊 Model Selection Matrix
| Task Complexity | Planning | Implementation | Validation |
|----------------|----------|----------------|------------|
| Simple (1-3) | OPUS 4.1 | HAIKU 3.5 | GEMINI-2.5-PRO |
| Standard (4-7) | OPUS + GEMINI | SONNET 4 | GEMINI-2.5-PRO |
| Complex (8-10) | OPUS + GEMINI | SONNET 4 + Agents | OPUS + GEMINI |

## 🎯 Key Principles
1. **Session-Aware**: Always check TODO.md at start
2. **Agent Intelligence**: Auto-select from 94+ specialized agents
3. **MCP Integration**: Leverage all available tools
4. **Clean Repository**: Track and cleanup temp files
5. **Cross-Model Validation**: Only for critical tasks
6. **Performance Focus**: Right model for right task

## 💾 Configuration Files
- `~/.claude/settings.json` - Main configuration
- `~/.claude/settings.local.json` - Local overrides
- `~/.claude/agents/` - Agent definitions
- `~/.claude/memory-bank/` - Project memory
- `~/.claude/knowledge-graph/` - Knowledge base

---
**Stack**: PHP 8.3, Laravel 11, TypeScript, React, Docker  
**Specializations**: Full-stack, DevOps, AI Integration, Performance