# Claude Code - Global Configuration

## 🤖 Default Model Configuration
**Model**: `claude-opus-4-1-20250805` (Opus Plan) - Set as default for all planning and architecture tasks

### Cross-Model Communication Language
**Important**: When communicating with Gemini or other AI models for improved collaboration and accuracy, English can be used directly without asking for permission. This optimizes model-to-model communication and reduces potential translation errors.

### Language Optimization for Token Efficiency
**User Preference**: Responses to the user can be provided directly in English without translation to Italian. This optimizes token usage and improves response speed. The user understands both languages fluently.

## 📋 Session Management & TODO System

### Automatic Session Initialization
```typescript
interface SessionInit {
  checkTodos: boolean;           // Always check TODO.md at session start
  loadAgentRegistry: boolean;    // Load all agents from ~/.claude/agents
  validateMcpTools: boolean;     // Verify MCP tools availability
  cleanupTempFiles: boolean;     // Check for temp files to cleanup
  contextRestore: boolean;       // Restore previous session context
}

const sessionStartup = {
  1: "Check for existing TODO.md",
  2: "Load agent capabilities from ~/.claude/agents",
  3: "Validate MCP tools in settings.json",
  4: "Clean up temporary files from previous sessions",
  5: "Restore context and continue previous workflows"
};
```

### TODO.md Management
```yaml
automatic_creation: true
location: project_root/TODO.md
triggers:
  - session_start
  - task_planning_complete
  - agent_assignment
  - workflow_completion
  
format:
  header: "# TODO - [Project Name] - [Date]"
  sections:
    - "## 🎯 Current Session Goals"
    - "## 📝 Tasks in Progress" 
    - "## ✅ Completed Tasks"
    - "## 🗑️ Temporary Files Created"
    - "## 🤖 Agents Utilized"
    - "## 🔧 Tools Used"
    
persistence: cross_session
cleanup_tracking: automatic
```

### Temporary File Management
```typescript
interface TempFileTracking {
  created: string[];           // Files created during session
  purpose: string[];          // Why each file was created
  cleanup: boolean[];         // Should be cleaned up
  keepOnSuccess: boolean[];   // Keep if task succeeds
  location: string;          // TODO.md section for tracking
}

const tempFileProtocol = {
  creation: "Log immediately in TODO.md",
  annotation: "Include purpose and cleanup status",
  tracking: "Update status during task progression", 
  cleanup: "Auto-remove when task complete or failed",
  preservation: "Keep only essential artifacts"
};
```

## 🔄 Configuration Sync & Git Worktrees

### ⚠️ MANDATORY GIT WORKTREES USAGE
**IMPORTANT**: ALWAYS use Git worktrees for ANY Git repository. NEVER work directly on the main branch.

**Repository**: `/Users/disconnesso/Documents/Projects/claude-code-config`  
**Active**: `~/.claude/`  
**Quick Commands**: `claude-sync-to`, `claude-sync-from`, `claude-commit`, `claude-push`

### Git Worktrees Protocol (REQUIRED FOR ALL PROJECTS)
```typescript
// ALWAYS use worktrees for parallel development
const worktreeProtocol = {
  mandatory: true,  // MUST use worktrees for any Git repo
  
  // Standard worktree setup for ANY project
  setupCommands: {
    feature: 'git worktree add ../[project]-feature feature-branch',
    bugfix: 'git worktree add ../[project]-bugfix bugfix-branch',
    experiment: 'git worktree add ../[project]-exp experimental',
    review: 'git worktree add ../[project]-review main'
  },
  
  // Example for claude-code-config
  mainRepo: '/Users/disconnesso/Documents/Projects/claude-code-config',
  worktrees: {
    'feature': '/Users/disconnesso/Documents/Projects/claude-code-config-feature',    // Feature development
    'hotfix': '/Users/disconnesso/Documents/Projects/claude-code-config-hotfix',      // Emergency fixes
    'experiment': '/Users/disconnesso/Documents/Projects/claude-code-config-exp',     // Testing new ideas
    'review': '/Users/disconnesso/Documents/Projects/claude-code-config-review'       // Code review workspace
  },
  
  claudeSessions: {
    architecture: { path: 'main', models: ['opus-4.1', 'gemini-2.5-pro'] },
    implementation: { path: 'feature', models: ['sonnet-4'], agents: ['specialized'] },
    validation: { path: 'review', models: ['gemini-2.5-pro'], focus: 'quality' },
    hotfix: { path: 'hotfix', models: ['haiku-3.5'], focus: 'speed' }
  },
  
  benefits: [
    'Parallel development without branch switching',
    'Isolated testing environments',
    'Multiple Claude sessions on same project',
    'No merge conflicts from context switching',
    'Faster iteration and validation'
  ]
};
```

