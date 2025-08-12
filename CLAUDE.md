# Claude Code - Global Configuration for Full Stack Development

## 🔄 Configuration Sync Strategy

### Repository Architecture
- **Development Repository**: `~/Sites/claude-code-config`
- **Active Configuration**: `~/.claude/` (utilizzata da Claude Code)
- **Sync Script**: `~/.claude/sync-config.sh`
- **Setup Guide**: `~/.claude/SETUP-GUIDE.md`

### 🚀 Quick Setup
```bash
# 1. Esegui setup automatico
~/.claude/setup-sync.sh

# 2. Attiva comandi rapidi (aggiungi al tuo ~/.zshrc o ~/.bashrc)
source ~/.claude/sync-aliases.sh

# 3. Verifica setup
claude-sync-status
```

### 📝 Comandi Rapidi (dopo setup)
```bash
# Sincronizzazione
claude-sync-to          # Claude → Repository
claude-sync-from        # Repository → Claude
claude-sync-watch       # Auto-sync continuo

# Git workflow
claude-commit "msg"     # Sync + commit
claude-push "msg"       # Sync + commit + push
claude-pull             # Pull + sync da repository

# Navigazione
claude-config          # Vai a ~/.claude
claude-repo            # Vai al repository

# Aiuto
claude-help            # Lista tutti i comandi
```

### 🔄 Workflow Quotidiano
```bash
# Modifica configurazione normalmente
nano ~/.claude/CLAUDE.md

# Sync e commit quando pronto
claude-commit "Added new Laravel workflows"

# Push occasionalmente
cd ~/Sites/claude-code-config && git push
```

### 📦 File Sincronizzati Automaticamente
- `CLAUDE.md` - Configurazione principale
- `settings.json` - Impostazioni Claude Code
- `agents/` - Specifiche agenti (100+ files)
- `templates/` - Template di codice
- `workflows/` - Definizioni workflow

### 🛡️ Sicurezza e Backup
- ✅ Backup automatico prima di ogni sync da repository
- ✅ File sensibili (.env) esclusi da git
- ✅ Backup conservati in `~/.claude/backups/`

### 📖 Documentazione Completa
Per setup dettagliato, troubleshooting e casi d'uso avanzati:
```bash
# Leggi la guida completa
less ~/.claude/SETUP-GUIDE.md
```

## Primary Technical Information Source
**Context7**: Integrated MCP service for real-time technical information
- **Endpoint**: https://mcp.context7.com/mcp  
- **Priority**: First source for technical documentation, API references, and best practices
- **Fallback**: If Context7 is unreachable, use standard knowledge base

## Developer Profile
**Role**: Full Stack Developer  
**Primary Stack**: PHP, Laravel, JavaScript, WordPress, Docker  
**Specializations**: API Development, Database Design, DevOps, Performance Optimization

## Intelligent Agent Orchestration

### Automatic Request Analysis

Before every complex task, Claude Code will automatically analyze:

1. **Task Complexity**
   - Simple: 1-3 direct operations → Sonnet or base models
   - Medium: 4-7 interconnected operations → Advanced Sonnet
   - Complex: 8+ operations, critical architecture → Opus (when available)

2. **Work Type**
   - **Backend Development**: `php-pro`, `laravel-specialist`, `backend-developer`
   - **Frontend Development**: `ui-engineer`, `react-specialist`, `frontend-developer`  
   - **Full Stack Features**: `fullstack-developer` + multi-agent orchestration
   - **Database Work**: `sql-pro`, `database-administrator`, `postgres-pro`
   - **DevOps/Deployment**: `devops-engineer`, `docker-specialist`, `kubernetes-specialist`
   - **Security**: `security-engineer`, `security-auditor`
   - **Testing**: `qa-expert`, `test-automator`
   - **Workflow Management**: `workflow-orchestrator`, `multi-agent-coordinator`

### Agent Selection Matrix by Stack

