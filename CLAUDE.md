# Claude Code - Global Configuration

## 🤖 Default Model Configuration
**Model**: `claude-opus-4-1-20250805` (Opus Plan) - Set as default for all planning and architecture tasks

## 🔄 Configuration Sync
**Repository**: `~/Sites/claude-code-config`  
**Active**: `~/.claude/`  
**Quick Commands**: `claude-sync-to`, `claude-sync-from`, `claude-commit`, `claude-push`

## Core Stack
**Languages**: PHP 8.3, Laravel 11, TypeScript, React, WordPress, Docker  
**MCP**: Context7 (docs), Playwright (automation)  
**Specializations**: API, Database, DevOps, Performance

## 🎯 Two-Phase Development Strategy

### Phase 1: Planning (OPUS 4.1)
```typescript
// Always use Opus 4.1 for planning tasks
const planningTasks = [
  'architecture_design',
  'task_breakdown', 
  'technology_selection',
  'security_planning',
  'orchestration_strategy'
];
```

### Phase 2: Implementation (SONNET/HAIKU)
```typescript
// Use cost-effective models for coding
const implementationStrategy = {
  simple: 'haiku-3.5',      // CRUD, basic features
  standard: 'sonnet-4',      // APIs, integrations
  complex: 'sonnet-4'        // Multi-agent coordination
};
```

## Agent Matrix

### Backend Specialists
- `laravel-specialist` - Laravel 11 expertise
- `php-pro` - Modern PHP 8.3
- `backend-typescript-architect` - Bun/TypeScript
- `python-backend-engineer` - Python/uv

### Frontend Specialists  
- `ui-engineer` - UI/UX implementation
- `react-specialist` - React 18+
- `nextjs-developer` - Next.js 15+
- `vue-expert` - Vue 3 Composition

### Infrastructure
- `docker-specialist` - Containerization
- `kubernetes-specialist` - K8s orchestration
- `terraform-engineer` - Infrastructure as Code
- `devops-engineer` - CI/CD pipelines

### Security & Quality
- `security-engineer` - DevSecOps
- `penetration-tester` - Security testing
- `qa-expert` - Quality assurance
- `test-automator` - Test automation

### Architecture & Review
- `architect-reviewer` - System design (OPUS 4.1)
- `senior-code-reviewer` - Code review (OPUS 4.1)
- `workflow-orchestrator` - Task coordination

## Workflow Templates

### Feature Development
```yaml
planning:  # OPUS 4.1
  agents: [architect-reviewer, workflow-orchestrator]
  tasks: [requirements, design, breakdown]
  
implementation:  # SONNET
  backend: [laravel-specialist, php-pro]
  frontend: [react-specialist, ui-engineer]
  testing: [qa-expert, test-automator]
  
review:  # OPUS 4.1 (if architectural)
  agents: [senior-code-reviewer, security-auditor]
```

### Performance Optimization
```yaml
analysis:  # OPUS 4.1
  agent: architect-reviewer
  tasks: [bottleneck_identification, strategy]
  
execution:  # SONNET/HAIKU
  database: database-optimizer
  backend: php-pro
  frontend: ui-engineer
  infrastructure: devops-engineer
```

## Model Selection Algorithm

```typescript
function selectModel(task: TaskAnalysis): string {
  // Planning always uses Opus 4.1
  if (task.phase === 'planning' || 
      task.phase === 'architecture' ||
      (task.phase === 'review' && task.architecturalImpact)) {
    return 'opus-4.1';
  }
  
  // Implementation uses cost-effective models
  if (task.phase === 'implementation') {
    const score = calculateComplexity(task);
    if (score >= 6 || task.multiAgent) return 'sonnet-4';
    if (score <= 3) return 'haiku-3.5';
    return 'sonnet-4';
  }
  
  return 'sonnet-4'; // Default
}
```

## Auto-Orchestration Rules