### Worktree Commands
```bash
# Setup worktrees
git worktree add /Users/disconnesso/Documents/Projects/claude-code-config-feature feature-branch
git worktree add /Users/disconnesso/Documents/Projects/claude-code-config-review main
git worktree add /Users/disconnesso/Documents/Projects/claude-code-config-exp experimental

# Launch parallel Claude sessions
cd /Users/disconnesso/Documents/Projects/claude-code-config-feature && claude-code    # Implementation
cd /Users/disconnesso/Documents/Projects/claude-code-config-review && claude-code     # Review
cd /Users/disconnesso/Documents/Projects/claude-code-config && claude-code            # Architecture

# Cleanup when done
git worktree remove /Users/disconnesso/Documents/Projects/claude-code-config-feature
```

## Core Stack
**Languages**: PHP 8.3, Laravel 11, TypeScript, React, WordPress, Docker  
**MCP**: Gemini-MCP (semantic validator), Playwright-MCP (automation), Context7-MCP (SSE docs)  
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

## 🤖 Intelligent Agent System

### Automatic Agent Evaluation & Selection
```typescript
interface AgentEvaluator {
  taskAnalysis: (request: string) => AgentCapability[];
  domainMapping: Map<string, string[]>;
  complexityScoring: (task: Task) => number;
  agentSelection: (candidates: Agent[], context: Context) => Agent[];
  orchestration: (agents: Agent[], task: Task) => WorkflowPlan;
}

const agentSelectionMatrix = {
  // Domain-based automatic selection (Refactored 2025-08-21)
  backend: ['BackendDeveloper', 'PHPMaster', 'laravel-specialist'],
  frontend: ['FrontendDeveloper'], // Covers React, Vue, Angular, Next.js
  database: ['DatabaseOptimizer'],
  security: ['SecurityGuard'],
  devops: ['ContainerSpecialist', 'ServerManager', 'CICDPipeline'],
  api: ['APIArchitect'],
  testing: ['TestingSpecialist'],
  quality: ['PHPCodeQuality'],
  wordpress: ['wordpress-expert'],
  documentation: ['DocumentationWriter'],
  orchestration: ['WorkflowCoordinator'],
  utilities: ['debugger', 'git-workflow', 'browser-automation-tools', 'context-fetcher']
};
```

### Dynamic Agent Registry (Auto-loaded from ~/.claude/agents)
```typescript
interface AgentRegistry {
  loadOnInit: boolean;                    // Load all agents at session start
  agentCount: 19;                        // Streamlined from 112 to 19 agents
  lastRefactor: '2025-08-21';           // Major refactoring completed
  capabilities: Map<string, string[]>;   // Agent -> capabilities mapping
  compatibility: Map<string, string[]>;  // Agent -> compatible agents
  complexity: Map<string, number>;       // Agent -> complexity handling score
  domains: Map<string, string[]>;        // Domain -> relevant agents
  tools: Map<string, string[]>;          // Agent -> preferred tools
  mcpAccess: 'all';                     // All agents have full MCP tool access
}

const autoAgentSelection = {
  trigger: "every_user_request",
  evaluation: [
    "Parse request for domain keywords",
    "Assess task complexity (1-10)",
    "Match to agent capabilities", 
    "Consider agent compatibility",
    "Select primary + supporting agents",
    "Create orchestration plan"
  ],
  logging: "Record selection rationale in TODO.md"
};
```

### MCP Tools Integration
```typescript
interface McpToolsConfig {
  // Registered MCPs for orchestration
  available: ['gemini-mcp', 'playwright-mcp', 'context7-mcp'];
  
  // MCP roles & capabilities
  geminiMcp: {
    role: 'semantic_validator_consultant',
    model: 'gemini-2.5-pro',
    capabilities: {
      'ask-gemini': 'Alternative AI consultation',
      'brainstorm': 'Creative problem solving', 
      'fetch-chunk': 'Large response handling'
    },
    transport: 'stdio'
  },
  
  playwrightMcp: {
    role: 'test_automation_browser',
    capabilities: {
      'browser_navigate': 'URL navigation',
      'browser_click': 'Element interaction',
      'browser_snapshot': 'Accessibility capture',
      'browser_evaluate': 'JS execution'
    },
    transport: 'stdio'
  },
  
  context7Mcp: {
    role: 'external_context_orchestration', 
    capabilities: {
      'resolve-library-id': 'Find documentation',
      'get-library-docs': 'Retrieve API docs'
    },
    transport: 'sse',  // Persistent SSE transport
    endpoint: 'https://mcp.context7.com/sse'
  },
  
  // Domain-based MCP selection
  orchestration: {
    planning: ['gemini-mcp'],
    validation: ['gemini-mcp'],
    documentation: ['context7-mcp'],
    testing: ['playwright-mcp'],
    consultation: ['gemini-mcp'],
    browser_workflows: ['playwright-mcp']
  }
};
```