#### PHP & Laravel Development
```yaml
Scenario: "Implement JWT authentication with Laravel"
Primary Agent: laravel-specialist
Supporting Agents: 
  - security-engineer (for JWT validation)
  - api-designer (for API documentation)
  - test-automator (for test coverage)
Model Recommendation: Sonnet (medium-high complexity)
```

#### WordPress Development
```yaml
Scenario: "Custom theme with Gutenberg blocks"
Primary Agent: wordpress-expert
Supporting Agents:
  - ui-engineer (for component styling)
  - php-pro (for custom hooks/filters)
  - performance-engineer (for optimization)
Model Recommendation: Sonnet
```

#### JavaScript/Frontend
```yaml
Scenario: "React dashboard with real-time updates"
Primary Agent: react-specialist
Supporting Agents:
  - websocket-engineer (for real-time)
  - ui-engineer (for UI/UX)
  - performance-engineer (for optimization)
Model Recommendation: Sonnet+
```

#### Full Stack Features
```yaml
Scenario: "Complete e-commerce with payment gateway"
Primary Agent: fullstack-developer
Supporting Agents:
  - laravel-specialist (backend API)
  - react-specialist (frontend)
  - payment-integration (Stripe/PayPal)
  - database-administrator (schema design)
  - security-engineer (security review)
  - devops-engineer (deployment)
Model Recommendation: Opus (maximum complexity)
```

### Orchestration Workflow

#### 1. Task Analysis Phase
```typescript
interface TaskAnalysis {
  complexity: 'simple' | 'medium' | 'complex' | 'enterprise';
  domains: string[];
  estimatedAgents: number;
  criticalPath: string[];
  modelRecommendation: 'haiku' | 'sonnet' | 'opus';
}
```

#### 2. Agent Assignment Strategy
1. **Identify Primary Domain**: What is the main task area?
2. **Map to Specialist Agent**: Assign primary agent based on expertise
3. **Identify Dependencies**: What other domains are involved?
4. **Plan Coordination**: How to orchestrate collaboration?

#### 3. Execution Orchestration
- **Sequential**: For tasks with tight dependencies
- **Parallel**: For independent tasks that can be parallelized
- **Pipeline**: For workflows with handoffs between agents

### Workflow Templates

#### Template: Feature Development
```yaml
name: "full-stack-feature-development"
trigger: "complex feature requested by user"
phases:
  1_analysis:
    agent: fullstack-developer
    tasks: [requirements, architecture, tech_stack]
  2_backend:
    agent: laravel-specialist | php-pro
    tasks: [database, api, security]
  3_frontend:
    agent: react-specialist | ui-engineer
    tasks: [components, state, integration]
  4_integration:
    agent: fullstack-developer
    tasks: [testing, deployment, monitoring]
  5_quality:
    agents: [qa-expert, security-auditor]
    tasks: [testing, security_review]
```

#### Template: Performance Optimization
```yaml
name: "performance-optimization"
trigger: "performance issues reported"
phases:
  1_analysis:
    agent: performance-engineer
    tasks: [profiling, bottleneck_identification]
  2_database:
    agent: database-optimizer
    tasks: [query_optimization, indexing]
  3_backend:
    agent: php-pro | laravel-specialist
    tasks: [code_optimization, caching]
  4_frontend:
    agent: ui-engineer
    tasks: [bundle_optimization, lazy_loading]
  5_infrastructure:
    agent: devops-engineer
    tasks: [server_optimization, cdn_setup]
```

### Agent Communication Protocol

#### Inter-Agent Data Sharing
```json
{
  "context_key": "project_laravel_ecommerce",
  "shared_data": {
    "database_schema": "...",
    "api_contracts": "...",
    "authentication_method": "JWT",
    "tech_stack": ["Laravel 10", "React 18", "MySQL 8"]
  }
}
```

#### Progress Coordination
```json
{
  "orchestration_id": "task_123",
  "current_phase": "backend_development",
  "completed_agents": ["fullstack-developer"],
  "active_agents": ["laravel-specialist"],
  "waiting_agents": ["react-specialist", "qa-expert"],
  "blockers": []
}
```

### Model Selection Guidelines

