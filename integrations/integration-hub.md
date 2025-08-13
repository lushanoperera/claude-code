---
name: integration-hub
description: Comprehensive integration hub connecting Claude Code with external development tools, services, and platforms. Manages seamless data flow, automated workflows, and synchronized state across your development ecosystem.
tools: Read, Write, MultiEdit, Bash, api-client, webhook-handler, sync-manager, notification-service
---

# Integration Hub System

## Core Integration Framework

### Integration Registry
```typescript
interface IntegrationConfig {
  id: string;
  name: string;
  type: IntegrationType;
  status: 'active' | 'inactive' | 'error' | 'configuring';
  config: Record<string, any>;
  capabilities: IntegrationCapability[];
  webhooks: WebhookConfig[];
  sync_settings: SyncSettings;
  auth: AuthConfig;
  last_sync: Date;
  health_check: HealthCheckConfig;
}

type IntegrationType = 
  | 'version_control'    // Git, GitHub, GitLab
  | 'ci_cd'             // GitHub Actions, GitLab CI, Jenkins
  | 'project_management' // Jira, Linear, Asana
  | 'monitoring'        // DataDog, New Relic, Sentry
  | 'deployment'        // Vercel, Netlify, Docker Hub
  | 'database'          // PlanetScale, Supabase, Railway
  | 'communication'     // Slack, Discord, Teams
  | 'documentation'     // Notion, Confluence, GitBook;

interface IntegrationCapability {
  action: string;
  description: string;
  required_permissions: string[];
  rate_limits?: RateLimit;
  supports_realtime: boolean;
}
```

### GitHub Integration
```typescript
class GitHubIntegration {
  private client: Octokit;
  private config: GitHubConfig;
  
  constructor(config: GitHubConfig) {
    this.config = config;
    this.client = new Octokit({
      auth: config.token,
      baseUrl: config.api_url || 'https://api.github.com'
    });
  }
  
  async syncProjectContext(repo: string): Promise<ProjectContext> {
    const repoData = await this.client.rest.repos.get({
      owner: this.config.owner,
      repo: repo
    });
    
    const languages = await this.client.rest.repos.listLanguages({
      owner: this.config.owner,
      repo: repo
    });
    
    const packageFiles = await this.detectPackageFiles(repo);
    const techStack = this.analyzeTechStack(languages.data, packageFiles);
    
    return {
      id: `github_${repo}`,
      name: repoData.data.name,
      type: this.detectProjectType(techStack),
      tech_stack: techStack,
      repository: {
        url: repoData.data.html_url,
        default_branch: repoData.data.default_branch,
        last_push: new Date(repoData.data.pushed_at)
      },
      team_context: await this.getTeamContext(repo),
      recent_activity: await this.getRecentActivity(repo)
    };
  }
  
  async createTaskBranch(repo: string, taskDescription: string): Promise<string> {
    const branchName = this.generateBranchName(taskDescription);
    const defaultBranch = await this.getDefaultBranch(repo);
    const latestCommit = await this.getLatestCommit(repo, defaultBranch);
    
    await this.client.rest.git.createRef({
      owner: this.config.owner,
      repo: repo,
      ref: `refs/heads/${branchName}`,
      sha: latestCommit.sha
    });
    
    return branchName;
  }
  
  async createPullRequest(
    repo: string,
    branch: string,
    taskSummary: TaskSummary
  ): Promise<PullRequestResult> {
    const pr = await this.client.rest.pulls.create({
      owner: this.config.owner,
      repo: repo,
      title: this.generatePRTitle(taskSummary),
      body: this.generatePRBody(taskSummary),
      head: branch,
      base: await this.getDefaultBranch(repo)
    });
    
    // Add labels based on task type
    if (taskSummary.labels.length > 0) {
      await this.client.rest.issues.addLabels({
        owner: this.config.owner,
        repo: repo,
        issue_number: pr.data.number,
        labels: taskSummary.labels
      });
    }
    
    return {
      pr_number: pr.data.number,
      pr_url: pr.data.html_url,
      branch_name: branch
    };
  }
  
  async setupWebhooks(repo: string): Promise<void> {
    const webhookUrl = `${this.config.webhook_base_url}/github/webhook`;
    
    await this.client.rest.repos.createWebhook({
      owner: this.config.owner,
      repo: repo,
      config: {
        url: webhookUrl,
        content_type: 'json',
        secret: this.config.webhook_secret
      },
      events: [
        'push',
        'pull_request',
        'issues',
        'deployment_status',
        'check_run'
      ]
    });
  }
}
```

