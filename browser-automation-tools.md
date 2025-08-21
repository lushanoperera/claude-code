# Browser Automation Tools Configuration

## Chrome DevTools Protocol (CDP) Setup

### Connection Configuration
```javascript
// CDP client configuration
const CDP_CONFIG = {
  host: 'localhost',
  port: 9222,
  secure: false,
  target: 'auto',
  timeout: 30000
};

// Advanced CDP client with retry logic
class ChromeDebugger {
  constructor(config = CDP_CONFIG) {
    this.config = config;
    this.client = null;
    this.domains = {};
  }

  async connect() {
    try {
      const CDP = require('chrome-remote-interface');
      this.client = await CDP(this.config);
      
      // Enable required domains
      const requiredDomains = ['Network', 'Page', 'Runtime', 'DOM', 'Performance', 'Security'];
      for (const domain of requiredDomains) {
        await this.client[domain].enable();
        this.domains[domain] = this.client[domain];
      }
      
      console.log('Chrome DevTools connected successfully');
      return true;
    } catch (error) {
      console.error('Failed to connect to Chrome DevTools:', error);
      return false;
    }
  }

  async networkMonitor(callback) {
    if (!this.domains.Network) {
      throw new Error('Network domain not enabled');
    }

    this.domains.Network.requestWillBeSent(callback);
    this.domains.Network.responseReceived(callback);
    this.domains.Network.loadingFailed(callback);
  }

  async executeScript(expression) {
    if (!this.domains.Runtime) {
      throw new Error('Runtime domain not enabled');
    }

    const result = await this.domains.Runtime.evaluate({
      expression,
      returnByValue: true
    });

    return result.result.value;
  }

  async getDOMSnapshot() {
    if (!this.domains.DOM) {
      throw new Error('DOM domain not enabled');
    }

    const document = await this.domains.DOM.getDocument();
    const snapshot = await this.domains.DOM.getOuterHTML({
      nodeId: document.root.nodeId
    });

    return snapshot.outerHTML;
  }

  async performanceMetrics() {
    if (!this.domains.Performance) {
      throw new Error('Performance domain not enabled');
    }

    const metrics = await this.domains.Performance.getMetrics();
    return metrics.metrics.reduce((acc, metric) => {
      acc[metric.name] = metric.value;
      return acc;
    }, {});
  }

  async close() {
    if (this.client) {
      await this.client.close();
      this.client = null;
      console.log('Chrome DevTools connection closed');
    }
  }
}
```

### Browser Launch Scripts
```bash
#!/bin/bash

# Chrome with debugging enabled
start_chrome_debug() {
  local PORT=${1:-9222}
  local USER_DATA_DIR="/tmp/chrome-debug-$(date +%s)"
  
  echo "Starting Chrome with debugging on port $PORT"
  google-chrome \
    --remote-debugging-port=$PORT \
    --disable-web-security \
    --disable-features=VizDisplayCompositor \
    --disable-background-timer-throttling \
    --disable-backgrounding-occluded-windows \
    --disable-renderer-backgrounding \
    --user-data-dir="$USER_DATA_DIR" \
    --no-sandbox \
    --disable-dev-shm-usage &
    
  echo $! > "/tmp/chrome-debug-$PORT.pid"
  echo "Chrome debug session started (PID: $!)"
}

# Chrome headless mode
start_chrome_headless() {
  local PORT=${1:-9222}
  local USER_DATA_DIR="/tmp/chrome-headless-$(date +%s)"
  
  echo "Starting Chrome headless on port $PORT"
  google-chrome \
    --headless=new \
    --disable-gpu \
    --remote-debugging-port=$PORT \
    --disable-web-security \
    --user-data-dir="$USER_DATA_DIR" \
    --no-sandbox \
    --disable-dev-shm-usage &
    
  echo $! > "/tmp/chrome-headless-$PORT.pid"
  echo "Chrome headless started (PID: $!)"
}

# Stop Chrome debug session
stop_chrome_debug() {
  local PORT=${1:-9222}
  local PID_FILE="/tmp/chrome-debug-$PORT.pid"
  
  if [ -f "$PID_FILE" ]; then
    local PID=$(cat "$PID_FILE")
    kill $PID 2>/dev/null
    rm "$PID_FILE"
    echo "Chrome debug session stopped"
  else
    echo "No Chrome debug session found for port $PORT"
  fi
}
```

## Firefox Debugging Protocol Setup