#### Automatic Model Selection Algorithm

```typescript
interface TaskComplexity {
  domainCount: number;        // Numero di domini tecnici coinvolti
  interdependencies: number;  // Livello di interconnessione tra componenti
  criticalityLevel: 'low' | 'medium' | 'high' | 'critical';
  timeConstraint: 'none' | 'moderate' | 'urgent';
  architecturalImpact: boolean; // Se modifica architettura esistente
  teamCollaboration: boolean;   // Se richiede coordinazione multi-agent
}

function calculateComplexityScore(task: TaskComplexity): number {
  let score = 0;
  
  // Base score for domains
  score += task.domainCount * 1.5;
  
  // Interdependencies weigh heavily
  score += task.interdependencies * 2;
  
  // Criticality
  const criticalityMultiplier = {
    'low': 1,
    'medium': 1.5, 
    'high': 2,
    'critical': 3
  };
  score *= criticalityMultiplier[task.criticalityLevel];
  
  // Penalty for urgency (faster models)
  if (task.timeConstraint === 'urgent') score *= 0.7;
  
  // Bonus for architectural impact
  if (task.architecturalImpact) score += 3;
  
  // Bonus for multi-agent collaboration
  if (task.teamCollaboration) score += 2;
  
  return Math.round(score);
}

function selectOptimalModel(task: TaskComplexity): ModelRecommendation {
  const score = calculateComplexityScore(task);
  
  // Opus for critical architectural tasks
  if (score >= 10 || task.architecturalImpact && task.criticalityLevel === 'critical') {
    return {
      model: 'opus',
      reason: 'Critical architecture requires maximum reasoning',
      confidence: 0.95
    };
  }
  
  // Sonnet for complex but non-critical tasks
  if (score >= 6 || task.teamCollaboration) {
    return {
      model: 'sonnet',
      reason: 'Balanced complexity, multi-agent orchestration',
      confidence: 0.85
    };
  }
  
  // Haiku for simple and fast tasks
  if (score <= 3 && task.timeConstraint !== 'none') {
    return {
      model: 'haiku',
      reason: 'Simple task, optimized for speed',
      confidence: 0.8
    };
  }
  
  // Default Sonnet for intermediate cases
  return {
    model: 'sonnet',
    reason: 'Optimal quality/speed balance',
    confidence: 0.75
  };
}
```

#### Context-Specific Model Selection

**PHP/Laravel Development**:
- Simple tasks (CRUD, validations): `Haiku`
- Complex APIs, authentication: `Sonnet`
- Microservices architecture: `Opus`

**Full Stack Features**:
- Isolated components: `Sonnet`
- Complete frontend-backend integration: `Opus`
- Real-time dashboard: `Sonnet+`

**Database Operations**:
- Query optimization: `Sonnet`
- Complex schema migration: `Opus`
- Performance tuning: `Sonnet`

**DevOps/Docker**:
- Simple containers: `Haiku`
- Multi-stage builds: `Sonnet`
- Kubernetes orchestration: `Opus`

#### Esempi Pratici di Selezione

```yaml
Example 1: "Add email validation to Laravel API"
Analysis:
  - domainCount: 1 (backend)
  - interdependencies: 1 (API layer only)
  - criticalityLevel: low
  - architecturalImpact: false
Result: Haiku (score: 2.5)

Example 2: "Implement real-time notification system"
Analysis:
  - domainCount: 3 (backend, frontend, infrastructure)
  - interdependencies: 4 (WebSocket, database, cache, UI)
  - criticalityLevel: high
  - architecturalImpact: true
  - teamCollaboration: true
Result: Opus (score: 13)

Example 3: "Optimize Eloquent queries for dashboard"
Analysis:
  - domainCount: 2 (database, backend)
  - interdependencies: 2 (ORM, query optimization)
  - criticalityLevel: medium
  - architecturalImpact: false
Result: Sonnet (score: 6)
```

## Stack-Specific Configurations

