# Claude Code Configuration - Multi-Model Intelligence

## 🙏 Acknowledgments and Sources

This configuration builds upon excellent open-source work:

### Core Infrastructure
- **[Agent OS](https://github.com/buildermethods/agent-os)** - Orchestration patterns and multi-agent coordination
- **[Awesome Claude Code Agents](https://github.com/hesreallyhim/awesome-claude-code-agents)** - Agent collection and specializations
- **[Agents Repository](https://github.com/wshobson/agents)** - Agent definitions and patterns
- **[Anthropic Claude Code](https://docs.anthropic.com/claude-code)** - Platform and best practices

### MCP Integrations
- **[Context7](https://context7.com)** - MCP integration for real-time documentation
- **[Gemini-CLI MCP](https://github.com/gemini-cli/mcp-tools)** - Cross-model intelligence with Gemini-2.5-Pro
  - Alternative AI perspective for validation and creativity
  - Multi-model brainstorming and ideation
  - Cross-validated planning and code review
  - Performance analysis and optimization insights
- **[Playwright MCP](https://github.com/microsoft/playwright-mcp)** - Browser automation and E2E testing via MCP
  - Enables natural language browser control
  - Accessibility tree-based testing (no screenshots needed)
  - Multi-browser support (Chromium, Firefox, WebKit)
  - Seamless integration with Claude Code for testing automation

### Testing & Automation
- **[Playwright](https://playwright.dev)** by Microsoft - Modern web testing framework
  - Cross-browser testing automation
  - Visual regression testing capabilities
  - Performance monitoring and web vitals
  - Mobile and responsive testing support

### Our Innovations
- **Cross-Model Intelligence**: OPUS 4.1 + GEMINI-2.5-PRO planning validation
- **Enhanced Agent Orchestration**: Dynamic specialist selection and coordination
- **Three-Phase Development**: Planning → Implementation → Validation
- **Multi-Model Validation**: Quality assurance through model diversity
- **Automated Agent Selection**: Smart assignment based on domain expertise
- **Context7, Gemini-CLI, and Playwright MCP** seamless integration
- **Cost-Optimized Strategy**: Right model for the right task

## 📚 Documentation

- [Setup Guide](SETUP-GUIDE.md) - Complete setup instructions
- [Playwright Setup](mcp-playwright-setup.md) - Playwright MCP integration guide
- [Daily Commands](playwright-daily-commands.md) - Quick reference for testing
- [Testing Workflows](workflows/playwright-testing.md) - Complete testing templates

## 🚀 Quick Start

1. **Install Claude Code**: Follow official documentation
2. **Setup MCP Servers**: Configure Context7 and Playwright MCP
3. **Run Setup Script**: `~/.claude/setup-sync.sh`
4. **Verify Playwright**: `~/.claude/test-playwright-integration.sh`
5. **Start Testing**: Use natural language commands for browser automation

## 🤖 Agent Registry (19 Specialized Agents)

### Core Development (5)
- **PHPMaster** - PHP 8.3+, PSR standards, modern patterns
- **FrontendDeveloper** - React, Vue, Angular, Next.js, TypeScript
- **BackendDeveloper** - PHP/Laravel, Node.js, Python APIs
- **laravel-specialist** - Laravel 11 deep expertise
- **wordpress-expert** - WordPress core, plugins, themes

### Infrastructure & DevOps (3)
- **ContainerSpecialist** - Docker, Kubernetes, Laravel Sail
- **ServerManager** - Linux, Nginx/Apache, PHP-FPM, SSL
- **CICDPipeline** - GitHub Actions, Laravel Envoy, deployments

### Quality & Security (3)
- **PHPCodeQuality** - PHPStan, Psalm, Laravel Pint
- **TestingSpecialist** - Pest, PHPUnit, Playwright, Cypress
- **SecurityGuard** - OWASP, Laravel security, WordPress hardening

### Architecture & Support (8)
- **APIArchitect** - REST, GraphQL, OpenAPI
- **DatabaseOptimizer** - MySQL, PostgreSQL, Redis
- **DocumentationWriter** - Technical docs, README files
- **WorkflowCoordinator** - Multi-agent orchestration
- **debugger**, **git-workflow**, **browser-automation-tools**, **context-fetcher**

## 💡 Key Features

### 🤖 Multi-Model Intelligence
- **Cross-Model Planning**: OPUS 4.1 creates plans, GEMINI-2.5-PRO validates
- **Alternative Perspectives**: Gemini consultation for creative solutions
- **Multi-Model Validation**: Code review and optimization through model diversity
- **Intelligent Brainstorming**: Combined AI creativity for complex challenges

### 🎯 Streamlined Agent System (19 Specialized Agents)
- **Optimized from 112 to 19 agents** (-83%): Focused, efficient, no redundancy
- **Full MCP Integration**: All agents have access to Gemini, Playwright, Context7, Memory Bank, Knowledge Graph, Asana
- **Clear Separation**: Dedicated FrontendDeveloper and BackendDeveloper agents
- **PHP/Laravel/WordPress Focus**: Specialized agents for your tech stack
- **Dynamic Selection**: Automatic agent assignment based on task analysis
- **Three-Phase Strategy**: Planning → Agent Implementation → Cross-Validation

### 🔧 Advanced Integrations
- **Browser Automation**: Natural language testing with Playwright MCP
- **Real-time Documentation**: Always up-to-date with Context7
- **Cross-Model Consultation**: Gemini-2.5-Pro for alternative insights
- **Automated Workflows**: Pre-built templates for complex multi-step tasks

## 🔄 Version History

- **v5.0** (2025-08-21): **Agent System Refactoring** - Streamlined from 112 to 19 specialized agents
  - 🎯 83% reduction in agents while maintaining full functionality
  - 🔧 Full MCP integration for all agents (Gemini, Playwright, Context7, Memory Bank, Knowledge Graph, Asana)
  - 📦 Split fullstack into dedicated FrontendDeveloper and BackendDeveloper agents
  - 🚀 New ServerManager agent for self-hosting capabilities
  - 💻 Optimized for PHP/Laravel/WordPress + Modern JS frameworks (React, Vue, Angular, Next.js)
- **v4.0** (2025-08-18): **Multi-Model Intelligence** - Gemini-2.5-Pro integration and enhanced orchestration
  - ✨ Cross-model planning validation (OPUS + GEMINI)
  - 🎯 Enhanced agent orchestration with dynamic selection
  - 🤖 Three-phase development strategy
  - 🔗 Gemini-CLI MCP integration for alternative AI perspectives
  - 🚀 Multi-model validation and quality assurance
- **v3.2** (2025-08-13): Added Playwright MCP integration for browser automation
- **v3.1** (2025-08-12): Opus 4.1 planning with cost-optimized implementation
- **v3.0** (2025-08-11): Two-phase development approach
- **v2.0** (2025-08-10): Multi-agent orchestration system
- **v1.0** (2025-08-09): Initial configuration release

## 📝 License

This configuration is provided as-is for the Claude Code community. Individual components maintain their respective licenses.

## 🤝 Contributing

Contributions are welcome! Please submit issues and pull requests to help improve this configuration.

---

**Maintained by**: Claude Code Community
**Repository**: [claude-code-config](https://github.com/lushanoperera/claude-code.git)
**Last Updated**: 2025-08-21