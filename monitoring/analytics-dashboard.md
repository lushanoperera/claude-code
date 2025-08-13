---
name: analytics-dashboard
description: Advanced analytics dashboard providing real-time insights into agent performance, task patterns, user satisfaction, and optimization opportunities with focus on continuous improvement and data-driven decision making.
tools: Read, Write, MultiEdit, Bash, analytics, visualization, reporting, metrics-collector
---

# Analytics Dashboard System

## Performance Metrics Collection

### Core Metrics Schema
```typescript
interface PerformanceMetrics {
  session_id: string;
  timestamp: Date;
  task_metrics: TaskMetrics;
  agent_metrics: AgentMetrics;
  model_metrics: ModelMetrics;
  user_metrics: UserMetrics;
  system_metrics: SystemMetrics;
}

interface TaskMetrics {
  task_id: string;
  complexity_score: number;
  estimated_duration: number;
  actual_duration: number;
  success_rate: number;
  quality_score: number;
  template_used?: string;
  customizations_applied: string[];
  issues_encountered: string[];
}

interface AgentMetrics {
  agents_involved: AgentType[];
  primary_agent: AgentType;
  coordination_efficiency: number;
  handoff_time: number;
  collaboration_score: number;
  individual_performance: Map<AgentType, AgentPerformance>;
}

interface ModelMetrics {
  model_used: ModelType;
  context_tokens: number;
  output_tokens: number;
  response_time: number;
  accuracy_score: number;
  cost_efficiency: number;
}

interface UserMetrics {
  satisfaction_rating: number;
  task_clarity_score: number;
  result_usefulness: number;
  would_recommend: boolean;
  feedback_text?: string;
  follow_up_questions: number;
}
```

### Real-time Data Collection
```typescript
class MetricsCollector {
  private metricsBuffer: PerformanceMetrics[] = [];
  private realTimeListeners: Set<MetricsListener> = new Set();
  
  async recordTaskStart(taskInfo: TaskStartInfo): Promise<string> {
    const taskId = this.generateTaskId();
    
    const initialMetrics: Partial<PerformanceMetrics> = {
      session_id: taskInfo.session_id,
      timestamp: new Date(),
      task_metrics: {
        task_id: taskId,
        complexity_score: taskInfo.complexity_score,
        estimated_duration: taskInfo.estimated_duration,
        actual_duration: 0,
        success_rate: 0,
        quality_score: 0
      }
    };
    
    await this.storeMetrics(initialMetrics);
    this.notifyListeners('task_started', initialMetrics);
    
    return taskId;
  }
  
  async recordTaskCompletion(
    taskId: string,
    completionInfo: TaskCompletionInfo
  ): Promise<void> {
    const metrics = await this.getTaskMetrics(taskId);
    
    // Update with completion data
    metrics.task_metrics.actual_duration = completionInfo.actual_duration;
    metrics.task_metrics.success_rate = completionInfo.success ? 1 : 0;
    metrics.task_metrics.quality_score = completionInfo.quality_score;
    metrics.task_metrics.issues_encountered = completionInfo.issues;
    
    // Agent performance data
    metrics.agent_metrics = {
      agents_involved: completionInfo.agents_used,
      primary_agent: completionInfo.primary_agent,
      coordination_efficiency: completionInfo.coordination_score,
      handoff_time: completionInfo.handoff_time,
      collaboration_score: completionInfo.collaboration_score,
      individual_performance: completionInfo.agent_performance
    };
    
    // Model usage data
    metrics.model_metrics = completionInfo.model_metrics;
    
    await this.storeMetrics(metrics);
    this.notifyListeners('task_completed', metrics);
    
    // Trigger analysis if needed
    if (this.shouldTriggerAnalysis()) {
      await this.triggerPerformanceAnalysis();
    }
  }
  
  async recordUserFeedback(
    taskId: string,
    feedback: UserFeedback
  ): Promise<void> {
    const metrics = await this.getTaskMetrics(taskId);
    
    metrics.user_metrics = {
      satisfaction_rating: feedback.satisfaction,
      task_clarity_score: feedback.clarity,
      result_usefulness: feedback.usefulness,
      would_recommend: feedback.recommend,
      feedback_text: feedback.comments,
      follow_up_questions: feedback.follow_ups || 0
    };
    
    await this.storeMetrics(metrics);
    this.notifyListeners('feedback_received', metrics);
  }
}
```

## Dashboard Visualization Engine

