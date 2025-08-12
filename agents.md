# Claude Code - Available Agents Catalog

## 🎯 Agent Categories and Capabilities

### Backend Development Agents

#### `laravel-specialist`
- **Expertise**: Laravel 10+ with modern PHP practices
- **Tools**: artisan, composer, pest, redis, mysql, docker, git
- **Use Cases**: 
  - Laravel API development
  - Eloquent ORM optimization
  - Queue and job processing
  - Authentication systems

#### `php-pro`
- **Expertise**: Modern PHP 8.3+ with strong typing
- **Tools**: php, composer, phpunit, phpstan, php-cs-fixer, psalm
- **Use Cases**:
  - PHP optimization
  - Framework-agnostic development
  - Performance tuning

#### `backend-typescript-architect`
- **Expertise**: Backend TypeScript with Bun runtime
- **Tools**: Full access to all tools
- **Use Cases**:
  - TypeScript backend APIs
  - Server architecture
  - Database integration

#### `python-backend-engineer`
- **Expertise**: Python backend with modern tooling (uv)
- **Tools**: Full access to all tools
- **Use Cases**:
  - FastAPI/Django development
  - Microservices
  - Data processing pipelines

### Frontend Development Agents

#### `ui-engineer`
- **Expertise**: Frontend code, UI components, user interfaces
- **Tools**: Full access to all tools
- **Use Cases**:
  - React/Vue/Angular components
  - Responsive design
  - UI/UX implementation

#### `react-specialist`
- **Expertise**: React 18+ with modern patterns
- **Tools**: vite, webpack, jest, cypress, storybook, react-devtools
- **Use Cases**:
  - React applications
  - Server components
  - Performance optimization

#### `nextjs-developer`
- **Expertise**: Next.js 14+ with App Router
- **Tools**: next, vercel, turbo, prisma, playwright
- **Use Cases**:
  - Full-stack Next.js apps
  - SSR/SSG optimization
  - API routes

#### `vue-expert`
- **Expertise**: Vue 3 with Composition API
- **Tools**: vite, vue-cli, vitest, cypress, vue-devtools
- **Use Cases**:
  - Vue applications
  - Nuxt 3 development
  - Reactive systems

### Full Stack Agents

#### `fullstack-developer`
- **Expertise**: End-to-end feature development
- **Tools**: Docker, database, redis, postgresql, magic, playwright
- **Use Cases**:
  - Complete feature implementation
  - Database to UI development
  - Integration projects

#### `wordpress-expert`
- **Expertise**: WordPress development and customization
- **Tools**: Full access to all tools
- **Use Cases**:
  - Custom themes
  - Plugin development
  - Page builder customization (Bricks, Elementor, Divi)

### Database & Data Agents

#### `database-specialist`
- **Expertise**: MySQL, PostgreSQL, NoSQL
- **Tools**: mysql, psql, redis-cli, mongodb, performance-analyzer
- **Use Cases**:
  - Schema design
  - Query optimization
  - Performance tuning

#### `sql-pro`
- **Expertise**: Complex SQL across multiple systems
- **Tools**: psql, mysql, sqlite3, sqlplus, explain, analyze
- **Use Cases**:
  - Advanced queries
  - Data warehousing
  - Index optimization

#### `postgres-pro`
- **Expertise**: PostgreSQL administration
- **Tools**: psql, pg_dump, pgbench, pg_stat_statements, pgbadger
- **Use Cases**:
  - PostgreSQL optimization
  - High availability setup
  - Database maintenance

### DevOps & Infrastructure Agents

#### `devops-engineer`
- **Expertise**: CI/CD, containerization, cloud platforms
- **Tools**: docker, kubernetes, terraform, ansible, prometheus, jenkins
- **Use Cases**:
  - Pipeline setup
  - Infrastructure automation
  - Monitoring implementation

#### `docker-specialist`
- **Expertise**: Docker containerization
- **Tools**: docker, docker-compose, dockerfile, kubernetes, nginx
- **Use Cases**:
  - Container optimization
  - Multi-stage builds
  - Orchestration

#### `kubernetes-specialist`
- **Expertise**: Kubernetes orchestration
- **Tools**: kubectl, helm, kustomize, kubeadm, k9s, stern
- **Use Cases**:
  - Cluster management
  - Deployment strategies
  - Service mesh

#### `terraform-engineer`
- **Expertise**: Infrastructure as Code
- **Tools**: terraform, terragrunt, tflint, terraform-docs, checkov
- **Use Cases**:
  - Multi-cloud provisioning
  - Module development
  - State management

### Security Agents

#### `security-engineer`
- **Expertise**: DevSecOps and cloud security
- **Tools**: nmap, metasploit, burp, vault, trivy, falco
- **Use Cases**:
  - Security automation
  - Vulnerability management
  - Zero-trust architecture

