#!/bin/bash

# Script finale per push su GitHub

echo "🚀 Final push to GitHub..."
echo "========================"

cd ~/Sites/claude-code-config

# Controlla stato git
echo "📊 Current repository status:"
git log --oneline -5
echo ""
git status --short

echo ""
echo "📦 Repository contains:"
ls -la | grep -E "\.(md|sh|json)$"

echo ""
echo "🔄 Pushing to GitHub..."

# Push con upstream tracking
git push -u origin main

echo ""
if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    echo ""
    echo "🎉 Repository is now available at:"
    echo "   https://github.com/lushanoperera/claude-code"
    echo ""
    echo "📚 Documentation includes:"
    echo "   ✅ README.md - Project overview"
    echo "   ✅ CLAUDE.md - Main configuration with 100+ agents"
    echo "   ✅ SETUP-GUIDE.md - Complete usage guide"
    echo "   ✅ INSTALLATION.md - Setup instructions"
    echo "   ✅ CREDITS.md - Full acknowledgments to sources"
    echo "   ✅ context7-integration.md - MCP integration guide"
    echo "   ✅ agents.md - Agent catalog"
    echo "   ✅ Sync scripts and automation tools"
    echo ""
    echo "🔧 Next steps for users:"
    echo "   1. Clone: git clone https://github.com/lushanoperera/claude-code.git ~/Sites/claude-code-config"
    echo "   2. Setup: ~/Sites/claude-code-config/setup-sync.sh"
    echo "   3. Activate: source ~/.claude/sync-aliases.sh"
    echo "   4. Use: claude-help"
else
    echo "❌ Push failed. You may need to authenticate:"
    echo ""
    echo "Try one of these methods:"
    echo "1. GitHub CLI: gh auth login"
    echo "2. SSH: git remote set-url origin git@github.com:lushanoperera/claude-code.git"
    echo "3. Token: git remote set-url origin https://TOKEN@github.com/lushanoperera/claude-code.git"
    echo ""
    echo "Then run: git push -u origin main"
fi