### Performance Dashboard
```typescript
class PerformanceDashboard {
  async generateDashboard(
    timeRange: TimeRange = 'last_7_days'
  ): Promise<DashboardData> {
    const metrics = await this.getMetricsInRange(timeRange);
    
    return {
      overview: await this.generateOverview(metrics),
      agent_performance: await this.analyzeAgentPerformance(metrics),
      model_efficiency: await this.analyzeModelEfficiency(metrics),
      task_patterns: await this.analyzeTaskPatterns(metrics),
      user_satisfaction: await this.analyzeUserSatisfaction(metrics),
      improvement_opportunities: await this.identifyImprovements(metrics),
      trends: await this.generateTrends(metrics)
    };
  }
  
  private async generateOverview(metrics: PerformanceMetrics[]): Promise<Overview> {
    return {
      total_tasks: metrics.length,
      success_rate: this.calculateSuccessRate(metrics),
      average_completion_time: this.calculateAverageTime(metrics),
      user_satisfaction: this.calculateAverageSatisfaction(metrics),
      most_active_agents: this.getMostActiveAgents(metrics),
      efficiency_trend: this.calculateEfficiencyTrend(metrics),
      cost_summary: this.calculateCostSummary(metrics)
    };
  }
  
  private async analyzeAgentPerformance(
    metrics: PerformanceMetrics[]
  ): Promise<AgentAnalysis[]> {
    const agentStats = new Map<AgentType, AgentStats>();
    
    for (const metric of metrics) {
      for (const agent of metric.agent_metrics.agents_involved) {
        const stats = agentStats.get(agent) || this.initAgentStats();
        
        stats.tasks_handled++;
        stats.total_time += metric.task_metrics.actual_duration;
        stats.success_count += metric.task_metrics.success_rate;
        stats.satisfaction_sum += metric.user_metrics?.satisfaction_rating || 0;
        
        if (metric.agent_metrics.individual_performance.has(agent)) {
          const perf = metric.agent_metrics.individual_performance.get(agent);
          stats.quality_sum += perf.quality_score;
          stats.efficiency_sum += perf.efficiency_score;
        }
        
        agentStats.set(agent, stats);
      }
    }
    
    return Array.from(agentStats.entries()).map(([agent, stats]) => ({
      agent,
      performance_score: this.calculatePerformanceScore(stats),
      efficiency: stats.efficiency_sum / stats.tasks_handled,
      success_rate: stats.success_count / stats.tasks_handled,
      average_satisfaction: stats.satisfaction_sum / stats.tasks_handled,
      specializations: this.identifySpecializations(agent, metrics),
      improvement_areas: this.identifyImprovementAreas(agent, stats)
    }));
  }
}
```

### Reporting System
```typescript
class ReportGenerator {
  async generateWeeklyReport(): Promise<WeeklyReport> {
    const weekMetrics = await this.getLastWeekMetrics();
    const previousWeekMetrics = await this.getPreviousWeekMetrics();
    
    return {
      period: this.getWeekPeriod(),
      summary: {
        tasks_completed: weekMetrics.length,
        success_rate: this.calculateSuccessRate(weekMetrics),
        average_satisfaction: this.calculateAverageSatisfaction(weekMetrics),
        time_saved_by_templates: this.calculateTimeSaved(weekMetrics),
        most_productive_day: this.getMostProductiveDay(weekMetrics)
      },
      trends: {
        completion_time: this.compareTrend(
          weekMetrics, 
          previousWeekMetrics, 
          'completion_time'
        ),
        satisfaction: this.compareTrend(
          weekMetrics,
          previousWeekMetrics,
          'satisfaction'
        ),
        efficiency: this.compareTrend(
          weekMetrics,
          previousWeekMetrics,
          'efficiency'
        )
      },
      top_performers: {
        best_agents: this.getTopPerformingAgents(weekMetrics),
        most_efficient_templates: this.getMostEfficientTemplates(weekMetrics),
        optimal_model_usage: this.getOptimalModelUsage(weekMetrics)
      },
      insights: await this.generateInsights(weekMetrics),
      recommendations: await this.generateRecommendations(weekMetrics)
    };
  }
  
  async generateMonthlyReport(): Promise<MonthlyReport> {
    const monthMetrics = await this.getLastMonthMetrics();
    
    return {
      period: this.getMonthPeriod(),
      learning_progress: await this.analyzeLearningProgress(monthMetrics),
      template_evolution: await this.analyzeTemplateEvolution(monthMetrics),
      agent_specialization: await this.analyzeAgentSpecialization(monthMetrics),
      optimization_impact: await this.measureOptimizationImpact(monthMetrics),
      cost_analysis: await this.generateCostAnalysis(monthMetrics),
      strategic_recommendations: await this.generateStrategicRecommendations(monthMetrics)
    };
  }
}
```

## Alert System & Monitoring