#### `security-auditor`
- **Expertise**: Security assessments
- **Tools**: nessus, qualys, openvas, prowler, scout
- **Use Cases**:
  - Compliance validation
  - Risk assessment
  - Audit reporting

#### `penetration-tester`
- **Expertise**: Ethical hacking
- **Tools**: nmap, metasploit, burpsuite, sqlmap, wireshark
- **Use Cases**:
  - Security testing
  - Vulnerability discovery
  - Exploit validation

### Quality & Testing Agents

#### `qa-expert`
- **Expertise**: Comprehensive quality assurance
- **Tools**: selenium, cypress, playwright, postman, jira
- **Use Cases**:
  - Test strategy
  - Manual testing
  - Quality metrics

#### `test-automator`
- **Expertise**: Test automation frameworks
- **Tools**: selenium, cypress, playwright, pytest, jest
- **Use Cases**:
  - Automated test suites
  - CI/CD integration
  - Performance testing

#### `senior-code-reviewer`
- **Expertise**: Code review and best practices
- **Tools**: Full access to all tools
- **Use Cases**:
  - Architecture review
  - Security analysis
  - Performance review

### AI & Machine Learning Agents

#### `ai-engineer`
- **Expertise**: AI system design and deployment
- **Tools**: python, jupyter, tensorflow, pytorch, huggingface
- **Use Cases**:
  - Model implementation
  - AI pipeline setup
  - Production deployment

#### `llm-architect`
- **Expertise**: Large Language Model systems
- **Tools**: transformers, langchain, llamaindex, vllm, wandb
- **Use Cases**:
  - LLM deployment
  - Fine-tuning
  - Prompt engineering

#### `prompt-engineer`
- **Expertise**: Prompt optimization
- **Tools**: openai, anthropic, langchain, promptflow, jupyter
- **Use Cases**:
  - Prompt design
  - Evaluation frameworks
  - Production systems

### Specialized Agents

#### `context7`
- **Integration**: MCP service for real-time documentation
- **Endpoint**: https://mcp.context7.com/mcp
- **Functions**:
  - `resolve-library-id`: Find library IDs
  - `get-library-docs`: Fetch documentation

#### `git-workflow`
- **Expertise**: Git operations and workflows
- **Tools**: Bash, Read, Grep
- **Use Cases**:
  - Branch management
  - Commit creation
  - PR management

#### `file-creator`
- **Expertise**: File and directory creation
- **Tools**: Write, Bash, Read
- **Use Cases**:
  - Batch file creation
  - Template application
  - Project structure setup

#### `test-runner`
- **Expertise**: Test execution and analysis
- **Tools**: Bash, Read, Grep, Glob
- **Use Cases**:
  - Run test suites
  - Analyze failures
  - Continuous testing

## 🔧 Agent Selection Strategy

### By Task Complexity

**Simple Tasks (1-3 operations)**
- Single specialist agent
- Model: Haiku or base Sonnet

**Medium Tasks (4-7 operations)**
- Primary agent + 1-2 supporting agents
- Model: Sonnet

**Complex Tasks (8+ operations)**
- Multi-agent orchestration
- Model: Sonnet+ or Opus

### By Domain

**Backend API Development**
```yaml
Primary: [laravel-specialist, php-pro, backend-typescript-architect]
Support: [database-specialist, security-engineer]
```

**Frontend Development**
```yaml
Primary: [ui-engineer, react-specialist, vue-expert]
Support: [fullstack-developer, performance-engineer]
```

**Full Stack Features**
```yaml
Primary: [fullstack-developer]
Support: [backend + frontend specialists]
```

**DevOps & Deployment**
```yaml
Primary: [devops-engineer, docker-specialist]
Support: [security-engineer, terraform-engineer]
```

## 📊 Agent Orchestration Patterns

### Sequential Pattern
```
Agent A → Agent B → Agent C
```
Use when: Tasks have strict dependencies

### Parallel Pattern
```
     ┌→ Agent A
Main ├→ Agent B
     └→ Agent C
```
Use when: Tasks are independent

### Pipeline Pattern
```
Agent A → Transform → Agent B → Validate → Agent C
```
Use when: Data flows through processing stages

### Hub Pattern
```
       Agent B
          ↑
Agent A ← Hub → Agent C
          ↓
       Agent D
```
Use when: Central coordination needed

## 🚀 Quick Agent Commands

```bash
# Direct agent invocation
/agent laravel            # Laravel development
/agent security           # Security analysis
/agent fullstack         # Full stack development

# Multi-agent orchestration
/orchestrate complex      # Complex task orchestration
/collaborate [agents]     # Multi-agent collaboration

# Specialized workflows
/review code             # Code review
/test run               # Run tests
/deploy prepare         # Deployment preparation
```