### Marionette Configuration
```javascript
// Firefox Marionette client
const { Builder } = require('selenium-webdriver');
const firefox = require('selenium-webdriver/firefox');

class FirefoxDebugger {
  constructor() {
    this.driver = null;
    this.options = new firefox.Options();
  }

  async connect(headless = false) {
    try {
      // Configure Firefox options
      this.options.setPreference('devtools.debugger.remote-enabled', true);
      this.options.setPreference('devtools.chrome.enabled', true);
      this.options.setPreference('devtools.debugger.prompt-connection', false);
      
      if (headless) {
        this.options.headless();
      }

      // Start Firefox with Marionette
      this.driver = await new Builder()
        .forBrowser('firefox')
        .setFirefoxOptions(this.options)
        .build();

      console.log('Firefox Marionette connected successfully');
      return true;
    } catch (error) {
      console.error('Failed to connect to Firefox:', error);
      return false;
    }
  }

  async navigateTo(url) {
    if (!this.driver) {
      throw new Error('Firefox driver not initialized');
    }
    await this.driver.get(url);
  }

  async executeScript(script) {
    if (!this.driver) {
      throw new Error('Firefox driver not initialized');
    }
    return await this.driver.executeScript(script);
  }

  async takeScreenshot() {
    if (!this.driver) {
      throw new Error('Firefox driver not initialized');
    }
    return await this.driver.takeScreenshot();
  }

  async getNetworkLogs() {
    // Firefox network logging requires additional setup
    const logs = await this.driver.manage().logs().get('browser');
    return logs.filter(log => log.message.includes('network'));
  }

  async close() {
    if (this.driver) {
      await this.driver.quit();
      this.driver = null;
      console.log('Firefox connection closed');
    }
  }
}
```

### Firefox Setup Scripts
```bash
#!/bin/bash

# Firefox with debugging enabled
start_firefox_debug() {
  local PORT=${1:-6000}
  local PROFILE_DIR="/tmp/firefox-debug-$(date +%s)"
  
  echo "Starting Firefox with debugging on port $PORT"
  firefox \
    --remote-debugging-port=$PORT \
    --marionette \
    --profile "$PROFILE_DIR" \
    --new-instance &
    
  echo $! > "/tmp/firefox-debug-$PORT.pid"
  echo "Firefox debug session started (PID: $!)"
}

# Firefox headless mode
start_firefox_headless() {
  local PORT=${1:-6000}
  local PROFILE_DIR="/tmp/firefox-headless-$(date +%s)"
  
  echo "Starting Firefox headless on port $PORT"
  firefox \
    --headless \
    --remote-debugging-port=$PORT \
    --marionette \
    --profile "$PROFILE_DIR" \
    --new-instance &
    
  echo $! > "/tmp/firefox-headless-$PORT.pid"
  echo "Firefox headless started (PID: $!)"
}

# Stop Firefox debug session
stop_firefox_debug() {
  local PORT=${1:-6000}
  local PID_FILE="/tmp/firefox-debug-$PORT.pid"
  
  if [ -f "$PID_FILE" ]; then
    local PID=$(cat "$PID_FILE")
    kill $PID 2>/dev/null
    rm "$PID_FILE"
    echo "Firefox debug session stopped"
  else
    echo "No Firefox debug session found for port $PORT"
  fi
}
```

## Puppeteer Integration

### Advanced Puppeteer Setup
```javascript
// Enhanced Puppeteer configuration
const puppeteer = require('puppeteer');

class PuppeteerDebugger {
  constructor() {
    this.browser = null;
    this.page = null;
    this.config = {
      headless: 'new',
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-dev-shm-usage',
        '--disable-accelerated-2d-canvas',
        '--no-first-run',
        '--no-zygote',
        '--disable-gpu'
      ],
      defaultViewport: {
        width: 1366,
        height: 768
      }
    };
  }

  async launch(options = {}) {
    const config = { ...this.config, ...options };
    
    try {
      this.browser = await puppeteer.launch(config);
      this.page = await this.browser.newPage();
      
      // Enable request interception
      await this.page.setRequestInterception(true);
      
      // Setup console logging
      this.page.on('console', msg => {
        console.log('Page console:', msg.text());
      });
      
      // Setup error handling
      this.page.on('pageerror', error => {
        console.error('Page error:', error.message);
      });
      
      console.log('Puppeteer browser launched successfully');
      return true;
    } catch (error) {
      console.error('Failed to launch Puppeteer browser:', error);
      return false;
    }
  }

  async networkMonitor(filters = {}) {
    if (!this.page) {
      throw new Error('Page not initialized');
    }

    const networkLogs = [];

    this.page.on('request', request => {
      if (this.matchesFilter(request, filters)) {
        networkLogs.push({
          type: 'request',
          url: request.url(),
          method: request.method(),
          headers: request.headers(),
          timestamp: Date.now()
        });
      }
      request.continue();
    });

    this.page.on('response', response => {
      if (this.matchesFilter(response.request(), filters)) {
        networkLogs.push({
          type: 'response',
          url: response.url(),
          status: response.status(),
          headers: response.headers(),
          timestamp: Date.now()
        });
      }
    });

    return networkLogs;
  }

  matchesFilter(request, filters) {
    if (filters.resourceType && !filters.resourceType.includes(request.resourceType())) {
      return false;
    }
    if (filters.urlPattern && !request.url().match(filters.urlPattern)) {
      return false;
    }
    return true;
  }

  async performanceMetrics() {
    if (!this.page) {
      throw new Error('Page not initialized');
    }

    const metrics = await this.page.metrics();
    const performance = await this.page.evaluate(() => {
      const perfData = performance.getEntriesByType('navigation')[0];
      return {
        domContentLoaded: perfData.domContentLoadedEventEnd - perfData.navigationStart,
        load: perfData.loadEventEnd - perfData.navigationStart,
        firstPaint: performance.getEntriesByType('paint')[0]?.startTime || 0,
        firstContentfulPaint: performance.getEntriesByType('paint')[1]?.startTime || 0
      };
    });

    return { ...metrics, ...performance };
  }

  async lighthouse(url) {
    const lighthouse = require('lighthouse');
    const { port } = new URL(this.browser.wsEndpoint());
    
    const { lhr } = await lighthouse(url, {
      port,
      disableDeviceEmulation: true,
      chromeFlags: ['--disable-mobile-emulation']
    });

    return {
      performance: lhr.categories.performance.score * 100,
      accessibility: lhr.categories.accessibility.score * 100,
      seo: lhr.categories.seo.score * 100,
      bestPractices: lhr.categories['best-practices'].score * 100
    };
  }

  async close() {
    if (this.browser) {
      await this.browser.close();
      this.browser = null;
      this.page = null;
      console.log('Puppeteer browser closed');
    }
  }
}
```

