#!/bin/bash

# Playwright MCP Integration Test Script
# This script helps verify that Playwright MCP is correctly integrated

echo "🧪 Playwright MCP Integration Test"
echo "=================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Check Node.js version
echo "1️⃣  Checking Node.js version..."
NODE_VERSION=$(node -v 2>/dev/null)
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Node.js installed: $NODE_VERSION${NC}"
    # Check if version is 18 or higher
    MAJOR_VERSION=$(echo $NODE_VERSION | cut -d'.' -f1 | sed 's/v//')
    if [ $MAJOR_VERSION -ge 18 ]; then
        echo -e "${GREEN}✓ Node.js version is 18 or higher${NC}"
    else
        echo -e "${RED}✗ Node.js version must be 18 or higher${NC}"
        echo "  Run: brew install node (on macOS) or visit nodejs.org"
    fi
else
    echo -e "${RED}✗ Node.js not found${NC}"
    echo "  Install from: https://nodejs.org"
    exit 1
fi
echo ""

# Step 2: Check if Playwright MCP can be installed
echo "2️⃣  Checking Playwright MCP availability..."
npx @playwright/mcp@latest --version 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Playwright MCP is available${NC}"
else
    echo -e "${YELLOW}⚠ Installing Playwright MCP...${NC}"
    npx @playwright/mcp@latest
fi
echo ""

# Step 3: Check for config file
echo "3️⃣  Checking MCP configuration..."
CONFIG_FILE="$HOME/.config/claude_desktop/config.json"
if [ -f "$CONFIG_FILE" ]; then
    echo -e "${GREEN}✓ Config file exists at: $CONFIG_FILE${NC}"
    
    # Check if playwright is configured
    if grep -q "playwright" "$CONFIG_FILE"; then
        echo -e "${GREEN}✓ Playwright configuration found${NC}"
    else
        echo -e "${YELLOW}⚠ Playwright not configured in config.json${NC}"
        echo "  Add the configuration shown in mcp-playwright-setup.md"
    fi
else
    echo -e "${YELLOW}⚠ Config file not found${NC}"
    echo "  Creating config directory and file..."
    mkdir -p "$HOME/.config/claude_desktop"
    
    # Create basic config
    cat > "$CONFIG_FILE" << 'EOF'
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
        "capabilities": {
          "tabs": true,
          "pdf": true,
          "bringToFront": true
        }
      }
    }
  }
}
EOF
    echo -e "${GREEN}✓ Config file created with Playwright configuration${NC}"
fi
echo ""

# Step 4: Check if browsers are installed
echo "4️⃣  Checking Playwright browsers..."
if [ -d "$HOME/Library/Caches/ms-playwright" ]; then
    echo -e "${GREEN}✓ Playwright browsers directory found${NC}"
else
    echo -e "${YELLOW}⚠ Playwright browsers not installed${NC}"
    echo "  Installing browsers..."
    npx playwright install
fi
echo ""

# Step 5: Test basic Playwright functionality
echo "5️⃣  Testing Playwright functionality..."
cat > /tmp/test-playwright.js << 'EOF'
const { chromium } = require('playwright');

(async () => {
  try {
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();
    await page.goto('https://example.com');
    const title = await page.title();
    console.log('✓ Successfully navigated to example.com');
    console.log('  Page title:', title);
    await browser.close();
    process.exit(0);
  } catch (error) {
    console.error('✗ Error:', error.message);
    process.exit(1);
  }
})();
EOF

npx playwright test /tmp/test-playwright.js 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Playwright is working correctly${NC}"
else
    # Try with node directly
    node /tmp/test-playwright.js 2>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Playwright is working correctly${NC}"
    else
        echo -e "${YELLOW}⚠ Playwright test failed - installing dependencies${NC}"
        npx playwright install-deps
    fi
fi
rm -f /tmp/test-playwright.js
echo ""

# Step 6: Summary
echo "📊 Integration Summary"
echo "====================="

ALL_GOOD=true

# Check each component
if [ $MAJOR_VERSION -ge 18 ] 2>/dev/null; then
    echo -e "${GREEN}✓ Node.js 18+${NC}"
else
    echo -e "${RED}✗ Node.js version issue${NC}"
    ALL_GOOD=false
fi

if [ -f "$CONFIG_FILE" ] && grep -q "playwright" "$CONFIG_FILE" 2>/dev/null; then
    echo -e "${GREEN}✓ MCP Configuration${NC}"
else
    echo -e "${YELLOW}⚠ MCP Configuration needs attention${NC}"
    ALL_GOOD=false
fi

if [ -d "$HOME/Library/Caches/ms-playwright" ]; then
    echo -e "${GREEN}✓ Browsers installed${NC}"
else
    echo -e "${YELLOW}⚠ Browsers need installation${NC}"
    ALL_GOOD=false
fi

echo ""

if [ "$ALL_GOOD" = true ]; then
    echo -e "${GREEN}🎉 Playwright MCP is ready to use!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Restart Claude Code"
    echo "2. Try: 'Navigate to https://example.com and take a screenshot'"
    echo "3. Check playwright-daily-commands.md for more examples"
else
    echo -e "${YELLOW}⚠ Some components need attention${NC}"
    echo ""
    echo "To complete setup:"
    echo "1. Fix any issues mentioned above"
    echo "2. Run this script again to verify"
    echo "3. Restart Claude Code after all checks pass"
fi

echo ""
echo "📚 Documentation files:"
echo "  - mcp-playwright-setup.md (setup guide)"
echo "  - playwright-daily-commands.md (command reference)"
echo "  - workflows/playwright-testing.md (testing workflows)"