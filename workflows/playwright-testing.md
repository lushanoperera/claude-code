# Playwright Testing Workflows

## 🎯 Quick Testing Commands

### Laravel Application Testing
```bash
# Test authentication flow
"Navigate to [app-url] and test the complete login flow with test credentials"

# Test API endpoints via UI
"Open [app-url]/api-test, trigger all CRUD operations and verify responses"

# Test form validation
"Navigate to registration form, test all validation rules and capture error states"

# Generate test report
"Run through all main user flows and generate a PDF test report"
```

### WordPress Testing
```bash
# Test plugin functionality
"Navigate to WP admin, activate plugin and test all features"

# Test theme responsiveness
"Open site and test responsive design at mobile, tablet, and desktop sizes"

# Test Gutenberg blocks
"Create a new post, test all custom Gutenberg blocks"

# SEO analysis
"Extract all meta tags, headings structure and schema.org data"
```

### Full-Stack E2E Testing
```bash
# User journey testing
"Complete full user journey from registration to first purchase"

# Real-time features
"Open multiple tabs and test WebSocket real-time synchronization"

# Payment flow
"Test complete payment flow with test credit card"

# Multi-language testing
"Switch between all available languages and verify translations"
```

## 🔄 Automated Test Sequences

### Daily Health Check
```typescript
const dailyHealthCheck = async () => {
  // 1. Check homepage loads
  await playwright_navigate('https://myapp.test');
  
  // 2. Test critical user paths
  await testLoginFlow();
  await testCheckoutProcess();
  
  // 3. Verify API endpoints
  await testAPIEndpoints();
  
  // 4. Generate report
  await playwright_pdf('health-check-report.pdf');
};
```

### Pre-Deployment Testing
```typescript
const preDeploymentTests = async () => {
  // 1. Run smoke tests
  await runSmokeTests();
  
  // 2. Performance testing
  await measurePageLoadTimes();
  
  // 3. Cross-browser testing
  await testInAllBrowsers(['chromium', 'firefox', 'webkit']);
  
  // 4. Accessibility audit
  await verifyAccessibility();
};
```

## 📊 Testing Patterns

### Pattern 1: Form Testing
```yaml
steps:
  1. Navigate to form
  2. Test empty submission (validation)
  3. Test invalid data (error handling)
  4. Test valid submission (success flow)
  5. Verify database entry
  6. Check confirmation email
```

### Pattern 2: API Integration Testing
```yaml
steps:
  1. Navigate to application
  2. Trigger API call via UI action
  3. Monitor network request
  4. Verify response in UI
  5. Test error scenarios
  6. Verify retry logic
```

### Pattern 3: Multi-Step Workflow
```yaml
steps:
  1. Start workflow process
  2. Complete step 1 with validation
  3. Navigate through steps
  4. Handle conditional branches
  5. Verify final state
  6. Test back/forward navigation
```

## 🚀 Integration with CI/CD

### GitHub Actions Integration
```yaml
name: Playwright Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npx playwright install
      - run: npm test
      - uses: actions/upload-artifact@v3
        with:
          name: test-results
          path: test-results/
```

### Docker Integration
```dockerfile
FROM mcr.microsoft.com/playwright:v1.40.0
WORKDIR /app
COPY . .
RUN npm ci
CMD ["npm", "test"]
```

## 🛠️ Common Test Scenarios

### Authentication Testing
```javascript
// Test login with various scenarios
const testAuthentication = {
  validLogin: "Enter valid credentials and verify dashboard access",
  invalidPassword: "Test with wrong password and verify error message",
  sessionExpiry: "Test session timeout and re-authentication",
  rememberMe: "Test remember me functionality",
  socialLogin: "Test OAuth login flows"
};
```

### Shopping Cart Testing
```javascript
// E-commerce flow testing
const testShoppingCart = {
  addToCart: "Add multiple products to cart",
  updateQuantity: "Modify quantities and verify totals",
  applyCoupon: "Test discount code application",
  checkout: "Complete checkout process",
  payment: "Test payment gateway integration"
};
```

### Search Functionality
```javascript
// Search and filter testing
const testSearch = {
  basicSearch: "Test keyword search",
  advancedFilters: "Apply multiple filters",
  sorting: "Test result sorting options",
  pagination: "Navigate through result pages",
  noResults: "Test empty state handling"
};
```

## 📝 Testing Checklist

### Pre-Release Checklist
- [ ] All forms submit correctly
- [ ] Navigation works on all pages
- [ ] Images and media load properly
- [ ] Responsive design works
- [ ] JavaScript errors checked
- [ ] API endpoints responding
- [ ] Authentication flows work
- [ ] Payment processing tested
- [ ] Email notifications sent
- [ ] Error pages display correctly

### Performance Checklist
- [ ] Page load under 3 seconds
- [ ] Images optimized and lazy loaded
- [ ] JavaScript bundles minimized
- [ ] Database queries optimized
- [ ] Caching properly configured
- [ ] CDN delivering static assets
- [ ] Server response times acceptable

## 🔍 Debugging Commands

```bash
# Capture full page screenshot
"Navigate to [url] and take full page screenshot for debugging"

# Extract console errors
"Navigate to [url] and capture all console errors and warnings"

# Network analysis
"Navigate to [url] and log all network requests with timing"

# Accessibility audit
"Run accessibility audit and list all WCAG violations"

# Performance metrics
"Measure and report Core Web Vitals for [url]"
```

## 💡 Pro Tips

1. **Use headless mode** for CI/CD pipelines
2. **Capture screenshots** on test failures
3. **Use data-testid** attributes for reliable selectors
4. **Run tests in parallel** for speed
5. **Mock external APIs** for consistent tests
6. **Use fixtures** for test data
7. **Implement retry logic** for flaky tests
8. **Generate HTML reports** for stakeholders

## 🔗 Integration with Existing Tools

### With Pest (Laravel)
```php
test('homepage loads correctly', function () {
    // Trigger Playwright test from Pest
    $result = shell_exec('npm run playwright:homepage');
    expect($result)->toContain('Test passed');
});
```

### With Jest
```javascript
describe('E2E Tests', () => {
  test('user can complete purchase', async () => {
    // Run Playwright test
    await runPlaywrightTest('purchase-flow');
  });
});
```

### With WordPress CLI
```bash
# Run after plugin activation
wp plugin activate my-plugin && npm run playwright:plugin-test
```

---

This workflow integrates seamlessly with your development process, providing powerful browser automation capabilities directly within Claude Code.