### Laravel Projects
```yaml
default_agents: [laravel-specialist, php-pro]
common_patterns:
  - api_development
  - eloquent_optimization  
  - queue_processing
  - testing_strategies
preferred_tools: [artisan, composer, pest, phpstan]
```

### WordPress Projects  
```yaml
default_agents: [wordpress-expert, php-pro]
common_patterns:
  - custom_themes
  - gutenberg_blocks
  - plugin_development
  - performance_optimization
preferred_tools: [wp-cli, composer, webpack]
```

### Full Stack Projects
```yaml
default_agents: [fullstack-developer]
orchestration: multi_agent_coordination
common_patterns:
  - api_first_development
  - real_time_features
  - authentication_flows
  - deployment_automation
```

## Quick Commands

### Quick Agent Selection
- `/agent laravel` → Activate laravel-specialist
- `/agent fullstack` → Activate fullstack-developer
- `/agent security` → Activate security-engineer
- `/orchestrate complex` → Start multi-agent orchestration

### Task Templates  
- `/template feature` → Complete feature development template
- `/template optimize` → Performance optimization template
- `/template security` → Security audit template
- `/template deploy` → Deployment template

## Monitoring and Feedback

### Success Metrics
- Time to completion by task type
- Agent collaboration effectiveness  
- Code quality metrics
- User satisfaction scores

### Continuous Improvement
- Learning from success patterns
- Orchestration optimization
- Best practices updates
- Specialized agent evolution

---

## Advanced Orchestration Configuration

### Agent Priority Matrix
```yaml
# Agent selection priorities by domain
domain_priorities:
  php_development:
    primary: [php-pro, laravel-specialist]
    secondary: [fullstack-developer, security-engineer]
    weight: 0.9
  
  database_work:
    primary: [database-specialist, sql-pro, postgres-pro]
    secondary: [performance-engineer]
    weight: 0.85
  
  containerization:
    primary: [docker-specialist, devops-engineer]
    secondary: [kubernetes-specialist, platform-engineer]
    weight: 0.8
  
  frontend_work:
    primary: [ui-engineer, react-specialist, frontend-developer]
    secondary: [fullstack-developer]
    weight: 0.75
```

### Auto-Orchestration Rules
```typescript
// Automatic orchestration rules
const orchestrationRules = {
  // When a complete feature is requested
  fullStackFeature: {
    trigger: /implement.*feature|develop.*complete|create.*system/i,
    primaryAgent: 'fullstack-developer',
    supportingAgents: ['laravel-specialist', 'ui-engineer', 'database-specialist'],
    modelRecommendation: 'sonnet'
  },
  
  // When performance optimization is requested
  performanceOptimization: {
    trigger: /optimize|slow|performance|speed.*up/i,
    primaryAgent: 'performance-engineer',
    supportingAgents: ['database-specialist', 'php-pro'],
    modelRecommendation: 'sonnet'
  },
  
  // When deployment/DevOps is requested
  deploymentTask: {
    trigger: /deploy|docker|container|kubernetes|ci\/cd/i,
    primaryAgent: 'docker-specialist',
    supportingAgents: ['devops-engineer', 'security-engineer'],
    modelRecommendation: 'sonnet'
  },
  
  // When security analysis is requested
  securityAudit: {
    trigger: /security|vulnerabilit(y|ies)|audit/i,
    primaryAgent: 'security-engineer',
    supportingAgents: ['security-auditor', 'php-pro'],
    modelRecommendation: 'sonnet'
  }
};
```

### Context Sharing Protocol
```json
{
  "global_context": {
    "developer_profile": {
      "primary_stack": ["PHP", "Laravel", "JavaScript", "Docker"],
      "experience_level": "senior",
      "preferences": {
        "code_style": "modern_php_8.3",
        "testing_framework": "pest",
        "frontend_framework": "react",
        "deployment": "docker_compose"
      }
    },
    "project_defaults": {
      "php_version": "8.3",
      "laravel_version": "10.x",
      "node_version": "18+",
      "database": "mysql_8",
      "cache": "redis",
      "queue": "redis"
    }
  }
}
```

