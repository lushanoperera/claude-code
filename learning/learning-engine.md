---
name: learning-engine
description: Advanced learning engine that analyzes task patterns, agent performance, and user satisfaction to continuously optimize orchestration strategies and improve development workflow efficiency.
tools: Read, Write, MultiEdit, Bash, analytics, ml-pipeline, pattern-recognition
---

# Learning Engine System

## Pattern Recognition & Analysis

### Task Pattern Detection
```typescript
interface TaskSignature {
  keywords: string[];
  complexity_indicators: string[];
  domain_markers: string[];
  urgency_signals: string[];
  collaboration_hints: string[];
}

class PatternRecognizer {
  private taskPatterns: Map<string, TaskSignature> = new Map([
    ['laravel_api_endpoint', {
      keywords: ['endpoint', 'api', 'route', 'controller'],
      complexity_indicators: ['authentication', 'validation', 'middleware'],
      domain_markers: ['laravel', 'eloquent', 'artisan'],
      urgency_signals: ['urgent', 'hotfix', 'production'],
      collaboration_hints: ['frontend', 'database', 'security']
    }],
    ['database_optimization', {
      keywords: ['slow', 'query', 'performance', 'optimize'],
      complexity_indicators: ['n+1', 'joins', 'indexes', 'migration'],
      domain_markers: ['mysql', 'eloquent', 'sql'],
      urgency_signals: ['production', 'timeout', 'critical'],
      collaboration_hints: ['caching', 'monitoring', 'profiling']
    }],
    ['docker_deployment', {
      keywords: ['deploy', 'container', 'docker', 'build'],
      complexity_indicators: ['compose', 'orchestration', 'scaling'],
      domain_markers: ['dockerfile', 'compose', 'kubernetes'],
      urgency_signals: ['deploy', 'release', 'production'],
      collaboration_hints: ['ci/cd', 'monitoring', 'security']
    }]
  ]);

  analyzeTask(description: string): TaskAnalysis {
    const analysis = {
      detected_patterns: [],
      complexity_score: 0,
      recommended_agents: [],
      estimated_duration: 0,
      confidence: 0
    };

    for (const [patternName, signature] of this.taskPatterns) {
      const match = this.calculatePatternMatch(description, signature);
      if (match.score > 0.6) {
        analysis.detected_patterns.push({
          pattern: patternName,
          confidence: match.score,
          indicators: match.matched_indicators
        });
      }
    }

    return this.calculateRecommendations(analysis);
  }
}
```

### Performance Learning
```typescript
interface PerformanceMetrics {
  agent_combination: AgentType[];
  task_pattern: string;
  completion_time: number;
  success_rate: number;
  user_satisfaction: number;
  code_quality_score: number;
  issues_encountered: string[];
  optimizations_applied: string[];
}

class PerformanceLearner {
  private performanceHistory: PerformanceMetrics[] = [];
  
  async recordPerformance(metrics: PerformanceMetrics): Promise<void> {
    this.performanceHistory.push({
      ...metrics,
      timestamp: new Date()
    });
    
    // Analisi ogni 10 task per aggiornare raccomandazioni
    if (this.performanceHistory.length % 10 === 0) {
      await this.updateRecommendations();
    }
  }
  
  private async updateRecommendations(): Promise<void> {
    const recent = this.performanceHistory.slice(-50);
    
    // Trova le combinazioni di agent più performanti
    const agentCombinations = this.analyzeAgentPerformance(recent);
    
    // Aggiorna le soglie di complessità per i modelli
    const modelOptimization = this.optimizeModelSelection(recent);
    
    // Identifica pattern di errori ricorrenti
    const errorPatterns = this.identifyErrorPatterns(recent);
    
    await this.saveOptimizations({
      agent_combinations: agentCombinations,
      model_thresholds: modelOptimization,
      error_prevention: errorPatterns
    });
  }
  
  getBestAgentCombination(taskPattern: string): AgentRecommendation {
    const relevantHistory = this.performanceHistory.filter(
      h => h.task_pattern === taskPattern
    );
    
    if (relevantHistory.length < 3) {
      return this.getDefaultRecommendation(taskPattern);
    }
    
    // Calcola performance per ogni combinazione
    const combinationPerformance = new Map();
    
    for (const record of relevantHistory) {
      const key = record.agent_combination.join(',');
      const existing = combinationPerformance.get(key) || {
        total_time: 0,
        total_satisfaction: 0,
        total_success: 0,
        count: 0
      };
      
      combinationPerformance.set(key, {
        total_time: existing.total_time + record.completion_time,
        total_satisfaction: existing.total_satisfaction + record.user_satisfaction,
        total_success: existing.total_success + (record.success_rate ? 1 : 0),
        count: existing.count + 1
      });
    }
    
    // Trova la combinazione migliore
    let bestCombination = null;
    let bestScore = 0;
    
    for (const [combination, stats] of combinationPerformance) {
      const avgTime = stats.total_time / stats.count;
      const avgSatisfaction = stats.total_satisfaction / stats.count;
      const successRate = stats.total_success / stats.count;
      
      // Score composito (più alto = migliore)
      const score = (avgSatisfaction * 0.4) + (successRate * 0.4) + 
                   ((1000 / avgTime) * 0.2); // Tempo inverso per favorire rapidità
      
      if (score > bestScore) {
        bestScore = score;
        bestCombination = combination.split(',');
      }
    }
    
    return {
      agents: bestCombination,
      confidence: this.calculateConfidence(relevantHistory.length),
      expected_performance: bestScore,
      based_on_samples: relevantHistory.length
    };
  }
}
```

