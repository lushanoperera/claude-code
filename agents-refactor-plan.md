# Agent Refactoring Plan for PHP/Laravel/WordPress Full-Stack Developer

## Current State: 112 Agents → Target: 18 Core Agents

## 🎯 New Optimized Structure

### **Tier 1: PHP & Framework Specialists** (3 agents)

#### 1. `PHPMaster`
- **Replaces:** php-pro, parts of backend-developer
- **Responsibilities:** PHP 8.3+, Composer, PSR standards, PHPStan/Psalm, PHPUnit/Pest
- **Keep files:** php-pro.md (rename to PHPMaster.md)

#### 2. `LaravelArchitect` 
- **Replaces:** laravel-specialist (enhanced)
- **Responsibilities:** Laravel 11, Eloquent, Livewire, Horizon, Octane, Artisan, migrations, queues, packages
- **Keep files:** laravel-specialist.md (rename to LaravelArchitect.md)

#### 3. `WordPressExpert`
- **Replaces:** wordpress-expert (enhanced)
- **Responsibilities:** WordPress core, Gutenberg, WooCommerce, page builders (Bricks, Elementor, Divi), plugin/theme development
- **Keep files:** wordpress-expert.md (keep as is)

### **Tier 2: Full-Stack Development** (3 agents)

#### 4. `FrontendFrameworkSpecialist`
- **Replaces:** react-specialist, nextjs-developer, vue-expert, angular-architect, parts of ui-engineer, frontend-developer
- **Responsibilities:** React 19, Next.js 15, Vue 3, Angular 17+, TypeScript, server components, SSR/SSG, Composition API, RxJS
- **Merge files:** react-specialist.md + nextjs-developer.md + vue-expert.md + angular-architect.md → FrontendFrameworkSpecialist.md

#### 5. `APIArchitect`
- **Replaces:** api-designer, graphql-architect, api-documenter
- **Responsibilities:** REST/GraphQL design, Laravel Sanctum/Passport, WordPress REST API, OpenAPI/Swagger
- **Merge files:** api-designer.md + graphql-architect.md + api-documenter.md → APIArchitect.md

#### 6. `DatabaseOptimizer`
- **Replaces:** database-specialist, database-administrator, database-optimizer, sql-pro, postgres-pro
- **Responsibilities:** MySQL 8, PostgreSQL, Redis, Laravel migrations, WordPress DB structure, query optimization
- **Merge files:** database-specialist.md + database-optimizer.md + sql-pro.md → DatabaseOptimizer.md

### **Tier 3: DevOps & Infrastructure** (3 agents)

#### 7. `ContainerSpecialist`
- **Replaces:** docker-specialist, parts of kubernetes-specialist
- **Responsibilities:** Docker for PHP/Laravel/WordPress, docker-compose, Laravel Sail, LEMP/LAMP stacks
- **Keep files:** docker-specialist.md (rename to ContainerSpecialist.md)

#### 8. `ServerManager`
- **NEW AGENT (fills gap)**
- **Responsibilities:** Linux server management, Nginx/Apache, PHP-FPM, OPcache, SSL/Let's Encrypt, fail2ban
- **Create new file:** ServerManager.md

#### 9. `CICDPipeline`
- **Replaces:** devops-engineer, deployment-engineer, devops-incident-responder, build-engineer
- **Responsibilities:** GitHub Actions, Laravel Envoy, automated testing, deployment strategies
- **Merge files:** devops-engineer.md + deployment-engineer.md → CICDPipeline.md

### **Tier 4: Quality & Security** (3 agents)

#### 10. `PHPCodeQuality`
- **Replaces:** code-reviewer, senior-code-reviewer, refactoring-specialist (for PHP)
- **Responsibilities:** PHP-CS-Fixer, PHPStan, Psalm, Laravel Pint, WordPress Coding Standards
- **Merge files:** code-reviewer.md + refactoring-specialist.md → PHPCodeQuality.md

#### 11. `TestingSpecialist`
- **Replaces:** qa-expert, test-automator, test-runner
- **Responsibilities:** Pest/PHPUnit for Laravel, WordPress testing, Playwright/Cypress for E2E
- **Merge files:** qa-expert.md + test-automator.md → TestingSpecialist.md