### Learning & Adaptation System
```typescript
interface LearningMetrics {
  taskSuccessRate: number;
  averageCompletionTime: number;
  agentCollaborationScore: number;
  modelAccuracyScore: number;
  userSatisfactionRating: number;
}

// System that learns from success patterns
function adaptOrchestrationStrategy(metrics: LearningMetrics) {
  // Adjust agent weights based on success
  if (metrics.agentCollaborationScore > 0.9) {
    // Favor combinations that worked
    updateAgentAffinityScores();
  }
  
  // Optimize model selection
  if (metrics.modelAccuracyScore < 0.8) {
    // Increase threshold for more powerful models
    adjustModelSelectionThresholds();
  }
}
```

## 🚀 Advanced System Implemented

### Implemented Features

#### ✅ 1. Context Persistence System
- **Cross-session Memory**: Maintains project context across different sessions
- **Auto-detection**: Automatically detects project type and tech stack
- **Context Inheritance**: Inherits configurations from similar projects
- **Learning History**: Tracks success patterns and optimizations

#### ✅ 2. Learning & Optimization Engine
- **Pattern Recognition**: Automatically recognizes recurring task patterns
- **Performance Learning**: Learns from agent and model performance
- **Adaptive Model Selection**: Automatically selects optimal model
- **Optimization Suggestions**: Generates automatic improvement suggestions

#### ✅ 3. Dynamic Template System
- **Built-in Templates**: Ready-made templates for Laravel, Docker, WordPress
- **Auto-Generated Templates**: Creates templates from frequent usage patterns
- **Smart Matching**: Automatically selects the best template
- **Template Evolution**: Templates improve with usage experience

#### ✅ 4. Analytics Dashboard & Monitoring
- **Real-time Metrics**: Real-time performance monitoring
- **Performance Analytics**: Detailed analysis of agents, models and tasks
- **Alert System**: Alert system for sub-optimal performance
- **Reporting**: Automatic weekly and monthly reports

#### ✅ 5. Integration Hub
- **GitHub Integration**: Project sync, automatic branch/PR creation
- **Jira Integration**: Issue tracking synchronization
- **Slack Integration**: Automatic notifications and team reports
- **Monitoring Tools**: Integration with DataDog, Sentry, etc.
- **CI/CD Automation**: Automatic GitHub Actions workflow setup

### Available Advanced Commands

```bash
# Context Management
/context save [project_name]          # Save project context
/context load [project_name]          # Load project context
/context analyze                      # Analyze current context

# Learning & Optimization
/learn analyze                        # Analyze learning patterns
/optimize suggest                     # Generate optimization suggestions
/performance review                   # Review recent performance

# Template System
/template suggest                     # Suggest template for task
/template create [name]              # Create custom template
/template analyze                     # Analyze template usage

# Analytics & Monitoring
/dashboard show                       # Show performance dashboard
/metrics summary                      # Summary of main metrics
/alerts check                         # Check active alerts

# Integrations
/integrate setup [service]           # Setup service integration
/sync all                           # Synchronize all integrations
/webhook test [service]             # Test service webhook
```

### Complete Directory Structure

```
~/.claude/
├── CLAUDE.md                        # Configurazione principale
├── agents/                          # Agent specializzati
│   ├── laravel-specialist.md
│   ├── docker-specialist.md
│   ├── database-specialist.md
│   └── wordpress-expert.md
├── context/                         # Sistema di context persistence
│   ├── context-manager.md
│   └── project-contexts.json
├── learning/                        # Sistema di apprendimento
│   ├── learning-engine.md
│   └── learning-data.json
├── templates/                       # Sistema template dinamico
│   ├── template-engine.md
│   └── built-in-templates.json
├── monitoring/                      # Analytics & monitoring
│   ├── analytics-dashboard.md
│   └── metrics-config.json
└── integrations/                    # Hub integrazioni
    ├── integration-hub.md
    └── integration-config.json
```

### Active Automated Workflows