### Jira Integration
```typescript
class JiraIntegration {
  private client: JiraClient;
  
  async createTaskFromIssue(issueKey: string): Promise<TaskCreationResult> {
    const issue = await this.client.issues.getIssue({ issueIdOrKey: issueKey });
    
    const taskContext: TaskContext = {
      source: 'jira',
      external_id: issueKey,
      title: issue.fields.summary,
      description: issue.fields.description,
      priority: this.mapJiraPriority(issue.fields.priority.name),
      assignee: issue.fields.assignee?.displayName,
      labels: issue.fields.labels,
      project_key: issue.fields.project.key,
      issue_type: issue.fields.issuetype.name
    };
    
    // Analyze task complexity based on Jira context
    const complexity = await this.analyzeTaskComplexity(issue);
    
    // Suggest appropriate agents based on issue type and project
    const suggestedAgents = await this.suggestAgentsForIssue(issue);
    
    return {
      task_context: taskContext,
      complexity_score: complexity,
      suggested_agents: suggestedAgents,
      estimated_story_points: issue.fields.storyPoints || 0
    };
  }
  
  async updateIssueProgress(
    issueKey: string,
    progress: TaskProgress
  ): Promise<void> {
    // Update issue status
    if (progress.status_change) {
      await this.client.issues.transitionIssue({
        issueIdOrKey: issueKey,
        transition: {
          id: this.getTransitionId(progress.new_status)
        }
      });
    }
    
    // Add work log
    if (progress.time_spent) {
      await this.client.issues.addWorklog({
        issueIdOrKey: issueKey,
        timeSpent: `${Math.round(progress.time_spent / 60)}m`,
        comment: progress.work_description
      });
    }
    
    // Add progress comment
    if (progress.notes) {
      await this.client.issues.addComment({
        issueIdOrKey: issueKey,
        body: this.formatProgressComment(progress)
      });
    }
  }
}
```

### Slack Integration
```typescript
class SlackIntegration {
  private client: WebClient;
  
  async notifyTaskCompletion(
    channel: string,
    task: CompletedTask
  ): Promise<void> {
    const message = {
      channel: channel,
      blocks: [
        {
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: `✅ *Task Completed*\n${task.title}`
          }
        },
        {
          type: 'section',
          fields: [
            {
              type: 'mrkdwn',
              text: `*Duration:*\n${this.formatDuration(task.duration)}`
            },
            {
              type: 'mrkdwn',
              text: `*Quality Score:*\n${(task.quality_score * 100).toFixed(0)}%`
            },
            {
              type: 'mrkdwn',
              text: `*Agents Used:*\n${task.agents_used.join(', ')}`
            },
            {
              type: 'mrkdwn',
              text: `*Success Rate:*\n${task.success ? '100%' : '0%'}`
            }
          ]
        }
      ]
    };
    
    if (task.pull_request_url) {
      message.blocks.push({
        type: 'actions',
        elements: [
          {
            type: 'button',
            text: {
              type: 'plain_text',
              text: 'View Pull Request'
            },
            url: task.pull_request_url
          }
        ]
      });
    }
    
    await this.client.chat.postMessage(message);
  }
  
  async createTaskChannel(
    taskId: string,
    taskTitle: string,
    participants: string[]
  ): Promise<string> {
    const channelName = this.generateChannelName(taskId, taskTitle);
    
    const channel = await this.client.conversations.create({
      name: channelName,
      is_private: false
    });
    
    // Invite participants
    if (participants.length > 0) {
      await this.client.conversations.invite({
        channel: channel.channel.id,
        users: participants.join(',')
      });
    }
    
    // Send initial message
    await this.client.chat.postMessage({
      channel: channel.channel.id,
      text: `🚀 Starting task: ${taskTitle}\nTask ID: ${taskId}`
    });
    
    return channel.channel.id;
  }
}
```

## Automated Workflow Triggers

### CI/CD Integration Automation
```typescript
class CICDAutomation {
  async setupAutomatedWorkflows(
    repo: string,
    projectType: ProjectType
  ): Promise<WorkflowSetup> {
    const workflows = [];
    
    // Laravel project workflows
    if (projectType === 'laravel_api') {
      workflows.push(
        await this.createLaravelTestWorkflow(repo),
        await this.createLaravelDeployWorkflow(repo),
        await this.createSecurityScanWorkflow(repo)
      );
    }
    
    // Docker project workflows
    if (this.hasDockerSetup(repo)) {
      workflows.push(
        await this.createDockerBuildWorkflow(repo),
        await this.createContainerScanWorkflow(repo)
      );
    }
    
    // WordPress workflows
    if (projectType === 'wordpress_site') {
      workflows.push(
        await this.createWordPressTestWorkflow(repo),
        await this.createWordPressDeployWorkflow(repo)
      );
    }
    
    return {
      workflows_created: workflows,
      integration_status: 'active',
      next_steps: this.generateNextSteps(workflows)
    };
  }
  
  private async createLaravelTestWorkflow(repo: string): Promise<Workflow> {
    const workflowContent = `