### Streamlined Agent Registry (19 Specialized Agents)

#### Core Development (5)
- `PHPMaster` - PHP 8.3+, PSR standards, modern patterns
- `FrontendDeveloper` - React, Vue, Angular, Next.js, TypeScript
- `BackendDeveloper` - PHP/Laravel, Node.js, Python APIs
- `laravel-specialist` - Laravel 11 deep expertise
- `wordpress-expert` - WordPress core, plugins, themes

#### Infrastructure & DevOps (3)
- `ContainerSpecialist` - Docker, Kubernetes, Laravel Sail
- `ServerManager` - Linux, Nginx/Apache, PHP-FPM, SSL
- `CICDPipeline` - GitHub Actions, Laravel Envoy, deployments

#### Quality & Security (3)
- `PHPCodeQuality` - PHPStan, Psalm, Laravel Pint, standards
- `TestingSpecialist` - Pest, PHPUnit, Playwright, Cypress
- `SecurityGuard` - OWASP, Laravel security, WordPress hardening

#### Architecture & Support (8)
- `APIArchitect` - REST, GraphQL, OpenAPI, authentication
- `DatabaseOptimizer` - MySQL, PostgreSQL, Redis optimization
- `DocumentationWriter` - Technical docs, README, API docs
- `WorkflowCoordinator` - Multi-agent orchestration
- `debugger` - Debugging and troubleshooting
- `git-workflow` - Git operations
- `browser-automation-tools` - E2E testing
- `context-fetcher` - Documentation retrieval


## 🗑️ Enhanced Cleanup & File Management

### Temporary File Tracking Protocol
```typescript
interface TempFileManager {
  sessionFiles: string[];         // Files created this session
  purposes: Map<string, string>;  // File -> purpose mapping  
  cleanup: Map<string, boolean>;  // File -> should cleanup
  preserved: string[];           // Files to keep permanently
  todoTracking: boolean;         // Track in TODO.md
}

const cleanupProtocol = {
  creation: {
    immediate: "Log in TODO.md upon creation",
    annotation: "Include file purpose and cleanup status",
    categorization: ["debug", "temp", "output", "config", "artifact"]
  },
  
  tracking: {
    location: "TODO.md ## 🗑️ Temporary Files Created",
    format: "- `filepath` - [purpose] - [cleanup: yes/no] - [status]",
    updates: "Real-time status updates during task progress"
  },
  
  cleanup: {
    triggers: ["task_completion", "task_failure", "session_end"],
    criteria: {
      debug_files: "auto_cleanup",
      temp_outputs: "auto_cleanup", 
      config_backups: "preserve_on_success",
      test_artifacts: "cleanup_after_validation",
      documentation: "always_preserve"
    }
  },
  
  preservation: {
    essential_artifacts: "Keep files critical for project",
    documentation: "Preserve all .md files unless explicitly temp",
    configurations: "Keep successful config changes",
    successful_outputs: "Preserve final deliverables"
  }
};
```

### Cleanup Automation Rules
```yaml
auto_cleanup_rules:
  debug_files:
    patterns: ["debug_*.log", "temp_*.txt", "test_output_*"]
    trigger: task_completion
    condition: always
    
  temporary_configs:
    patterns: ["*.bak", "*.tmp", "temp_config_*"]
    trigger: task_success
    condition: backup_confirmed
    
  test_artifacts:
    patterns: ["coverage_*", "test_results_*", "*.spec.temp"]
    trigger: validation_complete
    condition: tests_passed
    
  build_artifacts:
    patterns: ["build_temp_*", "dist_debug_*"]
    trigger: deployment_success
    condition: production_deployed

preservation_rules:
  documentation:
    patterns: ["*.md", "README*", "CHANGELOG*"]
    condition: always_preserve
    
  configurations:
    patterns: ["*.json", "*.yaml", "*.toml"]
    condition: preserve_on_success
    
  source_code:
    patterns: ["*.php", "*.js", "*.ts", "*.py"]
    condition: always_preserve
    
  deliverables:
    patterns: ["final_*", "production_*", "release_*"]
    condition: always_preserve
```