1. **Smart Task Analysis**: Every request is analyzed for complexity and patterns
2. **Adaptive Agent Selection**: Automatic selection of most appropriate agents  
3. **Intelligent Model Choice**: Automatic model selection based on complexity
4. **Template Matching**: Automatic matching with existing templates
5. **Progress Tracking**: Automatic monitoring of performance and metrics
6. **Integration Sync**: Automatic synchronization with external tools
7. **Learning Loop**: Continuous learning from results for future improvements

### Monitored Success Metrics

- **Task Success Rate**: % of tasks completed successfully
- **Agent Collaboration Efficiency**: Multi-agent collaboration effectiveness
- **Model Selection Accuracy**: Precision in optimal model selection
- **Template Usage Effectiveness**: Template effectiveness in accelerating development
- **User Satisfaction Score**: User experience evaluation
- **Time to Completion**: Average time to complete different task types
- **Cost Efficiency**: Cost optimization relative to quality achieved

---

## 🔥 New Claude Code 2025 Features

### Recent Specialized Agents
```yaml
# New powerful agents for 2025
backend_specialists:
  - backend-typescript-architect  # Backend TypeScript con Bun
  - python-backend-engineer       # Python moderno con uv
  - laravel-specialist            # Laravel 11 con moderni pattern
  
frontend_specialists:
  - ui-engineer                   # UI/UX moderno
  - react-specialist              # React 18+ con server components
  - nextjs-developer              # Next.js 15+ con App Router
  - vue-expert                    # Vue 3 Composition API
  
security_specialists:
  - security-engineer             # DevSecOps completo
  - penetration-tester           # Security testing avanzato
  - compliance-auditor           # Audit e compliance
  
cloud_specialists:
  - cloud-architect               # Multi-cloud architecture
  - kubernetes-specialist         # K8s production-ready
  - terraform-engineer           # Infrastructure as Code
  
ai_specialists:
  - ai-engineer                   # AI/ML system design
  - llm-architect                # Large Language Models
  - prompt-engineer              # Prompt optimization
```

### Workflow Orchestration 2025
```typescript
// Intelligent orchestration with Sonnet 4
interface ModernOrchestration {
  model: 'sonnet-4' | 'haiku-3.5' | 'opus-3' | 'claude-3.5-sonnet';
  capabilities: {
    multiModal: boolean;           // Images, PDF, screenshots
    codebaseAnalysis: boolean;     // Complete repository analysis
    realTimeCollaboration: boolean; // Multi-agent coordination
    contextPersistence: boolean;    // Cross-session memory
  };
  agentCoordination: {
    parallel: boolean;             // Parallel agent execution
    sequential: boolean;           // Coordinated pipeline
    adaptive: boolean;             // Dynamic adaptation
  };
}

const modernWorkflow: ModernOrchestration = {
  model: 'sonnet-4',
  capabilities: {
    multiModal: true,
    codebaseAnalysis: true,
    realTimeCollaboration: true,
    contextPersistence: true
  },
  agentCoordination: {
    parallel: true,
    sequential: true,
    adaptive: true
  }
};
```

### AI-Driven Development Pattern 2025
```yaml
pattern: "AI-First Development"
phases:
  1_context_analysis:
    agents: [context-fetcher, codebase-analyzer]
    tasks: [understand_project, analyze_architecture, identify_patterns]
    
  2_intelligent_planning:
    agents: [architect-reviewer, senior-code-reviewer]
    tasks: [design_review, security_analysis, performance_planning]
    
  3_multi_agent_execution:
    agents: [backend-typescript-architect, ui-engineer, security-engineer]
    coordination: parallel_with_synchronization
    
  4_quality_assurance:
    agents: [qa-expert, test-automator, security-auditor]
    validation: [automated_testing, security_scan, performance_check]
    
  5_deployment_automation:
    agents: [devops-engineer, cloud-architect]
    tasks: [containerization, orchestration, monitoring_setup]
```

### Enhanced Stack Configurations 2025

