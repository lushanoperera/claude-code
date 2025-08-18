# Claude Code - Global Configuration

## 🤖 Default Model Configuration
**Model**: `claude-opus-4-1-20250805` (Opus Plan) - Set as default for all planning and architecture tasks

## 🔄 Configuration Sync
**Repository**: `~/Sites/claude-code-config`  
**Active**: `~/.claude/`  
**Quick Commands**: `claude-sync-to`, `claude-sync-from`, `claude-commit`, `claude-push`

## Core Stack
**Languages**: PHP 8.3, Laravel 11, TypeScript, React, WordPress, Docker  
**MCP**: Context7 (docs), Playwright (automation), Gemini-CLI (Gemini-2.5-Pro)  
**Specializations**: API, Database, DevOps, Performance, Multi-Model Intelligence

## 🎯 Three-Phase Development Strategy

### Phase 1: Cross-Model Planning (OPUS 4.1 + GEMINI-2.5-PRO)
```typescript
// Multi-model planning with cross-validation
const planningPhase = {
  primary: 'opus-4.1',
  validation: 'gemini-2.5-pro',  // Sempre Gemini-2.5-Pro
  tasks: [
    'architecture_design',
    'task_breakdown', 
    'technology_selection',
    'security_planning',
    'orchestration_strategy',
    'cross_model_validation'
  ],
  workflow: 'opus_plans_gemini_validates'
};
```

### Phase 2: Agent-Led Implementation (SONNET/HAIKU)
```typescript
// Specialized agents with cost-effective models
const implementationStrategy = {
  simple: {
    model: 'haiku-3.5',
    agents: ['auto-selected']
  },
  standard: {
    model: 'sonnet-4',
    agents: ['domain-specialist', 'supporting-agent']
  },
  complex: {
    model: 'sonnet-4',
    agents: ['lead-specialist', 'team-coordination']
  }
};
```

### Phase 3: Cross-Model Validation
```typescript
// Quality assurance through model diversity
const validationPhase = {
  codeReview: 'gemini-2.5-pro',     // Sempre Gemini-2.5-Pro
  securityAudit: 'claude-opus',     // Security focus
  performanceCheck: 'gemini-2.5-pro', // Sempre Gemini-2.5-Pro
  finalApproval: 'opus-4.1'         // Architectural coherence
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
- `multi-agent-coordinator` - Cross-agent orchestration

### Intelligence & Analysis
- `gemini-consultant` - Alternative AI perspective (Gemini-2.5-Pro)
- `prompt-engineer` - Optimization specialist
- `ai-engineer` - Model integration

## Enhanced Workflow Templates

### Feature Development
```yaml
planning:  # OPUS 4.1 + GEMINI-2.5-PRO
  primary: [architect-reviewer, workflow-orchestrator]
  validation: gemini-consultant (model: gemini-2.5-pro)
  tasks: [requirements, design, breakdown, cross_validation]
  
agent_assignment:  # AUTO
  orchestrator: multi-agent-coordinator
  selection: dynamic_based_on_domain
  
implementation:  # SPECIALIZED AGENTS + SONNET
  backend: [laravel-specialist, php-pro]
  frontend: [react-specialist, ui-engineer]
  testing: [qa-expert, test-automator]
  coordination: multi-agent-coordinator
  
validation:  # MULTI-MODEL
  code_review: gemini-consultant (model: gemini-2.5-pro)
  security: [security-engineer, security-auditor]
  architecture: [architect-reviewer]
  performance: [performance-engineer]
```

### Performance Optimization
```yaml
analysis:  # OPUS 4.1 + GEMINI-2.5-PRO
  primary: architect-reviewer
  alternative: gemini-consultant (model: gemini-2.5-pro)
  tasks: [bottleneck_identification, strategy, cross_analysis]
  
agent_coordination:  # AUTO
  orchestrator: performance-monitor
  specialists: [database-optimizer, performance-engineer]
  
execution:  # SPECIALIZED AGENTS
  database: [database-optimizer, sql-pro]
  backend: [php-pro, backend-developer]
  frontend: [ui-engineer, performance-optimizer]
  infrastructure: [devops-engineer, sre-engineer]
  coordination: multi-agent-coordinator
```

## Model Selection Algorithm

```typescript
interface TaskOrchestration {
  planning: ModelStrategy;
  implementation: AgentStrategy;
  validation: CrossModelStrategy;
}

function orchestrateTask(task: TaskAnalysis): TaskOrchestration {
  // Phase 1: Cross-model planning
  const planning = {
    primary: 'opus-4.1',
    consultant: 'gemini-2.5-pro',  // Sempre Gemini-2.5-Pro
    workflow: 'plan_validate_refine'
  };
  
  // Phase 2: Agent-led implementation
  const implementation = {
    orchestrator: 'multi-agent-coordinator',
    agents: selectSpecializedAgents(task),
    model: selectImplementationModel(task.complexity)
  };
  
  // Phase 3: Multi-model validation
  const validation = {
    code_review: 'gemini-2.5-pro',     // Sempre Gemini-2.5-Pro
    security_audit: 'opus-4.1',
    performance_check: 'gemini-2.5-pro' // Sempre Gemini-2.5-Pro
  };
  
  return { planning, implementation, validation };
}