## Enhanced Workflow Templates

### Feature Development with Auto-Cleanup
```yaml
planning:  # OPUS 4.1 + GEMINI-2.5-PRO
  primary: [architect-reviewer, workflow-orchestrator]
  validation: gemini-consultant (model: gemini-2.5-pro)
  tasks: [requirements, design, breakdown, cross_validation]
  temp_files: [planning_notes.md, architecture_draft.md]
  cleanup: preserve_on_success
  
agent_assignment:  # AUTO + TODO.md
  orchestrator: multi-agent-coordinator
  selection: dynamic_based_on_domain
  todo_creation: automatic
  tracking: real_time
  
implementation:  # SPECIALIZED AGENTS + SONNET
  backend: [laravel-specialist, php-pro]
  frontend: [react-specialist, ui-engineer]
  testing: [qa-expert, test-automator]
  coordination: multi-agent-coordinator
  temp_files: [debug_*.log, test_output_*, coverage_*]
  cleanup: auto_after_validation
  
validation:  # MULTI-MODEL + CLEANUP
  code_review: gemini-consultant (model: gemini-2.5-pro)
  security: [security-engineer, security-auditor]
  architecture: [architect-reviewer]
  performance: [performance-engineer]
  cleanup_trigger: validation_complete
  preserve: [final_report.md, security_audit.md]
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

## 📋 Automatic TODO.md System

### TODO.md Generation Protocol
```typescript
interface TodoSystem {
  autoGeneration: boolean;         // Create TODO.md automatically
  triggers: string[];             // When to create/update
  template: TodoTemplate;         // Standard format
  persistence: boolean;           // Cross-session continuity
  cleanup: boolean;              // Remove completed todos
}

const todoTriggers = [
  "session_start",               // Check existing TODO.md
  "task_planning_complete",      // Create initial todos
  "agent_assignment",           // Log agent selections
  "temp_file_creation",         // Track temporary files
  "task_completion",            // Mark completed
  "workflow_milestone",         // Update progress
  "session_end"                // Final cleanup
];