#### Modern Laravel Stack
```yaml
laravel_2025_stack:
  version: "Laravel 11"
  php_version: "PHP 8.3+"
  agents: [laravel-specialist, php-pro, backend-typescript-architect]
  modern_features:
    - pest_2_testing
    - octane_performance
    - horizon_queues
    - telescope_debugging
    - sanctum_auth
    - livewire_3
  integrations:
    - docker_compose_dev
    - github_actions_ci
    - cloudflare_cdn
    - redis_cluster
```

#### Full-Stack TypeScript 2025
```yaml
typescript_2025_stack:
  backend: "Bun + TypeScript"
  frontend: "Next.js 15 + React 19"
  agents: [backend-typescript-architect, nextjs-developer, ui-engineer]
  modern_features:
    - server_components
    - streaming_ssr
    - edge_functions
    - type_safe_apis
    - real_time_updates
  tooling:
    - bun_runtime
    - turbo_monorepo
    - prisma_orm
    - tailwind_v4
```

#### AI-Enhanced WordPress
```yaml
wordpress_ai_2025:
  version: "WordPress 6.4+"
  agents: [wordpress-expert, ai-engineer, ui-engineer]
  ai_features:
    - gutenberg_ai_blocks
    - content_generation
    - seo_optimization
    - performance_ai
  modern_stack:
    - headless_wp
    - graphql_api
    - jamstack_frontend
    - ai_content_pipeline
```

### Advanced Commands 2025

```bash
# AI-Powered Analysis
/analyze deep [path]                 # Deep AI analysis
/understand architecture             # Architectural understanding
/review security                     # Complete security review
/optimize performance               # AI-driven optimization

# Multi-Modal Capabilities  
/screenshot analyze [image]         # UI/UX screenshot analysis
/pdf extract [file]                # PDF content extraction
/diagram generate [type]           # Diagram generation

# Advanced Orchestration
/orchestrate enterprise [task]      # Enterprise-level orchestration
/collaborate sync [agents]          # Multi-agent synchronization
/workflow optimize                  # Workflow optimization

# Context & Learning
/context persist [session]          # Advanced context persistence
/learn pattern [analyze]            # Advanced pattern learning
/insights generate                  # Automatic insights generation

# Modern Development
/modern migrate [stack]             # Modern stack migration
/ai integrate [feature]             # AI feature integration
/performance benchmark              # Automated benchmarking
```

### Intelligence Layer 2025
```typescript
// Advanced intelligence system
interface IntelligenceLayer {
  contextAwareness: {
    projectHistory: ProjectContext[];
    developmentPatterns: Pattern[];
    performanceMetrics: Metrics[];
    userPreferences: UserProfile;
  };
  
  adaptiveLearning: {
    successPatterns: SuccessPattern[];
    failureAnalysis: FailurePattern[];
    optimizationSuggestions: Optimization[];
    continuousImprovement: boolean;
  };
  
  predictiveCapabilities: {
    taskComplexityPrediction: boolean;
    resourceRequirementForecasting: boolean;
    potentialIssueDetection: boolean;
    optimizationOpportunities: boolean;
  };
}

const intelligenceEngine: IntelligenceLayer = {
  contextAwareness: {
    projectHistory: [],
    developmentPatterns: [],
    performanceMetrics: [],
    userPreferences: {
      primaryStack: ["PHP", "Laravel", "TypeScript", "React"],
      experienceLevel: "senior",
      workingStyle: "ai_augmented_development",
      qualityStandards: "enterprise"
    }
  },
  adaptiveLearning: {
    successPatterns: [],
    failureAnalysis: [],
    optimizationSuggestions: [],
    continuousImprovement: true
  },
  predictiveCapabilities: {
    taskComplexityPrediction: true,
    resourceRequirementForecasting: true,
    potentialIssueDetection: true,
    optimizationOpportunities: true
  }
};
```

---

**Version**: 3.0 🤖  
**Last Update**: 2025-08-12  
**Features**: Sonnet 4, Multi-Modal AI, Advanced Orchestration, Predictive Intelligence  
**Next Revision**: Continuous AI-driven evolution  

---
*Next-generation intelligent orchestration system with advanced AI, multi-modal capabilities, and predictive learning for future full-stack development*