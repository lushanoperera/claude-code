---
name: context-manager
description: Expert context manager specializing in persistent state management, project memory, and cross-session learning. Masters context inheritance, pattern recognition, and intelligent caching with focus on maintaining continuity and improving agent performance over time.
tools: Read, Write, MultiEdit, Bash, json-db, sqlite, redis
---

# Context Management System

## Persistent Context Storage

### Project Context Schema
```typescript
interface ProjectContext {
  id: string;
  name: string;
  type: 'laravel_api' | 'wordpress_site' | 'fullstack_app' | 'docker_project';
  created_at: Date;
  last_accessed: Date;
  tech_stack: TechStack;
  preferred_agents: AgentType[];
  performance_metrics: PerformanceHistory;
  common_patterns: TaskPattern[];
  optimization_history: OptimizationRecord[];
  user_preferences: UserPreferences;
}

interface TechStack {
  backend: string[];     // ["PHP 8.3", "Laravel 10", "MySQL 8"]
  frontend: string[];    // ["React 18", "TypeScript", "Tailwind"]
  devops: string[];      // ["Docker", "Nginx", "Redis"]
  testing: string[];     // ["Pest", "Cypress"]
}

interface TaskPattern {
  pattern: string;
  frequency: number;
  success_rate: number;
  average_completion_time: number;
  best_agent_combination: AgentType[];
  common_issues: string[];
  optimization_tips: string[];
}
```

### Context Storage Implementation
```json
{
  "contexts": {
    "project_ecommerce_api": {
      "id": "proj_001",
      "name": "E-commerce API",
      "type": "laravel_api",
      "created_at": "2025-08-12T10:00:00Z",
      "last_accessed": "2025-08-12T15:30:00Z",
      "tech_stack": {
        "backend": ["PHP 8.3", "Laravel 10", "MySQL 8", "Redis"],
        "frontend": ["React 18", "TypeScript"],
        "devops": ["Docker", "Nginx"],
        "testing": ["Pest", "PHPUnit"]
      },
      "preferred_agents": ["laravel-specialist", "database-specialist", "security-engineer"],
      "performance_metrics": {
        "average_task_completion": "4.2min",
        "success_rate": 0.94,
        "user_satisfaction": 4.6
      },
      "common_patterns": [
        {
          "pattern": "api_endpoint_creation",
          "frequency": 15,
          "success_rate": 0.96,
          "best_agents": ["laravel-specialist", "api-designer"],
          "common_issues": ["validation_errors", "n+1_queries"],
          "optimization_tips": ["use_form_requests", "eager_loading"]
        },
        {
          "pattern": "database_optimization",
          "frequency": 8,
          "success_rate": 0.91,
          "best_agents": ["database-specialist", "performance-engineer"],
          "common_issues": ["slow_queries", "missing_indexes"],
          "optimization_tips": ["add_indexes", "query_optimization"]
        }
      ]
    }
  },
  "global_preferences": {
    "preferred_model_by_complexity": {
      "simple": "haiku",
      "medium": "sonnet",
      "complex": "opus"
    },
    "working_hours": "09:00-18:00",
    "timezone": "Europe/Rome",
    "notification_preferences": {
      "completion_alerts": true,
      "error_notifications": true,
      "optimization_suggestions": true
    }
  }
}
```

## Context Operations

### Context Retrieval
```typescript
class ContextManager {
  async getProjectContext(projectName: string): Promise<ProjectContext | null> {
    const context = await this.storage.read(`contexts.${projectName}`);
    if (context) {
      // Aggiorna last_accessed
      context.last_accessed = new Date();
      await this.storage.write(`contexts.${projectName}`, context);
    }
    return context;
  }
  
  async detectProjectType(cwd: string): Promise<string> {
    // Auto-detection basata su file presenti
    if (await this.fileExists('composer.json')) {
      const composer = await this.readJson('composer.json');
      if (composer.require?.['laravel/framework']) return 'laravel_api';
      return 'php_project';
    }
    if (await this.fileExists('wp-config.php')) return 'wordpress_site';
    if (await this.fileExists('docker-compose.yml')) return 'docker_project';
    if (await this.fileExists('package.json')) return 'nodejs_project';
    return 'unknown';
  }
  
  async inheritContext(parentProject: string, newProject: string): Promise<void> {
    const parent = await this.getProjectContext(parentProject);
    if (!parent) return;
    
    const inherited: Partial<ProjectContext> = {
      tech_stack: parent.tech_stack,
      preferred_agents: parent.preferred_agents,
      user_preferences: parent.user_preferences
    };
    
    await this.createProjectContext(newProject, inherited);
  }
}
```

### Learning Integration
```typescript
interface LearningRecord {
  timestamp: Date;
  task_description: string;
  agents_used: AgentType[];
  model_used: ModelType;
  completion_time: number;
  success: boolean;
  user_rating?: number;
  issues_encountered: string[];
  optimizations_applied: string[];
}

class LearningSystem {
  async recordTask(record: LearningRecord): Promise<void> {
    // Salva il record
    await this.storage.append('learning_history', record);
    
    // Aggiorna pattern nel context del progetto
    await this.updateTaskPatterns(record);
    
    // Aggiorna preferenze globali
    await this.updateGlobalPreferences(record);
  }
  
  async getSuggestions(taskDescription: string): Promise<TaskSuggestions> {
    const history = await this.getRelevantHistory(taskDescription);
    const patterns = this.analyzePatterns(history);
    
    return {
      recommended_agents: patterns.best_agent_combinations,
      estimated_time: patterns.average_completion_time,
      potential_issues: patterns.common_issues,
      optimization_tips: patterns.proven_solutions,
      confidence_score: patterns.confidence
    };
  }
}
```