name: Laravel Tests

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  laravel-tests:
    runs-on: ubuntu-latest
    
    services:
      mysql:
        image: mysql:8.0
        env:
          MYSQL_ROOT_PASSWORD: password
          MYSQL_DATABASE: testing
        ports:
          - 3306:3306
        options: --health-cmd="mysqladmin ping" --health-interval=10s --health-timeout=5s --health-retries=3
      
      redis:
        image: redis:alpine
        ports:
          - 6379:6379
        options: --health-cmd="redis-cli ping" --health-interval=10s --health-timeout=5s --health-retries=3

    steps:
    - uses: actions/checkout@v3
    
    - name: Setup PHP
      uses: shivammathur/setup-php@v2
      with:
        php-version: '8.3'
        extensions: dom, curl, libxml, mbstring, zip, pcntl, pdo, sqlite, pdo_sqlite, bcmath, soap, intl, gd, exif, iconv
        coverage: xdebug
    
    - name: Copy .env
      run: php -r "file_exists('.env') || copy('.env.example', '.env');"
    
    - name: Install Dependencies
      run: composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist
    
    - name: Generate key
      run: php artisan key:generate
    
    - name: Directory Permissions
      run: chmod -R 777 storage bootstrap/cache
    
    - name: Create Database
      run: |
        mkdir -p database
        touch database/database.sqlite
    
    - name: Execute tests (Unit and Feature tests) via Pest
      env:
        DB_CONNECTION: sqlite
        DB_DATABASE: database/database.sqlite
        CACHE_DRIVER: array
        QUEUE_CONNECTION: sync
        SESSION_DRIVER: array
      run: vendor/bin/pest --coverage
`;

    return await this.createWorkflowFile(repo, 'laravel-tests.yml', workflowContent);
  }
}
```

### Monitoring Integration
```typescript
class MonitoringIntegration {
  private integrations: Map<string, MonitoringProvider> = new Map();
  
  async setupProduction Monitoring(
    projectContext: ProjectContext
  ): Promise<MonitoringSetup> {
    const setup: MonitoringSetup = {
      providers: [],
      dashboards: [],
      alerts: [],
      health_checks: []
    };
    
    // Application Performance Monitoring
    if (this.config.datadog.enabled) {
      setup.providers.push(await this.setupDatadog(projectContext));
    }
    
    // Error Tracking
    if (this.config.sentry.enabled) {
      setup.providers.push(await this.setupSentry(projectContext));
    }
    
    // Uptime Monitoring
    if (this.config.uptime_robot.enabled) {
      setup.providers.push(await this.setupUptimeRobot(projectContext));
    }
    
    // Infrastructure Monitoring
    if (projectContext.deployment?.platform === 'docker') {
      setup.providers.push(await this.setupPrometheus(projectContext));
    }
    
    return setup;
  }
  
  async receiveAlert(alert: ExternalAlert): Promise<AlertResponse> {
    // Correlate with recent deployments
    const recentDeployments = await this.getRecentDeployments(alert.service);
    
    // Check if we have a related task in progress
    const relatedTasks = await this.findRelatedTasks(alert);
    
    // Determine if this requires immediate agent intervention
    const requiresIntervention = this.assessAlert Severity(alert);
    
    if (requiresIntervention) {
      // Trigger incident response workflow
      return await this.triggerIncidentResponse(alert, {
        related_deployments: recentDeployments,
        related_tasks: relatedTasks
      });
    }
    
    // Log for analysis
    await this.logAlert(alert);
    
    return { status: 'logged', action: 'monitor' };
  }
}
```

## Integration Dashboard & Management

```typescript
class IntegrationDashboard {
  async getIntegrationStatus(): Promise<IntegrationStatus> {
    const integrations = await this.getAllIntegrations();
    
    return {
      total_integrations: integrations.length,
      active_integrations: integrations.filter(i => i.status === 'active').length,
      health_summary: await this.getHealthSummary(integrations),
      recent_sync_activity: await this.getRecentSyncActivity(),
      data_flow_metrics: await this.getDataFlowMetrics(),
      upcoming_tasks: await this.getUpcomingIntegrationTasks()
    };
  }
  
  async syncAllIntegrations(): Promise<SyncResult[]> {
    const integrations = await this.getActiveIntegrations();
    const results: SyncResult[] = [];
    
    for (const integration of integrations) {
      try {
        const result = await this.syncIntegration(integration);
        results.push({
          integration_id: integration.id,
          status: 'success',
          records_synced: result.count,
          duration: result.duration
        });
      } catch (error) {
        results.push({
          integration_id: integration.id,
          status: 'error',
          error: error.message,
          duration: 0
        });
        
        await this.handleSyncError(integration, error);
      }
    }
    
    return results;
  }
}
```