const todoTemplate = {
  header: "# TODO - [ProjectName] - [Date]",
  sections: {
    session_goals: "## 🎯 Current Session Goals",
    tasks_progress: "## 📝 Tasks in Progress",
    completed: "## ✅ Completed Tasks", 
    temp_files: "## 🗑️ Temporary Files Created",
    agents_used: "## 🤖 Agents Utilized",
    tools_used: "## 🔧 Tools & MCP Used",
    cleanup_status: "## 🧹 Cleanup Status"
  }
};
```

### Session Initialization Protocol
```typescript
const sessionInit = {
  step1: {
    action: "Check for existing TODO.md",
    location: ["./TODO.md", "../TODO.md", "~/TODO.md"],
    onFound: "Load and display current status",
    onMissing: "Create new TODO.md with session goals"
  },
  
  step2: {
    action: "Load agent registry from ~/.claude/agents",
    count: "94 agents available",
    categorize: "Group by domain and capability",
    prepare: "Ready for automatic selection"
  },
  
  step3: {
    action: "Validate MCP tools availability",
    check: ["gemini-mcp", "playwright-mcp", "context7-mcp"],
    status: "Verify connectivity and authentication",
    prepare: "Ready for tool integration"
  },
  
  step4: {
    action: "Scan for temporary files",
    patterns: ["temp_*", "debug_*", "*.tmp", "*.bak"],
    assess: "Determine cleanup candidates",
    log: "Record in TODO.md cleanup section"
  },
  
  step5: {
    action: "Context restoration",
    previous: "Load previous session context if available",
    memory: "Restore workflow state and progress",
    continue: "Resume interrupted workflows"
  }
};
```

## Enhanced Quick Commands

### Session & TODO Management
- `/session init` - Initialize session with TODO check
- `/todo create [project]` - Create new TODO.md
- `/todo update` - Update current TODO status
- `/todo cleanup` - Remove completed and clean temp files
- `/session restore` - Restore previous session context

### Multi-Model Operations
- `/plan [task]` - Cross-model planning (OPUS + GEMINI-2.5-PRO)
- `/validate [code]` - Multi-model validation (GEMINI-2.5-PRO)
- `/consult gemini [question]` - Direct Gemini-2.5-Pro consultation
- `/compare models [task]` - Model perspective comparison

### Agent Orchestration  
- `/agents scan` - Evaluate available agents for task
- `/agent auto [task]` - Automatic agent selection
- `/orchestrate [domain]` - Domain-specific coordination
- `/swarm [complex_task]` - Multi-agent swarm

### MCP Tools Integration
- `/tools check` - Verify MCP availability & transport status
- `/gemini ask [question]` - Semantic validation via Gemini-MCP
- `/context7 docs [library]` - Persistent SSE documentation retrieval
- `/playwright test [workflow]` - Browser automation workflows
- `/brainstorm [topic]` - Creative ideation via Gemini-MCP

### Workflow Templates
- `/template feature` - Full feature development
- `/template optimize` - Performance optimization  
- `/template security` - Security audit
- `/template ai` - AI integration workflow

### File & Cleanup Management
- `/files temp` - List temporary files
- `/cleanup auto` - Auto-cleanup based on rules
- `/cleanup manual` - Interactive cleanup selection
- `/preserve [pattern]` - Mark files for preservation

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

## 🎯 Enhanced Key Principles

1. **Session-Aware Operations**: Always check TODO.md at session start
2. **Intelligent Agent Selection**: Auto-evaluate and select optimal agents from ~/.claude/agents  
3. **Comprehensive Tool Usage**: Leverage all MCP tools (gemini-cli, context7, etc.)
4. **Temporary File Management**: Track, annotate, and auto-cleanup temp files
5. **Cross-Model Planning**: OPUS 4.1 + GEMINI-2.5-PRO for comprehensive analysis
6. **Agent-Led Implementation**: Specialized agents with optimal models
7. **Multi-Model Validation**: GEMINI-2.5-PRO for quality assurance
8. **Intelligent Orchestration**: Dynamic agent selection and coordination
9. **Context Persistence**: Cross-session memory with learning capture
10. **Continuous Evolution**: Pattern recognition and workflow optimization
11. **Security by Design**: Multi-layered security validation
12. **Performance Excellence**: Speed + quality through specialization
13. **Creative Intelligence**: Leverage GEMINI-2.5-PRO for innovation
14. **Repository Hygiene**: Maintain clean repositories through systematic cleanup

## 🚀 Session Startup Checklist

### Mandatory Session Initialization
```typescript
const sessionChecklist = {
  1: {
    task: "Check for existing TODO.md",
    locations: ["./TODO.md", "../TODO.md", "~/TODO.md"],
    action: "Load existing or create new",
    status: "REQUIRED"
  },
  
  2: {
    task: "Load agent registry",
    source: "~/.claude/agents/*.md", 
    count: "94+ specialized agents",
    action: "Parse capabilities and domains",
    status: "REQUIRED"
  },
  
  3: {
    task: "Validate MCP tools",
    tools: ["gemini-mcp", "playwright-mcp", "context7-mcp"],
    check: "Connectivity and authentication",
    action: "Prepare for intelligent tool selection",
    status: "REQUIRED"
  },
  
  4: {
    task: "Scan temporary files",
    patterns: ["temp_*", "debug_*", "*.tmp", "*.bak"],
    action: "Identify cleanup candidates",
    log: "Update TODO.md cleanup section",
    status: "REQUIRED"
  },
  
  5: {
    task: "Evaluate user request",
    analysis: "Domain mapping, complexity scoring",
    selection: "Primary + supporting agents",
    tools: "Relevant MCP tool integration",
    documentation: "Log plan in TODO.md",
    status: "REQUIRED"
  }
};
```

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

### Enhanced MCP Integration Protocol
```typescript
const mcpOrchestration = {
  geminiMcp: {
    role: 'semantic_validator_consultant',
    model: 'gemini-2.5-pro',  // Fixed model
    config: {
      'ask-gemini': {
        changeMode: true,        // Structured edit suggestions
        sandbox: false           // Production ready
      },
      'brainstorm': {
        methodology: 'auto',
        domain: 'context-aware',
        includeAnalysis: true
      },
      'fetch-chunk': {
        streaming: true          // Large response handling
      }
    }
  },
  
  playwrightMcp: {
    role: 'test_automation_browser',
    workflows: {
      e2e_testing: 'Automated user journey validation',
      ui_regression: 'Visual diff testing',
      accessibility: 'WCAG compliance checking',
      performance: 'Page load metrics'
    }
  },
  
  context7Mcp: {
    role: 'external_context_orchestration',
    transport: 'sse',           // Persistent connection
    advantages: {
      realtime: 'Live documentation updates',
      persistent: 'Maintained connection state',
      efficient: 'Reduced handshake overhead'
    }
  }
};

