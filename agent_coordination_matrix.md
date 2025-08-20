# JWT Authentication - Agent Coordination Matrix

## Agent Dependencies & Communication Flow

### Dependency Graph
```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│ architect-      │────│ database-        │────│ laravel-        │
│ reviewer        │    │ specialist       │    │ specialist      │
│ (OPUS 4.1)      │    │ (Schema)         │    │ (Backend Core)  │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       ▼
         │                       │              ┌─────────────────┐
         │                       │              │ security-       │
         │                       │              │ engineer        │
         │                       │              │ (Middleware)    │
         │                       │              └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│ GEMINI-2.5-PRO  │    │ react-specialist │    │ qa-expert       │
│ (Validation)    │    │ (Frontend)       │    │ (Testing)       │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       ▼
         │                       │              ┌─────────────────┐
         │                       │              │ test-automator  │
         │                       │              │ (E2E/Automation)│
         │                       │              └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│ performance-    │    │ devops-engineer  │    │ penetration-    │
│ engineer        │    │ (Deployment)     │    │ tester          │
│ (Optimization)  │    └──────────────────┘    │ (Sec Testing)   │
└─────────────────┘                           └─────────────────┘
```

## Agent Communication Protocols

### Primary Communication Channels

#### 1. Architecture → Implementation Flow
```yaml
architect_reviewer:
  outputs: [system_design, api_specs, integration_patterns]
  consumers: [laravel_specialist, react_specialist, security_engineer]
  validation: gemini_2_5_pro
  frequency: milestone_based
  
database_specialist:
  outputs: [schema_migrations, indexes, relationships]
  consumers: [laravel_specialist, performance_engineer]
  dependencies: [architect_reviewer]
  frequency: continuous

laravel_specialist:
  outputs: [api_endpoints, middleware, services]
  consumers: [react_specialist, qa_expert, security_engineer]
  dependencies: [database_specialist, architect_reviewer]
  frequency: daily_builds
```

#### 2. Cross-Domain Validation Flow
```yaml
security_validation:
  primary: security_engineer
  secondary: penetration_tester
  validators: [compliance_auditor, gemini_2_5_pro]
  checkpoints: [implementation, testing, deployment]
  
performance_validation:
  primary: performance_engineer
  collaborators: [database_specialist, devops_engineer]
  benchmarks: [response_time, throughput, resource_usage]
  
quality_validation:
  primary: qa_expert
  automation: test_automator
  coverage: [unit, integration, e2e]
  gates: [90_percent_coverage, zero_critical_bugs]
```

### Inter-Agent Coordination Patterns

#### Master-Worker Pattern
```typescript
interface CoordinationPattern {
  master: "multi_agent_coordinator";
  workers: {
    backend_cluster: ["laravel_specialist", "php_pro", "database_specialist"];
    frontend_cluster: ["react_specialist", "ui_engineer"];
    security_cluster: ["security_engineer", "penetration_tester", "compliance_auditor"];
    testing_cluster: ["qa_expert", "test_automator"];
    ops_cluster: ["devops_engineer", "docker_specialist", "performance_engineer"];
  };
  orchestration: "hierarchical_with_peer_collaboration";
}
```

#### Request-Reply Pattern
```typescript
interface RequestReplyFlow {
  api_specification: {
    requester: "react_specialist",
    provider: "laravel_specialist", 
    mediator: "multi_agent_coordinator",
    timeout: "2_hours",
    escalation: "architect_reviewer"
  };
  
  security_review: {
    requester: "laravel_specialist",
    provider: "security_engineer",
    validators: ["penetration_tester", "compliance_auditor"],
    timeout: "4_hours"
  };
  
  performance_assessment: {
    requester: "devops_engineer",
    provider: "performance_engineer",
    dependencies: ["database_specialist", "laravel_specialist"],
    frequency: "continuous"
  };
}
```

### Synchronization Points

#### Daily Standups (15 minutes)
```yaml
participants: all_active_agents
agenda:
  - Progress since last sync
  - Current blockers/dependencies
  - Next 24-hour commitments
  - Resource conflicts
moderator: multi_agent_coordinator
format: round_robin
escalation: immediate_for_blockers
```

#### Phase Gates (2-4 hours)
```yaml
phase_1_gate:
  requirements: [architecture_approved, schema_designed, security_planned]
  validators: [architect_reviewer, gemini_2_5_pro]
  decision: go_no_go_for_implementation
  
phase_2_gate:
  requirements: [backend_functional, frontend_integrated, security_implemented]
  validators: [qa_expert, security_engineer, architect_reviewer]
  decision: go_no_go_for_testing
  
phase_3_gate:
  requirements: [all_tests_passing, security_validated, performance_benchmarked]
  validators: [gemini_2_5_pro, penetration_tester, performance_engineer]
  decision: go_no_go_for_deployment
```

## Conflict Resolution Protocols

