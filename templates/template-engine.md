---
name: template-engine
description: Dynamic template engine that learns from user patterns and automatically generates optimized workflows, agent orchestrations, and task templates based on historical success patterns and project contexts.
tools: Read, Write, MultiEdit, Bash, template-generator, pattern-matcher, workflow-builder
---

# Dynamic Template Engine

## Adaptive Template Generation

### Template Structure
```typescript
interface DynamicTemplate {
  id: string;
  name: string;
  description: string;
  triggers: TemplateTrigger[];
  complexity_score: number;
  required_agents: AgentType[];
  optional_agents: AgentType[];
  workflow_steps: WorkflowStep[];
  success_metrics: SuccessMetric[];
  customization_points: CustomizationPoint[];
  learning_data: TemplateLearningData;
}

interface TemplateTrigger {
  type: 'keyword' | 'pattern' | 'context' | 'project_type';
  condition: string | RegExp;
  weight: number;
  confidence_threshold: number;
}

interface WorkflowStep {
  id: string;
  name: string;
  agent: AgentType;
  dependencies: string[];
  estimated_duration: number;
  success_criteria: string[];
  fallback_actions: FallbackAction[];
  customizable: boolean;
}
```

### Smart Template Matching
```typescript
class TemplateMatcher {
  async findBestTemplate(
    userRequest: string,
    projectContext: ProjectContext
  ): Promise<TemplateMatch> {
    const candidates = await this.getAllTemplates();
    const matches = [];
    
    for (const template of candidates) {
      const score = await this.calculateMatchScore(
        userRequest, 
        projectContext, 
        template
      );
      
      if (score.confidence > 0.6) {
        matches.push({ template, score });
      }
    }
    
    // Ordina per confidence e success rate storico
    return matches
      .sort((a, b) => this.compareTemplates(a, b))
      .slice(0, 3); // Top 3 matches
  }
  
  private async calculateMatchScore(
    request: string,
    context: ProjectContext,
    template: DynamicTemplate
  ): Promise<MatchScore> {
    let totalScore = 0;
    let weights = 0;
    
    // Analisi keyword e pattern
    for (const trigger of template.triggers) {
      const triggerScore = this.evaluateTrigger(request, trigger);
      totalScore += triggerScore * trigger.weight;
      weights += trigger.weight;
    }
    
    // Bonus per contesto del progetto
    const contextBonus = this.calculateContextBonus(context, template);
    totalScore += contextBonus * 0.2;
    weights += 0.2;
    
    // Bonus per successi storici
    const historyBonus = this.calculateHistoryBonus(context, template);
    totalScore += historyBonus * 0.15;
    weights += 0.15;
    
    const confidence = totalScore / weights;
    
    return {
      confidence,
      explanation: this.generateExplanation(template, confidence),
      customization_suggestions: this.suggestCustomizations(context, template)
    };
  }
}
```

## Built-in Template Library