```typescript
class AlertSystem {
  private alertRules: AlertRule[] = [
    {
      id: 'low_success_rate',
      condition: (metrics: PerformanceMetrics[]) => 
        this.calculateSuccessRate(metrics.slice(-10)) < 0.7,
      severity: 'high',
      message: 'Success rate below 70% in last 10 tasks',
      action: 'review_agent_selection'
    },
    {
      id: 'high_completion_time',
      condition: (metrics: PerformanceMetrics[]) =>
        this.calculateAverageTime(metrics.slice(-5)) > 3600,
      severity: 'medium',
      message: 'Average completion time exceeding 1 hour',
      action: 'optimize_workflow'
    },
    {
      id: 'low_satisfaction',
      condition: (metrics: PerformanceMetrics[]) =>
        this.calculateAverageSatisfaction(metrics.slice(-5)) < 3.5,
      severity: 'high',
      message: 'User satisfaction below 3.5/5',
      action: 'urgent_review_needed'
    },
    {
      id: 'template_underperformance',
      condition: (metrics: PerformanceMetrics[]) =>
        this.identifyUnderperformingTemplates(metrics).length > 0,
      severity: 'low',
      message: 'Some templates showing poor performance',
      action: 'review_templates'
    }
  ];
  
  async checkAlerts(newMetrics: PerformanceMetrics): Promise<Alert[]> {
    const recentMetrics = await this.getRecentMetrics(20);
    recentMetrics.push(newMetrics);
    
    const triggeredAlerts: Alert[] = [];
    
    for (const rule of this.alertRules) {
      if (rule.condition(recentMetrics)) {
        const alert: Alert = {
          id: rule.id,
          severity: rule.severity,
          message: rule.message,
          suggested_action: rule.action,
          triggered_at: new Date(),
          context: this.generateAlertContext(rule, recentMetrics)
        };
        
        triggeredAlerts.push(alert);
      }
    }
    
    if (triggeredAlerts.length > 0) {
      await this.sendAlerts(triggeredAlerts);
    }
    
    return triggeredAlerts;
  }
}
```

## Optimization Recommendations Engine

```typescript
class OptimizationEngine {
  async generateOptimizationSuggestions(
    metrics: PerformanceMetrics[]
  ): Promise<OptimizationSuggestion[]> {
    const suggestions: OptimizationSuggestion[] = [];
    
    // Analyze agent performance patterns
    const agentAnalysis = await this.analyzeAgentEfficiency(metrics);
    if (agentAnalysis.inefficiencies.length > 0) {
      suggestions.push({
        type: 'agent_optimization',
        priority: 'high',
        impact_score: agentAnalysis.potential_improvement,
        title: 'Optimize Agent Selection',
        description: 'Detected suboptimal agent combinations for certain task types',
        specific_actions: agentAnalysis.recommended_changes,
        expected_benefits: [
          `${(agentAnalysis.time_savings * 100).toFixed(1)}% faster completion`,
          `${(agentAnalysis.satisfaction_improvement * 100).toFixed(1)}% higher satisfaction`
        ]
      });
    }
    
    // Analyze model usage efficiency
    const modelAnalysis = await this.analyzeModelEfficiency(metrics);
    if (modelAnalysis.cost_savings_potential > 0.1) {
      suggestions.push({
        type: 'cost_optimization',
        priority: 'medium',
        impact_score: modelAnalysis.cost_savings_potential,
        title: 'Optimize Model Selection',
        description: 'Opportunities to reduce costs without sacrificing quality',
        specific_actions: modelAnalysis.recommendations,
        expected_benefits: [
          `${(modelAnalysis.cost_savings_potential * 100).toFixed(1)}% cost reduction`,
          'Maintain or improve response quality'
        ]
      });
    }
    
    // Analyze workflow patterns
    const workflowAnalysis = await this.analyzeWorkflowEfficiency(metrics);
    if (workflowAnalysis.automation_opportunities.length > 0) {
      suggestions.push({
        type: 'workflow_automation',
        priority: 'medium',
        impact_score: workflowAnalysis.time_savings_potential,
        title: 'Automate Repetitive Workflows',
        description: 'Create templates for frequently repeated task patterns',
        specific_actions: workflowAnalysis.template_suggestions,
        expected_benefits: [
          `Automate ${workflowAnalysis.automation_opportunities.length} workflow types`,
          `Save average ${workflowAnalysis.time_per_task_savings}min per task`
        ]
      });
    }
    
    return suggestions.sort((a, b) => 
      this.priorityScore(b.priority) - this.priorityScore(a.priority) ||
      b.impact_score - a.impact_score
    );
  }
}
```