### Dependency Conflicts
```typescript
interface ConflictResolution {
  type: "dependency_conflict";
  examples: [
    "database_schema_changes_after_backend_start",
    "api_contract_changes_during_frontend_development",
    "security_requirements_affecting_performance"
  ];
  
  resolution_protocol: {
    step_1: "immediate_escalation_to_coordinator",
    step_2: "stakeholder_agent_conference",
    step_3: "impact_assessment_by_architect_reviewer", 
    step_4: "gemini_2_5_pro_consultation_if_needed",
    step_5: "decision_and_communication_to_all_affected"
  };
  
  timeout: "2_hours_maximum";
  fallback: "escalate_to_opus_4_1";
}
```

### Resource Conflicts
```yaml
resource_conflict_types:
  model_availability:
    conflict: multiple_agents_requesting_sonnet_4_simultaneously
    resolution: priority_queue_based_on_critical_path
    coordinator: multi_agent_coordinator
    
  code_merge_conflicts:
    conflict: simultaneous_modifications_to_shared_components
    resolution: lock_based_coordination_with_time_limits
    mediator: architect_reviewer
    
  testing_environment:
    conflict: overlapping_test_execution_requirements
    resolution: scheduled_time_slots_with_parallel_sandboxes
    manager: qa_expert
```

### Technical Disagreements
```yaml
disagreement_resolution:
  api_design_conflicts:
    participants: [laravel_specialist, react_specialist]
    mediator: architect_reviewer
    validation: gemini_2_5_pro_consultation
    decision_criteria: maintainability_security_performance
    
  security_vs_performance:
    participants: [security_engineer, performance_engineer]
    mediator: multi_agent_coordinator
    validators: [architect_reviewer, penetration_tester]
    approach: security_first_with_performance_optimization
    
  testing_strategy_disputes:
    participants: [qa_expert, test_automator]
    mediator: architect_reviewer
    criteria: coverage_automation_maintainability
    final_authority: gemini_2_5_pro_validation
```

## Communication Optimization

### Message Routing
```typescript
interface MessageRouting {
  broadcast_channels: {
    all_agents: "critical_updates_milestone_changes",
    domain_specific: "backend_frontend_security_testing_devops",
    role_specific: "leads_supporters_validators"
  };
  
  direct_channels: {
    coordinator_to_lead: "task_assignment_escalation_resolution",
    lead_to_supporter: "work_distribution_coordination",
    peer_to_peer: "technical_collaboration_code_review"
  };
  
  escalation_channels: {
    blocker_resolution: "coordinator → architect_reviewer → opus_4_1",
    security_concerns: "security_engineer → compliance_auditor → gemini_2_5_pro",
    performance_issues: "performance_engineer → architect_reviewer → optimization_team"
  };
}
```

### Batch Communication
```yaml
batched_updates:
  progress_reports:
    frequency: every_4_hours
    participants: all_active_agents
    format: standardized_status_json
    consolidation: automated_by_coordinator
    
  code_review_requests:
    frequency: end_of_development_sessions
    reviewers: peer_agents_plus_gemini_2_5_pro
    batch_size: related_components_grouped
    
  test_results:
    frequency: continuous_integration_triggered
    recipients: relevant_agents_plus_qa_expert
    format: detailed_reports_with_coverage_metrics
```

## Performance Monitoring

### Agent Performance Metrics
```typescript
interface AgentMetrics {
  efficiency_metrics: {
    task_completion_rate: "tasks_completed / tasks_assigned",
    quality_score: "passed_reviews / total_reviews", 
    collaboration_effectiveness: "successful_handoffs / total_handoffs",
    response_time: "average_time_to_address_requests"
  };
  
  coordination_metrics: {
    communication_overhead: "coordination_time / total_development_time",
    conflict_resolution_time: "average_time_to_resolve_blocks",
    dependency_wait_time: "time_blocked_on_other_agents",
    synchronization_efficiency: "on_time_deliveries / total_deliveries"
  };
  
  quality_metrics: {
    defect_rate: "bugs_introduced / features_delivered",
    rework_percentage: "rework_time / initial_development_time", 
    test_coverage: "covered_lines / total_lines",
    security_score: "vulnerabilities_found / security_checks"
  };
}
```

### Coordination Health Dashboard
```yaml
real_time_monitoring:
  active_agents: count_and_status
  current_phase: progress_percentage
  blocking_issues: count_and_severity
  communication_volume: messages_per_hour
  
performance_indicators:
  coordination_efficiency: target_96_percent
  dependency_resolution: target_under_2_hours
  quality_gates: passed_failed_pending
  timeline_adherence: ahead_on_time_behind
  
alerts:
  critical_blockers: immediate_notification
  performance_degradation: hourly_assessment
  quality_gate_failures: immediate_escalation
  timeline_risks: daily_assessment
```

This coordination matrix ensures seamless collaboration between all 12 agents while maintaining clear communication protocols, conflict resolution procedures, and performance monitoring for the JWT authentication system implementation.