```typescript
const orchestrationRules = {
  fullStackFeature: {
    trigger: /implement.*feature|create.*system/i,
    primary: 'fullstack-developer',
    supporting: ['laravel-specialist', 'ui-engineer'],
    model: 'sonnet'
  },
  
  performanceOptimization: {
    trigger: /optimize|slow|performance/i,
    primary: 'performance-engineer',
    supporting: ['database-specialist', 'php-pro'],
    model: 'sonnet'
  },
  
  deployment: {
    trigger: /deploy|docker|kubernetes/i,
    primary: 'docker-specialist',
    supporting: ['devops-engineer'],
    model: 'sonnet'
  },
  
  security: {
    trigger: /security|vulnerability|audit/i,
    primary: 'security-engineer',
    supporting: ['security-auditor'],
    model: 'sonnet'
  }
};
```

## Stack Configurations

### Laravel Stack
```yaml
agents: [laravel-specialist, php-pro]
version: Laravel 11, PHP 8.3+
features: [pest, octane, horizon, sanctum, livewire]
tools: [artisan, composer, phpstan]
```

### TypeScript Stack
```yaml
agents: [backend-typescript-architect, nextjs-developer]
runtime: Bun
frontend: Next.js 15, React 19
features: [server_components, edge_functions, type_safety]
```

### WordPress Stack
```yaml
agents: [wordpress-expert, php-pro]
version: WordPress 6.4+
builders: [bricks, elementor, divi]
features: [gutenberg, headless, graphql]
```

## Quick Commands

### Agents
- `/agent laravel` - Laravel specialist
- `/agent fullstack` - Full stack developer
- `/orchestrate complex` - Multi-agent coordination

### Templates
- `/template feature` - Feature development
- `/template optimize` - Performance optimization
- `/template security` - Security audit

### Advanced
- `/analyze deep` - AI analysis (OPUS 4.1)
- `/review architecture` - Architecture review (OPUS 4.1)
- `/context persist` - Save session context
- `/workflow optimize` - Optimize workflow

## Context Protocol

```json
{
  "developer": {
    "stack": ["PHP", "Laravel", "TypeScript", "React"],
    "level": "senior",
    "preferences": {
      "php": "8.3",
      "laravel": "11",
      "testing": "pest",
      "frontend": "react"
    }
  },
  "project": {
    "database": "mysql_8",
    "cache": "redis",
    "queue": "redis",
    "deployment": "docker"
  }
}
```

## 🧠 Claude Flow Integration

### Hook System
```typescript
interface Hooks {
  preTask: {
    taskAnalysis: true,
    agentAssignment: true,
    contextLoading: true
  },
  postEdit: {
    codeFormatting: true,
    syntaxValidation: true,
    testExecution: true
  },
  session: {
    autoSave: true,
    memoryPersistence: true
  }
}
```

### Swarm Intelligence
```yaml
queen:
  model: opus-4.1
  role: master_coordinator
  capabilities: [decomposition, spawning, allocation]

workers:
  spawning: dynamic
  coordination: queen-led
  specializations: [architect, coder, tester, reviewer]
  
fault_tolerance:
  failover: true
  checkpoints: true
  self_healing: true
```

### Memory System
```yaml
database: SQLite
persistence: cross-session
features:
  - Pattern recognition
  - Success tracking
  - Context preservation
  - Project namespacing
```

## Key Principles

1. **Planning First**: Use OPUS 4.1 for all planning and architecture
2. **Cost-Effective Implementation**: Use SONNET/HAIKU for coding
3. **Multi-Agent Coordination**: Parallel execution when possible
4. **Context Persistence**: Maintain project context across sessions
5. **Continuous Learning**: Track patterns and optimize workflows
6. **Security First**: Always consider security implications
7. **Performance Focus**: Optimize for speed and efficiency

## Examples

### Planning Request (OPUS 4.1)
```
User: "How should I architect a microservices system?"
→ Model: OPUS 4.1
→ Agents: [architect-reviewer, workflow-orchestrator]
→ Phase: planning
```

### Implementation Request (SONNET)
```
User: "Implement JWT authentication"
→ Model: SONNET
→ Agents: [laravel-specialist, security-engineer]
→ Phase: implementation
```

### Review Request (OPUS 4.1)
```
User: "Review our API architecture"
→ Model: OPUS 4.1
→ Agents: [architect-reviewer, senior-code-reviewer]
→ Phase: review
```

---

**Version**: 3.2 Compact | **Updated**: 2025-08-13  
**Features**: Two-Phase Development, Intelligent Orchestration, Claude Flow Integration  
**Size**: Optimized under 40k characters