### Laravel API Development Template
```json
{
  "id": "laravel_api_comprehensive",
  "name": "Laravel API Development Complete",
  "description": "End-to-end Laravel API development with testing and optimization",
  "triggers": [
    {
      "type": "keyword",
      "condition": "laravel.*api|api.*laravel|rest.*api.*laravel",
      "weight": 1.0,
      "confidence_threshold": 0.7
    },
    {
      "type": "pattern",
      "condition": "endpoint|route|controller|resource",
      "weight": 0.8,
      "confidence_threshold": 0.6
    },
    {
      "type": "context",
      "condition": "laravel_api",
      "weight": 1.2,
      "confidence_threshold": 0.8
    }
  ],
  "complexity_score": 6,
  "required_agents": ["laravel-specialist", "api-designer"],
  "optional_agents": ["database-specialist", "security-engineer", "test-automator"],
  "workflow_steps": [
    {
      "id": "requirements_analysis",
      "name": "Analyze API Requirements",
      "agent": "laravel-specialist",
      "dependencies": [],
      "estimated_duration": 300,
      "success_criteria": [
        "Clear endpoint specifications",
        "Database requirements identified",
        "Authentication strategy defined"
      ],
      "customizable": true
    },
    {
      "id": "database_design",
      "name": "Design Database Schema",
      "agent": "database-specialist",
      "dependencies": ["requirements_analysis"],
      "estimated_duration": 450,
      "success_criteria": [
        "Optimized schema created",
        "Relationships properly defined",
        "Indexes planned"
      ],
      "customizable": true
    },
    {
      "id": "api_implementation",
      "name": "Implement API Endpoints",
      "agent": "laravel-specialist",
      "dependencies": ["database_design"],
      "estimated_duration": 900,
      "success_criteria": [
        "All endpoints functional",
        "Proper validation implemented",
        "Error handling complete"
      ],
      "customizable": false
    },
    {
      "id": "security_review",
      "name": "Security Assessment",
      "agent": "security-engineer",
      "dependencies": ["api_implementation"],
      "estimated_duration": 300,
      "success_criteria": [
        "No security vulnerabilities",
        "Proper authentication",
        "Input validation secure"
      ],
      "customizable": true
    },
    {
      "id": "testing_implementation",
      "name": "Implement Tests",
      "agent": "test-automator",
      "dependencies": ["api_implementation"],
      "estimated_duration": 600,
      "success_criteria": [
        "Unit tests > 80% coverage",
        "Feature tests complete",
        "All tests passing"
      ],
      "customizable": true
    }
  ],
  "success_metrics": [
    {
      "name": "completion_time",
      "target": 2700,
      "tolerance": 0.2
    },
    {
      "name": "test_coverage",
      "target": 0.85,
      "tolerance": 0.1
    },
    {
      "name": "security_score",
      "target": 0.95,
      "tolerance": 0.05
    }
  ],
  "customization_points": [
    {
      "step_id": "database_design",
      "parameter": "database_type",
      "options": ["mysql", "postgresql", "sqlite"],
      "default": "mysql"
    },
    {
      "step_id": "security_review",
      "parameter": "auth_method",
      "options": ["jwt", "sanctum", "passport"],
      "default": "sanctum"
    }
  ],
  "learning_data": {
    "usage_count": 0,
    "success_rate": 0.0,
    "average_satisfaction": 0.0,
    "common_customizations": [],
    "improvement_suggestions": []
  }
}
```

### WordPress Optimization Template
```json
{
  "id": "wordpress_performance_optimization",
  "name": "WordPress Performance Optimization",
  "description": "Complete WordPress site performance optimization",
  "triggers": [
    {
      "type": "keyword",
      "condition": "wordpress.*slow|optimize.*wordpress|performance.*wordpress",
      "weight": 1.0,
      "confidence_threshold": 0.8
    },
    {
      "type": "context",
      "condition": "wordpress_site",
      "weight": 1.1,
      "confidence_threshold": 0.7
    }
  ],
  "complexity_score": 5,
  "required_agents": ["wordpress-expert", "performance-engineer"],
  "optional_agents": ["database-specialist", "ui-engineer"],
  "workflow_steps": [
    {
      "id": "performance_audit",
      "name": "Conduct Performance Audit",
      "agent": "performance-engineer",
      "dependencies": [],
      "estimated_duration": 600,
      "success_criteria": [
        "Performance bottlenecks identified",
        "Core Web Vitals measured",
        "Optimization priorities set"
      ],
      "customizable": false
    },
    {
      "id": "database_optimization",
      "name": "Optimize Database",
      "agent": "database-specialist",
      "dependencies": ["performance_audit"],
      "estimated_duration": 450,
      "success_criteria": [
        "Database queries optimized",
        "Unused data cleaned",
        "Indexes optimized"
      ],
      "customizable": true
    },
    {
      "id": "theme_optimization",
      "name": "Optimize Theme & Code",
      "agent": "wordpress-expert",
      "dependencies": ["performance_audit"],
      "estimated_duration": 900,
      "success_criteria": [
        "Code optimized for performance",
        "Assets minified and compressed",
        "Caching implemented"
      ],
      "customizable": true
    },
    {
      "id": "final_testing",
      "name": "Performance Testing",
      "agent": "performance-engineer",
      "dependencies": ["database_optimization", "theme_optimization"],
      "estimated_duration": 300,
      "success_criteria": [
        "Performance targets met",
        "Core Web Vitals improved",
        "Load testing passed"
      ],
      "customizable": false
    }
  ]
}
```

