# MCP Access Policy Configuration

## Default MCP Access (All Agents)
These MCPs are available to ALL agents by default:

### Enabled by Default
```yaml
default_mcps:
  memory-bank:
    role: project_memory_persistence
    access: full
    
  knowledge-graph:
    role: structured_knowledge_base
    access: full
    
  context7-mcp:
    role: external_documentation
    access: full
    
  gemini-cli:
    role: ai_consultation
    access: full
```

### Excluded by Default
```yaml
restricted_mcps:
  playwright-mcp:
    role: browser_automation
    default_access: none
    exceptions: [FrontendDeveloper, browser-automation-tools]
    
  figma-dev-mode-mcp-server:
    role: figma_integration
    default_access: none
    exceptions: [FrontendDeveloper, browser-automation-tools]
    
  browser-mcp:
    role: browser_control
    default_access: none
    exceptions: [FrontendDeveloper, browser-automation-tools]
```

## Agent-Specific MCP Access

### Standard Agents (Default Access Only)
```yaml
standard_agents:
  - BackendDeveloper
  - PHPMaster
  - laravel-specialist
  - wordpress-expert
  - DatabaseOptimizer
  - SecurityGuard
  - TestingSpecialist
  - PHPCodeQuality
  - DocumentationWriter
  - WorkflowCoordinator
  - debugger
  - git-workflow
  - context-fetcher
  - APIArchitect
  - ContainerSpecialist
  - ServerManager
  - CICDPipeline
  
mcp_access: [memory-bank, knowledge-graph, context7-mcp, gemini-cli]
```

### Special Access Agents
```yaml
extended_access_agents:
  FrontendDeveloper:
    default_mcps: [memory-bank, knowledge-graph, context7-mcp, gemini-cli]
    additional_mcps: [playwright-mcp, figma-dev-mode-mcp-server, browser-mcp]
    reason: "Frontend development requires browser automation and design tools"
    
  browser-automation-tools:
    default_mcps: [memory-bank, knowledge-graph, context7-mcp, gemini-cli]
    additional_mcps: [playwright-mcp, browser-mcp]
    reason: "Browser automation testing requires browser control"
```

## Implementation Rules

### When Creating New Agents
1. All agents receive default MCP access automatically
2. Only FrontendDeveloper and browser-automation-tools get extended access
3. Document any special requirements in agent definition

### When Invoking Agents
```typescript
interface AgentMcpAccess {
  default: string[];  // Always: [memory-bank, knowledge-graph, context7-mcp, gemini-cli]
  restricted: string[];  // Usually empty except for special agents
  
  getAccess(agentType: string): string[] {
    const specialAgents = ['FrontendDeveloper', 'browser-automation-tools'];
    
    if (specialAgents.includes(agentType)) {
      return [...this.default, ...this.getSpecialAccess(agentType)];
    }
    
    return this.default;
  }
}
```

## Directory Documentation Requirements

### Mandatory CLAUDE.md Creation
Whenever a new directory is created in any project:

```markdown
# CLAUDE.md Template for New Directories

## Directory Purpose
[Brief description of what this directory contains]

## Files & Subdirectories
- file1.ext - [purpose]
- file2.ext - [purpose]
- subdir/ - [purpose]

## Context Notes
[Any relevant information for Claude to understand this directory]

## MCP Access
Following standard policy - default MCPs only unless special agent requirements.

---
**Created**: [Date]
```

## Verification Checklist

### Per-Project Requirements
- [ ] `.claude/` directory exists
- [ ] Root `CLAUDE.md` file exists
- [ ] MCP access policy documented
- [ ] All subdirectories have CLAUDE.md files

### Per-Agent Requirements
- [ ] Default MCP access configured
- [ ] Special access documented if applicable
- [ ] No unauthorized MCP access

### Projects to Monitor
1. `~/Sites/gioielleriabonanno.it`
2. `~/Sites/procurato.co.uk`
3. `~/Sites/villastuart.it`
4. `~/Sites/omiworld.org`
5. `~/Documents/Projects/claude-code-config`
6. `~/Documents/Projects/kido`

---
**Policy Version**: 1.0  
**Last Updated**: 2025-08-28  
**Enforcement**: Automatic via agent system