function selectSpecializedAgents(task: TaskAnalysis): string[] {
  const agents = [];
  
  // Domain-specific agent selection
  if (task.domain.includes('backend')) {
    agents.push(task.stack.includes('laravel') ? 'laravel-specialist' : 'backend-developer');
  }
  if (task.domain.includes('frontend')) {
    agents.push(task.stack.includes('react') ? 'react-specialist' : 'ui-engineer');
  }
  if (task.domain.includes('database')) {
    agents.push('database-specialist', 'sql-pro');
  }
  if (task.domain.includes('security')) {
    agents.push('security-engineer', 'penetration-tester');
  }
  
  return agents;
}
```

## Enhanced Auto-Orchestration Rules

```typescript
const orchestrationRules = {
  fullStackFeature: {
    trigger: /implement.*feature|create.*system/i,
    planning: { model: 'opus-4.1', consultant: 'gemini-2.5-pro' },
    orchestrator: 'multi-agent-coordinator',
    agents: {
      primary: 'fullstack-developer',
      supporting: ['laravel-specialist', 'ui-engineer', 'qa-expert']
    },
    implementation: 'sonnet-4',
    validation: 'gemini-2.5-pro'
  },
  
  performanceOptimization: {
    trigger: /optimize|slow|performance/i,
    planning: { model: 'opus-4.1', consultant: 'gemini-2.5-pro' },
    orchestrator: 'performance-monitor',
    agents: {
      primary: 'performance-engineer',
      supporting: ['database-optimizer', 'php-pro', 'sre-engineer']
    },
    implementation: 'sonnet-4',
    validation: 'gemini-2.5-pro'
  },
  
  deployment: {
    trigger: /deploy|docker|kubernetes/i,
    planning: { model: 'opus-4.1', consultant: 'gemini-2.5-pro' },
    orchestrator: 'deployment-engineer',
    agents: {
      primary: 'docker-specialist',
      supporting: ['devops-engineer', 'kubernetes-specialist']
    },
    implementation: 'sonnet-4',
    validation: 'gemini-2.5-pro'
  },
  
  security: {
    trigger: /security|vulnerability|audit/i,
    planning: { model: 'opus-4.1', consultant: 'gemini-2.5-pro' },
    orchestrator: 'security-auditor',
    agents: {
      primary: 'security-engineer',
      supporting: ['penetration-tester', 'compliance-auditor']
    },
    implementation: 'sonnet-4',
    validation: 'opus-4.1'  // Security requires highest validation
  },
  
  aiIntegration: {
    trigger: /ai|ml|llm|model|prompt/i,
    planning: { model: 'opus-4.1', consultant: 'gemini-2.5-pro' },
    orchestrator: 'ai-engineer',
    agents: {
      primary: 'llm-architect',
      supporting: ['prompt-engineer', 'ml-engineer']
    },
    implementation: 'sonnet-4',
    validation: 'gemini-2.5-pro'
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

## Enhanced Quick Commands

### Multi-Model Operations
- `/plan [task]` - Cross-model planning (OPUS + GEMINI-2.5-PRO)
- `/validate [code]` - Multi-model validation (GEMINI-2.5-PRO)
- `/consult gemini [question]` - Direct Gemini-2.5-Pro consultation
- `/compare models [task]` - Model perspective comparison

### Agent Orchestration
- `/agent laravel` - Laravel specialist
- `/agent fullstack` - Full stack developer
- `/orchestrate [domain]` - Domain-specific coordination
- `/swarm [complex_task]` - Multi-agent swarm

### Workflow Templates
- `/template feature` - Full feature development
- `/template optimize` - Performance optimization
- `/template security` - Security audit
- `/template ai` - AI integration workflow

### Advanced Intelligence
- `/analyze deep` - Multi-model analysis (GEMINI-2.5-PRO)
- `/review architecture` - Cross-validated review
- `/brainstorm [topic]` - Creative ideation (GEMINI-2.5-PRO)
- `/context persist` - Save session context

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

## 🧠 Multi-Model Intelligence Integration

### Enhanced Hook System
```typescript
interface EnhancedHooks {
  preTask: {
    taskAnalysis: true,
    crossModelConsultation: true,  // Gemini-2.5-Pro
    agentSelection: true,
    contextLoading: true
  },
  duringExecution: {
    agentCoordination: true,
    progressTracking: true,
    qualityGates: true
  },
  postEdit: {
    crossModelValidation: true,     // Gemini-2.5-Pro
    codeFormatting: true,
    syntaxValidation: true,
    testExecution: true,
    securityScan: true
  },
  session: {
    autoSave: true,
    memoryPersistence: true,
    learningCapture: true
  }
}
```

### Gemini Integration
```typescript
interface GeminiIntegration {
  defaultModel: 'gemini-2.5-pro',  // Modello predefinito
  consultation: {
    planning_validation: true,
    alternative_perspectives: true,
    creative_brainstorming: true,
    code_review: true
  },
  workflows: {
    plan_validate: 'opus_plans_gemini_validates',
    review_cross: 'gemini_reviews_claude_code',
    brainstorm: 'multi_model_ideation'
  }
}
```

### Enhanced Swarm Intelligence
```yaml
queen:
  model: opus-4.1
  role: master_coordinator
  capabilities: [decomposition, spawning, allocation, cross_model_validation]
  consultant: gemini-2.5-pro  # Modello fisso

workers:
  spawning: dynamic
  coordination: multi-agent-coordinator
  specializations: [architect, coder, tester, reviewer, security, performance]
  models: [sonnet-4, haiku-3.5]
  
intelligence_network:
  cross_validation: gemini-2.5-pro
  perspective_diversity: true
  adaptive_learning: true
  
fault_tolerance:
  failover: true
  checkpoints: true
  self_healing: true
  model_redundancy: true
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

## Enhanced Key Principles

1. **Cross-Model Planning**: OPUS 4.1 + GEMINI-2.5-PRO for comprehensive analysis
2. **Agent-Led Implementation**: Specialized agents with optimal models
3. **Multi-Model Validation**: GEMINI-2.5-PRO for quality assurance
4. **Intelligent Orchestration**: Dynamic agent selection and coordination
5. **Context Persistence**: Cross-session memory with learning capture
6. **Continuous Evolution**: Pattern recognition and workflow optimization
7. **Security by Design**: Multi-layered security validation
8. **Performance Excellence**: Speed + quality through specialization
9. **Creative Intelligence**: Leverage GEMINI-2.5-PRO for innovation
10. **Adaptive Learning**: System improves through experience

## Enhanced Workflow Examples

### Cross-Model Planning
```
User: "How should I architect a microservices system?"
→ Phase 1 - Planning:
   Primary: OPUS 4.1 [architect-reviewer]
   Validation: GEMINI-2.5-PRO [gemini-consultant]
   Output: Cross-validated architecture plan
→ Phase 2 - Agent Assignment:
   Orchestrator: [multi-agent-coordinator]
   Agents: [kubernetes-specialist, api-designer, security-engineer]
→ Phase 3 - Implementation:
   Models: SONNET 4 (complex), HAIKU 3.5 (simple)
   Coordination: Real-time agent collaboration
```

### Agent-Led Implementation
```
User: "Implement JWT authentication with rate limiting"
→ Agent Selection: [laravel-specialist, security-engineer]
→ Model: SONNET 4
→ Orchestrator: [multi-agent-coordinator]
→ Validation: GEMINI-2.5-PRO (code review)
→ Security Check: OPUS 4.1 (final approval)
```

### Multi-Model Analysis
```
User: "Optimize our database performance"
→ Analysis Phase:
   OPUS 4.1: Strategic bottleneck identification
   GEMINI-2.5-PRO: Alternative optimization approaches
→ Implementation:
   Agents: [database-optimizer, sql-pro, performance-engineer]
   Model: SONNET 4
→ Validation:
   GEMINI-2.5-PRO: Performance benchmarking
   OPUS 4.1: Architecture impact assessment
```

---

---

## 🤖 Gemini-2.5-Pro Consultation Protocol

### When to Consult Gemini-2.5-Pro
```typescript
const geminiConsultationTriggers = {
  planning_validation: 'Always after OPUS planning',
  alternative_perspective: 'When stuck or need creativity', 
  code_review: 'Before final implementation',
  brainstorming: 'For innovative solutions',
  performance_analysis: 'Speed-focused optimizations',
  cross_validation: 'Quality assurance gates'
};
```

### Gemini Integration Workflows
```yaml
plan_validate:
  1. OPUS creates initial plan
  2. GEMINI-2.5-PRO validates and suggests improvements
  3. OPUS refines based on feedback
  4. Proceed to agent implementation

code_review:
  1. Agents implement features
  2. GEMINI-2.5-PRO reviews for optimization
  3. OPUS validates architecture coherence
  4. Final approval and deployment

brainstorm:
  1. GEMINI-2.5-PRO generates creative alternatives
  2. OPUS evaluates feasibility
  3. Combined approach selection
  4. Agent-led implementation
```

### Gemini MCP Tools Integration
```typescript
const geminiMCPConfig = {
  'ask-gemini': {
    model: 'gemini-2.5-pro',  // Modello fisso
    changeMode: true,          // Get structured edits
    sandbox: false             // Production ready
  },
  'brainstorm': {
    model: 'gemini-2.5-pro',  // Modello fisso
    methodology: 'auto',
    domain: 'context-aware',
    includeAnalysis: true
  },
  'fetch-chunk': {
    // Handle large responses from Gemini-2.5-Pro
    streaming: true
  }
};
```

---

**Version**: 4.0 Multi-Model | **Updated**: 2025-08-18  
**Features**: Cross-Model Intelligence, Enhanced Agent Orchestration, Gemini-2.5-Pro Integration  
**Capabilities**: OPUS + GEMINI Planning, Specialized Agent Implementation, Multi-Model Validation