#### 12. `SecurityGuard`
- **Replaces:** security-engineer, security-auditor, penetration-tester, compliance-auditor
- **Responsibilities:** OWASP for PHP, Laravel security, WordPress hardening
- **Merge files:** security-engineer.md + security-auditor.md → SecurityGuard.md

### **Tier 5: Support & Orchestration** (2 agents)

#### 13. `WorkflowCoordinator`
- **Replaces:** multi-agent-coordinator, workflow-orchestrator, task-distributor, agent-organizer, knowledge-synthesizer
- **Responsibilities:** Multi-agent coordination, task decomposition, context maintenance
- **Merge files:** multi-agent-coordinator.md + workflow-orchestrator.md → WorkflowCoordinator.md

#### 14. `DocumentationWriter`
- **Replaces:** technical-writer, documentation-engineer
- **Responsibilities:** README, API docs, inline comments, WordPress/Laravel documentation
- **Merge files:** technical-writer.md + documentation-engineer.md → DocumentationWriter.md

### **Utility Agents to Keep** (4 agents)

15. `debugger` - Keep for debugging tasks
16. `git-workflow` - Keep for git operations  
17. `browser-automation-tools` - Keep for E2E testing
18. `context-fetcher` - Keep for documentation retrieval

## 📁 Agents to Delete (94 agents)

### Complete Removal List:

#### AI/ML (not in stack):
- ai-engineer, ml-engineer, machine-learning-engineer, mlops-engineer, llm-architect, nlp-engineer, prompt-engineer

#### Mobile (not in stack):
- mobile-developer, mobile-app-developer

#### Business/Analysis (not in stack):
- business-analyst, market-researcher, competitive-analyst, trend-analyst, sales-engineer, customer-success-manager, content-marketer, product-manager, project-manager, scrum-master, legal-advisor, risk-manager, quant-analyst

#### Unused Frameworks:
- django-developer, rails-expert

#### Redundant/Duplicates:
- backend-developer (replaced by PHPMaster)
- frontend-developer (replaced by ReactNextSpecialist)
- ui-engineer (merged into ReactNextSpecialist)
- backend-typescript-architect (not primary stack)
- python-backend-engineer, python-pro (not primary stack)
- javascript-pro, typescript-pro (covered by ReactNextSpecialist)
- fullstack-developer (split into specialized agents)
- debugging-specialist, error-detective, error-coordinator (keep only debugger)
- git-workflow-manager (keep only git-workflow)
- database-administrator (merged into DatabaseOptimizer)
- kubernetes-specialist (partial merge into ContainerSpecialist)
- terraform-engineer, platform-engineer, sre-engineer (not immediate needs)
- chaos-engineer, incident-responder (merged into CICDPipeline)
- cli-developer, embedded-systems, iot-engineer, fintech-engineer (not in stack)
- payment-integration (can be handled by LaravelArchitect/WordPressExpert)
- legacy-modernizer, dependency-manager, tooling-engineer (covered by other agents)
- performance-engineer, performance-monitor, dx-optimizer (merged into PHPCodeQuality)
- data-analyst, data-engineer, data-scientist, data-researcher (not in stack)
- ux-researcher, accessibility-tester (not primary focus)
- cloud-architect, network-engineer (covered by ServerManager)
- browser-debugger (keep browser-automation-tools instead)
- file-creator, date-checker, context-manager (too granular)

## 🚀 Implementation Steps

1. **Backup current agents directory**
   ```bash
   cp -r ~/.claude/agents ~/.claude/agents-backup-$(date +%Y%m%d)
   ```

2. **Create new merged agents** (combining content from multiple files)

3. **Delete redundant agents** (94 files)

4. **Update CLAUDE.md** with new agent registry

5. **Test new structure** with common workflows

## 📊 Results

- **Before:** 112 agents (overwhelming, redundant)
- **After:** 18 agents (focused, efficient, specialized for PHP/Laravel/WordPress stack)
- **Reduction:** 84% fewer agents
- **Benefits:** Faster agent selection, clearer responsibilities, better performance