### Adaptive Model Selection
```typescript
class AdaptiveModelSelector {
  private modelPerformance: Map<string, ModelMetrics> = new Map();
  
  async learnFromExecution(
    taskComplexity: number,
    modelUsed: ModelType,
    actualPerformance: TaskResult
  ): Promise<void> {
    const key = `${Math.floor(taskComplexity)}-${modelUsed}`;
    const existing = this.modelPerformance.get(key) || {
      total_tasks: 0,
      success_rate: 0,
      avg_quality: 0,
      avg_time: 0,
      user_satisfaction: 0
    };
    
    const updated = {
      total_tasks: existing.total_tasks + 1,
      success_rate: (existing.success_rate * existing.total_tasks + 
                    (actualPerformance.success ? 1 : 0)) / (existing.total_tasks + 1),
      avg_quality: (existing.avg_quality * existing.total_tasks + 
                   actualPerformance.quality_score) / (existing.total_tasks + 1),
      avg_time: (existing.avg_time * existing.total_tasks + 
                actualPerformance.completion_time) / (existing.total_tasks + 1),
      user_satisfaction: (existing.user_satisfaction * existing.total_tasks + 
                         actualPerformance.user_rating) / (existing.total_tasks + 1)
    };
    
    this.modelPerformance.set(key, updated);
    
    // Aggiorna le soglie se abbiamo dati sufficienti
    if (updated.total_tasks >= 5) {
      await this.updateModelThresholds();
    }
  }
  
  getOptimalModel(taskComplexity: number): ModelRecommendation {
    const candidates = ['haiku', 'sonnet', 'opus'];
    let bestModel = 'sonnet'; // default
    let bestScore = 0;
    
    for (const model of candidates) {
      const key = `${Math.floor(taskComplexity)}-${model}`;
      const metrics = this.modelPerformance.get(key);
      
      if (!metrics || metrics.total_tasks < 3) continue;
      
      // Score che bilancia qualità, velocità e soddisfazione
      const score = (metrics.success_rate * 0.3) + 
                   (metrics.avg_quality * 0.3) + 
                   (metrics.user_satisfaction * 0.25) +
                   ((1000 / metrics.avg_time) * 0.15); // Bonus velocità
      
      if (score > bestScore) {
        bestScore = score;
        bestModel = model;
      }
    }
    
    return {
      model: bestModel as ModelType,
      confidence: bestScore,
      reasoning: this.explainSelection(taskComplexity, bestModel)
    };
  }
}
```

## Optimization Suggestions Engine

```typescript
class OptimizationEngine {
  generateSuggestions(projectContext: ProjectContext): OptimizationSuggestion[] {
    const suggestions = [];
    
    // Analizza pattern ricorrenti
    const patterns = this.analyzeRecurringPatterns(projectContext);
    if (patterns.optimization_opportunities.length > 0) {
      suggestions.push({
        type: 'workflow_optimization',
        priority: 'high',
        title: 'Ottimizza workflow ricorrenti',
        description: `Rilevati ${patterns.frequency} task simili. Considera template personalizzati.`,
        actions: patterns.suggested_templates
      });
    }
    
    // Analizza performance agent
    const agentPerf = this.analyzeAgentPerformance(projectContext);
    if (agentPerf.underperforming.length > 0) {
      suggestions.push({
        type: 'agent_optimization',
        priority: 'medium',
        title: 'Migliora selezione agent',
        description: 'Alcuni agent mostrano performance sub-ottimali per questo progetto',
        actions: [`Considera: ${agentPerf.better_alternatives.join(', ')}`]
      });
    }
    
    // Analizza selezione modelli
    const modelOptim = this.analyzeModelUsage(projectContext);
    if (modelOptim.cost_savings_potential > 0.15) {
      suggestions.push({
        type: 'cost_optimization',
        priority: 'low',
        title: 'Ottimizza costi modelli',
        description: `Possibile risparmio ${(modelOptim.cost_savings_potential * 100).toFixed(1)}%`,
        actions: ['Usa modelli più leggeri per task semplici', 'Rivedi soglie complessità']
      });
    }
    
    return suggestions.sort((a, b) => 
      this.priorityScore(b.priority) - this.priorityScore(a.priority)
    );
  }
}
```