// Multi-MCP orchestration patterns
const mcpWorkflows = {
  plan_validate: {
    1: 'OPUS creates plan',
    2: 'GEMINI-MCP validates via ask-gemini', 
    3: 'CONTEXT7-MCP provides domain context',
    4: 'Refined cross-validated output'
  },
  
  test_driven_dev: {
    1: 'Agent implements feature',
    2: 'PLAYWRIGHT-MCP creates E2E tests',
    3: 'GEMINI-MCP reviews test coverage',
    4: 'Validated implementation'
  },
  
  documentation_sync: {
    1: 'CONTEXT7-MCP streams latest docs via SSE',
    2: 'GEMINI-MCP analyzes for context relevance',
    3: 'Agent applies domain knowledge',
    4: 'Up-to-date implementation'
  }
};
```

---

---

## 🔧 MCP Integration

### Registered MCPs for Tool Orchestration
```bash
# Core MCP servers
claude mcp add gemini-mcp -- npx -y gemini-mcp-tool
claude mcp add playwright-mcp npx @playwright/mcp@latest  
claude mcp add --transport sse context7-mcp https://mcp.context7.com/sse

# Multi-layered memory system (Vlad Arbatov's super-memory setup)
claude mcp add --scope user memory-bank -e MEMORY_BANK_ROOT=~/.claude/memory-bank -- npx -y @allpepper/memory-bank-mcp
claude mcp add --scope user knowledge-graph -e GRAPH_STORAGE_PATH=~/.claude/knowledge-graph -- npx -y mcp-knowledge-graph

# Project management integration
claude mcp add --scope user notion -- npx -y @notionhq/notion-mcp
claude mcp add --scope user asana -- npx -y asana-mcp
```

### MCP Roles & Orchestration Matrix
```yaml
Phase           Primary Model    Validator/Consultant    MCP Involved
Planning        Claude Opus 4.1  Gemini 2.5 Pro         gemini-mcp
Implementation  Claude Sonnet 4   Domain-specific agents  playwright-mcp (if needed)
Validation      Gemini 2.5 Pro   Opus 4.1 (arbiter)     gemini-mcp, context7-mcp
```

### Multi-Layered Memory System (Vlad Arbatov Configuration)
```typescript
interface SuperMemorySystem {
  // Layer 1: File-based project memory
  memoryBank: {
    role: 'project_memory_persistence',
    storage: 'file-based',
    scope: 'project-specific',
    capabilities: ['context-notes', 'tech-stack', 'decisions']
  },
  
  // Layer 2: Structured knowledge graph  
  knowledgeGraph: {
    role: 'structured_knowledge_base',
    storage: 'graph-based',
    scope: 'global-preferences', 
    capabilities: ['relationships', 'preferences', 'workflows']
  },
  
  // Layer 3: Real-time documentation
  context7: {
    role: 'external_context_orchestration',
    storage: 'real-time',
    scope: 'external-docs',
    capabilities: ['latest-apis', 'version-specific', 'live-docs']
  }
};

// Multi-layer orchestration
const memoryWorkflow = {
  1: 'memory-bank loads project context',
  2: 'knowledge-graph provides global preferences', 
  3: 'context7 streams latest documentation',
  4: 'combined context for optimal decision-making'
};
```

### MCP Transport Protocols
- **gemini-mcp** → `stdio` (standard I/O)
- **playwright-mcp** → `stdio` (standard I/O) 
- **context7-mcp** → `sse` (Server-Sent Events, persistent connection)
- **memory-bank-mcp** → `stdio` (file-based memory persistence)
- **knowledge-graph-mcp** → `stdio` (structured knowledge storage)
- **notion-mcp** → `stdio` (document collaboration)
- **asana-mcp** → `stdio` (task management)

### MCP Naming Convention
All MCPs use the suffix `-mcp` for clarity:
- External orchestrators (Context7) use SSE transport when available
- Agent families follow `domain/task` convention (e.g., `security/vuln-audit`)

---

**Version**: 4.1 Enhanced MCP | **Updated**: 2025-08-18  
**Features**: Cross-Model Intelligence, MCP Orchestration, Agent Families, SSE Transport  
**Capabilities**: OPUS + GEMINI Planning, Domain-Specific Agent Implementation, Multi-MCP Validation
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