## Template Learning & Evolution

```typescript
class TemplateLearner {
  async recordTemplateExecution(
    templateId: string,
    execution: TemplateExecution
  ): Promise<void> {
    const template = await this.getTemplate(templateId);
    
    // Update usage statistics
    template.learning_data.usage_count++;
    template.learning_data.success_rate = this.updateSuccessRate(
      template.learning_data.success_rate,
      template.learning_data.usage_count,
      execution.success
    );
    
    if (execution.user_satisfaction) {
      template.learning_data.average_satisfaction = this.updateAverage(
        template.learning_data.average_satisfaction,
        template.learning_data.usage_count,
        execution.user_satisfaction
      );
    }
    
    // Learn from customizations
    if (execution.customizations.length > 0) {
      this.updateCustomizationLearning(template, execution.customizations);
    }
    
    // Learn from performance
    this.updatePerformanceLearning(template, execution);
    
    await this.saveTemplate(template);
    
    // Generate improvements if we have enough data
    if (template.learning_data.usage_count % 10 === 0) {
      await this.generateTemplateImprovements(template);
    }
  }
  
  private async generateTemplateImprovements(
    template: DynamicTemplate
  ): Promise<void> {
    const improvements = [];
    
    // Analyze step performance
    const stepAnalysis = this.analyzeStepPerformance(template);
    if (stepAnalysis.bottleneck_steps.length > 0) {
      improvements.push({
        type: 'workflow_optimization',
        description: 'Optimize bottleneck steps',
        steps: stepAnalysis.bottleneck_steps,
        potential_improvement: stepAnalysis.time_savings
      });
    }
    
    // Analyze agent effectiveness
    const agentAnalysis = this.analyzeAgentEffectiveness(template);
    if (agentAnalysis.suggested_changes.length > 0) {
      improvements.push({
        type: 'agent_optimization',
        description: 'Improve agent selection',
        changes: agentAnalysis.suggested_changes
      });
    }
    
    // Analyze customization patterns
    const customizationAnalysis = this.analyzeCustomizationPatterns(template);
    if (customizationAnalysis.new_defaults.length > 0) {
      improvements.push({
        type: 'default_optimization',
        description: 'Update default values',
        changes: customizationAnalysis.new_defaults
      });
    }
    
    template.learning_data.improvement_suggestions = improvements;
  }
}
```

## Auto-Generated Templates

```typescript
class AutoTemplateGenerator {
  async generateFromHistory(
    projectContext: ProjectContext,
    taskHistory: TaskHistory[]
  ): Promise<DynamicTemplate[]> {
    // Identifica pattern ricorrenti
    const patterns = this.identifyRecurringPatterns(taskHistory);
    const templates = [];
    
    for (const pattern of patterns) {
      if (pattern.frequency >= 3 && pattern.success_rate >= 0.8) {
        const template = await this.createTemplateFromPattern(pattern, projectContext);
        templates.push(template);
      }
    }
    
    return templates;
  }
  
  private async createTemplateFromPattern(
    pattern: TaskPattern,
    context: ProjectContext
  ): Promise<DynamicTemplate> {
    return {
      id: `auto_${pattern.pattern_id}`,
      name: `Auto: ${pattern.name}`,
      description: `Template generato automaticamente per: ${pattern.description}`,
      triggers: this.generateTriggersFromPattern(pattern),
      complexity_score: pattern.average_complexity,
      required_agents: pattern.most_successful_agents.slice(0, 2),
      optional_agents: pattern.most_successful_agents.slice(2),
      workflow_steps: await this.generateWorkflowFromPattern(pattern),
      success_metrics: this.generateMetricsFromHistory(pattern),
      customization_points: this.identifyCustomizationPoints(pattern),
      learning_data: {
        usage_count: pattern.frequency,
        success_rate: pattern.success_rate,
        average_satisfaction: pattern.average_satisfaction,
        common_customizations: pattern.common_customizations,
        improvement_suggestions: []
      }
    };
  }
}
```