## Playwright Integration

### Multi-Browser Playwright Setup
```javascript
// Playwright multi-browser debugger
const { chromium, firefox, webkit } = require('playwright');

class PlaywrightDebugger {
  constructor() {
    this.browsers = new Map();
    this.pages = new Map();
  }

  async launchAll(options = {}) {
    const browserTypes = [
      { name: 'chromium', engine: chromium },
      { name: 'firefox', engine: firefox },
      { name: 'webkit', engine: webkit }
    ];

    for (const { name, engine } of browserTypes) {
      try {
        const browser = await engine.launch({
          headless: options.headless !== false,
          ...options
        });
        
        const page = await browser.newPage();
        
        // Setup logging
        page.on('console', msg => {
          console.log(`[${name}] Console:`, msg.text());
        });
        
        page.on('pageerror', error => {
          console.error(`[${name}] Error:`, error.message);
        });

        this.browsers.set(name, browser);
        this.pages.set(name, page);
        
        console.log(`${name} browser launched successfully`);
      } catch (error) {
        console.error(`Failed to launch ${name}:`, error.message);
      }
    }
  }

  async crossBrowserTest(url, testFunction) {
    const results = new Map();

    for (const [browserName, page] of this.pages) {
      try {
        console.log(`Testing ${url} on ${browserName}`);
        
        await page.goto(url);
        const result = await testFunction(page, browserName);
        
        results.set(browserName, {
          success: true,
          result
        });
      } catch (error) {
        results.set(browserName, {
          success: false,
          error: error.message
        });
      }
    }

    return results;
  }

  async networkAnalysis(url) {
    const results = new Map();

    for (const [browserName, page] of this.pages) {
      const networkLogs = [];
      
      page.on('request', request => {
        networkLogs.push({
          type: 'request',
          url: request.url(),
          method: request.method(),
          timestamp: Date.now()
        });
      });

      page.on('response', response => {
        networkLogs.push({
          type: 'response',
          url: response.url(),
          status: response.status(),
          timestamp: Date.now()
        });
      });

      await page.goto(url);
      await page.waitForLoadState('networkidle');
      
      results.set(browserName, networkLogs);
    }

    return results;
  }

  async performanceComparison(url) {
    const results = new Map();

    for (const [browserName, page] of this.pages) {
      await page.goto(url);
      
      const metrics = await page.evaluate(() => {
        const perfData = performance.getEntriesByType('navigation')[0];
        return {
          domContentLoaded: perfData.domContentLoadedEventEnd - perfData.navigationStart,
          load: perfData.loadEventEnd - perfData.navigationStart,
          firstPaint: performance.getEntriesByType('paint')[0]?.startTime || 0
        };
      });

      results.set(browserName, metrics);
    }

    return results;
  }

  async closeAll() {
    for (const [name, browser] of this.browsers) {
      await browser.close();
      console.log(`${name} browser closed`);
    }
    
    this.browsers.clear();
    this.pages.clear();
  }
}
```

## Integration Scripts

