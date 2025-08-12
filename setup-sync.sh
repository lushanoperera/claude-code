#!/bin/bash

# Setup script for Claude Code Configuration Sync
# This script creates the necessary structure and symlinks

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Claude Code Configuration Setup${NC}"
echo "================================"

# Create symlink for quick access
if [ ! -L "$HOME/.claude/repo" ]; then
    ln -s "$HOME/Sites/claude-code-config" "$HOME/.claude/repo"
    echo -e "${GREEN}✓${NC} Created symlink: ~/.claude/repo → ~/Sites/claude-code-config"
fi

# Create aliases file for easy commands
cat > "$HOME/.claude/sync-aliases.sh" << 'EOF'
# Claude Code Sync Aliases
# Add this to your ~/.bashrc or ~/.zshrc:
# source ~/.claude/sync-aliases.sh

# Quick sync commands
alias claude-sync-to="~/.claude/sync-config.sh to-repo"
alias claude-sync-from="~/.claude/sync-config.sh from-repo"
alias claude-sync-status="~/.claude/sync-config.sh status"
alias claude-sync-watch="~/.claude/sync-config.sh watch"
alias claude-backup="~/.claude/sync-config.sh backup"

# Quick navigation
alias claude-config="cd ~/.claude"
alias claude-repo="cd ~/Sites/claude-code-config"

# Git shortcuts for the repo
claude-commit() {
    cd ~/Sites/claude-code-config
    ~/.claude/sync-config.sh to-repo
    git add -A
    git commit -m "${1:-'Update configuration'}"
    echo "Changes committed. Use 'git push' to upload to GitHub"
}

claude-push() {
    cd ~/Sites/claude-code-config
    ~/.claude/sync-config.sh to-repo
    git add -A
    git commit -m "${1:-'Update configuration'}"
    git push
}

claude-pull() {
    cd ~/Sites/claude-code-config
    git pull
    ~/.claude/sync-config.sh from-repo
    echo "Repository updated and synced to Claude config"
}

# Show help
claude-help() {
    echo "Claude Code Configuration Commands:"
    echo "  claude-sync-to      - Sync config to repository"
    echo "  claude-sync-from    - Sync config from repository"
    echo "  claude-sync-status  - Show sync status"
    echo "  claude-sync-watch   - Watch for changes"
    echo "  claude-backup       - Create backup"
    echo "  claude-commit [msg] - Sync and commit changes"
    echo "  claude-push [msg]   - Sync, commit and push"
    echo "  claude-pull         - Pull and sync from repo"
    echo "  claude-config       - Go to ~/.claude"
    echo "  claude-repo         - Go to repository"
}
EOF

echo -e "${GREEN}✓${NC} Created sync aliases file"

# Add to shell configuration
echo ""
echo -e "${YELLOW}To enable quick commands, add this line to your shell config:${NC}"
echo ""
echo "  # For bash (~/.bashrc):"
echo "  source ~/.claude/sync-aliases.sh"
echo ""
echo "  # For zsh (~/.zshrc):"
echo "  source ~/.claude/sync-aliases.sh"
echo ""

# Create initial sync
echo "Performing initial sync..."
~/.claude/sync-config.sh to-repo

echo ""
echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo "Quick Start:"
echo "  1. Source the aliases: source ~/.claude/sync-aliases.sh"
echo "  2. Check status: claude-sync-status"
echo "  3. Make changes to ~/.claude/CLAUDE.md"
echo "  4. Sync to repo: claude-sync-to"
echo "  5. Commit changes: claude-commit 'Your message'"
echo ""
echo "For help: claude-help"