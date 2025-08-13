# Playwright MCP Integration Setup

## 🚀 Quick Installation

```bash
# Install Playwright MCP globally
npx @playwright/mcp@latest

# Or install as dependency
npm install @playwright/mcp
```

## 📋 Configuration for Claude Code

### 1. Update MCP Configuration

Create or update `~/.config/claude_desktop/config.json`:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"],
      "env": {},
      "config": {
        "browser": "chromium",
        "launchOptions": {
          "headless": true
        },
        "networkRestrictions": [],
        "capabilities": {
          "tabs": true,
          "pdf": true,
          "bringToFront": true
        }
      }
    }
  }
}
```

### 2. Alternative Configuration with Local Installation

If you prefer a local installation:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "node",
      "args": ["/path/to/playwright-mcp/dist/index.js"],
      "env": {},
      "config": {
        "browser": "chromium",
        "launchOptions": {
          "headless": false,
          "args": ["--disable-blink-features=AutomationControlled"]
        }
      }
    }
  }
}
```

## 🛠️ Available Tools

Once configured, Playwright MCP provides these tools:

### Navigation & Interaction
- `playwright_navigate` - Navigate to URL
- `playwright_click` - Click on elements
- `playwright_type` - Type text into inputs
- `playwright_hover` - Hover over elements
- `playwright_select` - Select dropdown options
- `playwright_press` - Press keyboard keys

### Content Extraction
- `playwright_screenshot` - Capture screenshots
- `playwright_snapshot` - Get accessibility tree snapshot
- `playwright_evaluate` - Execute JavaScript

### Tab Management
- `playwright_list_tabs` - List all open tabs
- `playwright_switch_tab` - Switch between tabs
- `playwright_close_tab` - Close specific tabs

### Advanced Features
- `playwright_pdf` - Generate PDF from page
- `playwright_bring_to_front` - Bring browser to foreground
- `playwright_network` - Monitor network requests

## 💡 Workflow Integration Use Cases

### 1. Web Testing Automation
```typescript
// Test your Laravel application
const testWorkflow = {
  steps: [
    "Navigate to application URL",
    "Fill login form",
    "Submit and verify authentication",
    "Test API endpoints via UI",
    "Capture screenshots for documentation"
  ]
};
```

### 2. Content Scraping & Analysis
```typescript
// Extract data from websites
const scrapingWorkflow = {
  steps: [
    "Navigate to target site",
    "Extract structured data via accessibility tree",
    "No screenshots needed - pure structured data",
    "Process and transform data",
    "Save to database or file"
  ]
};
```

### 3. UI/UX Testing
```typescript
// Test responsive design
const uiTestWorkflow = {
  steps: [
    "Test different viewport sizes",
    "Verify element visibility",
    "Check interactive elements",
    "Generate visual regression tests",
    "Create PDF reports"
  ]
};
```

### 4. Form Automation
```typescript
// Automate repetitive form filling
const formAutomation = {
  steps: [
    "Navigate to form page",
    "Fill complex multi-step forms",
    "Handle dynamic form validation",
    "Submit and verify success",
    "Extract confirmation data"
  ]
};
```

### 5. API Integration Testing
```typescript
// Test API integrations through UI
const apiIntegrationTest = {
  steps: [
    "Navigate to application",
    "Trigger API calls via UI actions",
    "Monitor network requests",
    "Verify responses in UI",
    "Test error handling"
  ]
};
```

## 🔧 Integration with Your Workflow

### For Laravel Development
```yaml
use_cases:
  - e2e_testing: Test complete user flows
  - api_testing: Test API through browser
  - admin_panel: Automate admin tasks
  - data_validation: Verify form submissions
  - pdf_generation: Test PDF exports
```

### For WordPress Development
```yaml
use_cases:
  - plugin_testing: Test plugin functionality
  - theme_testing: Verify theme responsiveness
  - content_migration: Automate content import
  - seo_analysis: Extract SEO data
  - performance_testing: Monitor load times
```

### For Full-Stack Projects
```yaml
use_cases:
  - integration_testing: Test frontend-backend integration
  - user_journey: Complete user flow testing
  - cross_browser: Test multiple browsers
  - accessibility: Verify ARIA compliance
  - monitoring: Automated health checks
```

## 📝 Example Commands in Claude Code

Once integrated, you can use commands like:

```bash
# Navigate and test
"Navigate to https://myapp.test and test the login flow"

# Extract data
"Extract all product prices from the catalog page"

# Generate reports
"Create a PDF report of the dashboard"

# Multi-tab testing
"Open multiple tabs and test real-time sync"

# Form automation
"Fill out the registration form with test data"
```

## 🚦 Setup Verification

To verify the integration works:

1. Restart Claude Code after configuration
2. Test with: "Navigate to https://example.com and take a screenshot"
3. Check if Playwright tools are available in the MCP tools list

## 🔍 Troubleshooting

### Common Issues

1. **Browser not launching**
   - Install system dependencies: `npx playwright install-deps`
   - Install browsers: `npx playwright install`

2. **Permission errors**
   - Ensure proper file permissions for config
   - Check Node.js version (must be 18+)

3. **MCP not recognized**
   - Verify config.json syntax
   - Check MCP server logs
   - Restart Claude Code

## 🎯 Benefits for Your Workflow

1. **No Screenshots Needed**: Works with structured data
2. **Faster Testing**: Direct accessibility tree access
3. **Deterministic Actions**: Precise element targeting
4. **LLM-Friendly**: Natural language commands
5. **Cross-Browser**: Support for Chromium, Firefox, WebKit
6. **Headless Mode**: Run tests without UI
7. **Network Control**: Monitor and control requests

## 🔄 Integration with Existing Tools

Playwright MCP complements your existing tools:

- **With Laravel**: E2E testing for Pest/PHPUnit
- **With Docker**: Test containerized apps
- **With CI/CD**: Automated testing in pipelines
- **With WordPress**: Plugin/theme testing
- **With React/Vue**: Component interaction testing

## 📚 Next Steps

1. Install and configure Playwright MCP
2. Test basic navigation and screenshots
3. Create automated test workflows
4. Integrate with your CI/CD pipeline
5. Build custom automation scripts

---

This integration will significantly enhance your testing and automation capabilities within Claude Code, making web automation tasks natural language-driven and highly efficient.