### Master Debug Controller
```bash
#!/bin/bash

# Master browser debug controller
DEBUG_DIR="/tmp/browser-debug"
CONFIG_FILE="$DEBUG_DIR/debug-config.json"

# Initialize debug environment
init_debug_env() {
  mkdir -p "$DEBUG_DIR"
  
  cat > "$CONFIG_FILE" << EOF
{
  "chrome": {
    "enabled": true,
    "port": 9222,
    "headless": false
  },
  "firefox": {
    "enabled": true,
    "port": 6000,
    "headless": false
  },
  "puppeteer": {
    "enabled": true,
    "headless": true
  },
  "playwright": {
    "enabled": true,
    "browsers": ["chromium", "firefox", "webkit"]
  }
}
EOF
  
  echo "Debug environment initialized at $DEBUG_DIR"
}

# Start all debug services
start_all_debug() {
  echo "Starting all browser debug services..."
  
  # Start Chrome debugging
  start_chrome_debug 9222
  sleep 2
  
  # Start Firefox debugging  
  start_firefox_debug 6000
  sleep 2
  
  echo "All debug services started"
  echo "Chrome DevTools: http://localhost:9222"
  echo "Firefox Debugging: http://localhost:6000"
}

# Stop all debug services
stop_all_debug() {
  echo "Stopping all browser debug services..."
  
  stop_chrome_debug 9222
  stop_firefox_debug 6000
  
  # Clean up temp files
  rm -rf /tmp/chrome-debug-*
  rm -rf /tmp/firefox-debug-*
  
  echo "All debug services stopped"
}

# Health check for debug services
health_check() {
  echo "Checking debug service health..."
  
  # Check Chrome DevTools
  if curl -s http://localhost:9222/json > /dev/null; then
    echo "✅ Chrome DevTools: Running"
  else
    echo "❌ Chrome DevTools: Not responding"
  fi
  
  # Check Firefox debugging
  if curl -s http://localhost:6000 > /dev/null; then
    echo "✅ Firefox Debug: Running"  
  else
    echo "❌ Firefox Debug: Not responding"
  fi
}

# Command dispatcher
case "$1" in
  "init")
    init_debug_env
    ;;
  "start")
    start_all_debug
    ;;
  "stop")
    stop_all_debug
    ;;
  "health")
    health_check
    ;;
  "restart")
    stop_all_debug
    sleep 2
    start_all_debug
    ;;
  *)
    echo "Usage: $0 {init|start|stop|health|restart}"
    echo ""
    echo "Commands:"
    echo "  init    - Initialize debug environment"
    echo "  start   - Start all debug services"
    echo "  stop    - Stop all debug services"
    echo "  health  - Check service health"
    echo "  restart - Restart all services"
    ;;
esac
```

### Usage Examples
```javascript
// Example usage of integrated debugging
async function debugWebsiteComplete(url) {
  console.log(`Starting comprehensive debug for: ${url}`);
  
  // Chrome DevTools debugging
  const chromeDebugger = new ChromeDebugger();
  await chromeDebugger.connect();
  
  // Network monitoring
  const networkLogs = [];
  await chromeDebugger.networkMonitor((params) => {
    networkLogs.push(params);
  });
  
  // Navigate and collect data
  await chromeDebugger.domains.Page.navigate({ url });
  await chromeDebugger.domains.Page.loadEventFired();
  
  // Get performance metrics
  const chromeMetrics = await chromeDebugger.performanceMetrics();
  
  // Cross-browser comparison with Playwright
  const playwrightDebugger = new PlaywrightDebugger();
  await playwrightDebugger.launchAll();
  
  const crossBrowserResults = await playwrightDebugger.crossBrowserTest(url, async (page) => {
    return await page.evaluate(() => {
      return {
        userAgent: navigator.userAgent,
        viewport: { width: window.innerWidth, height: window.innerHeight },
        performance: performance.getEntriesByType('navigation')[0]
      };
    });
  });
  
  // Lighthouse audit
  const puppeteerDebugger = new PuppeteerDebugger();
  await puppeteerDebugger.launch();
  await puppeteerDebugger.page.goto(url);
  const lighthouseReport = await puppeteerDebugger.lighthouse(url);
  
  // Compile comprehensive report
  const debugReport = {
    url,
    timestamp: new Date().toISOString(),
    chrome: {
      metrics: chromeMetrics,
      network: networkLogs
    },
    crossBrowser: Object.fromEntries(crossBrowserResults),
    lighthouse: lighthouseReport
  };
  
  // Cleanup
  await chromeDebugger.close();
  await playwrightDebugger.closeAll();
  await puppeteerDebugger.close();
  
  return debugReport;
}
```

This comprehensive browser debugging setup provides:
- **Chrome DevTools Protocol** integration for deep debugging
- **Firefox Debugging** capabilities with Marionette
- **Puppeteer** for Chrome automation and testing
- **Playwright** for cross-browser testing
- **Automated scripts** for easy setup and management
- **Integration patterns** with other agents in the ecosystem