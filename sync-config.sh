#!/bin/bash

# Claude Code Configuration Sync Script
# Sincronizza la configurazione tra ~/.claude e ~/Sites/claude-code-config

# Colori per output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Percorsi
CLAUDE_DIR="$HOME/.claude"
REPO_DIR="$HOME/Sites/claude-code-config"

# Funzione per stampare messaggi colorati
print_msg() {
    echo -e "${GREEN}[SYNC]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Verifica che il repository esista
if [ ! -d "$REPO_DIR" ]; then
    print_error "Repository not found at $REPO_DIR"
    print_msg "Creating repository directory..."
    mkdir -p "$REPO_DIR"
fi

# Funzione per sincronizzare da Claude a Repository
sync_to_repo() {
    print_msg "Syncing from Claude config to repository..."
    
    # Copia CLAUDE.md
    if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
        cp "$CLAUDE_DIR/CLAUDE.md" "$REPO_DIR/CLAUDE.md"
        print_msg "✓ CLAUDE.md synced"
    fi
    
    # Copia settings.json se esiste
    if [ -f "$CLAUDE_DIR/settings.json" ]; then
        cp "$CLAUDE_DIR/settings.json" "$REPO_DIR/settings.json"
        print_msg "✓ settings.json synced"
    fi
    
    # Sincronizza directory agents se esiste
    if [ -d "$CLAUDE_DIR/agents" ]; then
        rsync -av --delete "$CLAUDE_DIR/agents/" "$REPO_DIR/agents/"
        print_msg "✓ agents/ directory synced"
    fi
    
    # Sincronizza directory templates se esiste
    if [ -d "$CLAUDE_DIR/templates" ]; then
        rsync -av --delete "$CLAUDE_DIR/templates/" "$REPO_DIR/templates/"
        print_msg "✓ templates/ directory synced"
    fi
    
    # Sincronizza directory workflows se esiste
    if [ -d "$CLAUDE_DIR/workflows" ]; then
        rsync -av --delete "$CLAUDE_DIR/workflows/" "$REPO_DIR/workflows/"
        print_msg "✓ workflows/ directory synced"
    fi
    
    print_msg "Sync to repository completed!"
}

# Funzione per sincronizzare da Repository a Claude
sync_from_repo() {
    print_msg "Syncing from repository to Claude config..."
    
    # Copia CLAUDE.md
    if [ -f "$REPO_DIR/CLAUDE.md" ]; then
        cp "$REPO_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
        print_msg "✓ CLAUDE.md synced"
    fi
    
    # Copia settings.json se esiste nel repo
    if [ -f "$REPO_DIR/settings.json" ]; then
        cp "$REPO_DIR/settings.json" "$CLAUDE_DIR/settings.json"
        print_msg "✓ settings.json synced"
    fi
    
    # Sincronizza directory agents se esiste
    if [ -d "$REPO_DIR/agents" ]; then
        mkdir -p "$CLAUDE_DIR/agents"
        rsync -av --delete "$REPO_DIR/agents/" "$CLAUDE_DIR/agents/"
        print_msg "✓ agents/ directory synced"
    fi
    
    # Sincronizza directory templates se esiste
    if [ -d "$REPO_DIR/templates" ]; then
        mkdir -p "$CLAUDE_DIR/templates"
        rsync -av --delete "$REPO_DIR/templates/" "$CLAUDE_DIR/templates/"
        print_msg "✓ templates/ directory synced"
    fi
    
    # Sincronizza directory workflows se esiste
    if [ -d "$REPO_DIR/workflows" ]; then
        mkdir -p "$CLAUDE_DIR/workflows"
        rsync -av --delete "$REPO_DIR/workflows/" "$CLAUDE_DIR/workflows/"
        print_msg "✓ workflows/ directory synced"
    fi
    
    print_msg "Sync from repository completed!"
}

# Funzione per creare backup
backup() {
    BACKUP_DIR="$CLAUDE_DIR/backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    print_msg "Creating backup in $BACKUP_DIR..."
    
    # Backup dei file principali
    [ -f "$CLAUDE_DIR/CLAUDE.md" ] && cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP_DIR/"
    [ -f "$CLAUDE_DIR/settings.json" ] && cp "$CLAUDE_DIR/settings.json" "$BACKUP_DIR/"
    [ -d "$CLAUDE_DIR/agents" ] && cp -r "$CLAUDE_DIR/agents" "$BACKUP_DIR/"
    [ -d "$CLAUDE_DIR/templates" ] && cp -r "$CLAUDE_DIR/templates" "$BACKUP_DIR/"
    [ -d "$CLAUDE_DIR/workflows" ] && cp -r "$CLAUDE_DIR/workflows" "$BACKUP_DIR/"
    
    print_msg "✓ Backup created"
}

# Funzione per mostrare lo stato
status() {
    print_msg "Configuration Status:"
    echo ""
    
    echo "Claude Directory: $CLAUDE_DIR"
    [ -f "$CLAUDE_DIR/CLAUDE.md" ] && echo "  ✓ CLAUDE.md exists" || echo "  ✗ CLAUDE.md missing"
    [ -f "$CLAUDE_DIR/settings.json" ] && echo "  ✓ settings.json exists" || echo "  ✗ settings.json missing"
    [ -d "$CLAUDE_DIR/agents" ] && echo "  ✓ agents/ directory exists" || echo "  ✗ agents/ directory missing"
    
    echo ""
    echo "Repository Directory: $REPO_DIR"
    [ -f "$REPO_DIR/CLAUDE.md" ] && echo "  ✓ CLAUDE.md exists" || echo "  ✗ CLAUDE.md missing"
    [ -f "$REPO_DIR/README.md" ] && echo "  ✓ README.md exists" || echo "  ✗ README.md missing"
    [ -d "$REPO_DIR/.git" ] && echo "  ✓ Git repository initialized" || echo "  ✗ Not a git repository"
    
    # Check git status if it's a repository
    if [ -d "$REPO_DIR/.git" ]; then
        echo ""
        echo "Git Status:"
        cd "$REPO_DIR" && git status --short
    fi
}

# Funzione per auto-commit nel repository
auto_commit() {
    if [ -d "$REPO_DIR/.git" ]; then
        cd "$REPO_DIR"
        
        # Aggiungi modifiche
        git add -A
        
        # Verifica se ci sono modifiche
        if ! git diff --cached --quiet; then
            # Commit con timestamp
            COMMIT_MSG="Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
            git commit -m "$COMMIT_MSG"
            print_msg "✓ Changes committed: $COMMIT_MSG"
        else
            print_msg "No changes to commit"
        fi
    else
        print_warning "Repository not initialized at $REPO_DIR"
    fi
}

# Menu principale
case "${1:-}" in
    to-repo)
        sync_to_repo
        auto_commit
        ;;
    from-repo)
        backup
        sync_from_repo
        ;;
    backup)
        backup
        ;;
    status)
        status
        ;;
    watch)
        print_msg "Starting file watcher..."
        print_msg "Watching for changes in $CLAUDE_DIR/CLAUDE.md"
        print_msg "Press Ctrl+C to stop"
        
        # Usa fswatch se disponibile, altrimenti usa un loop
        if command -v fswatch &> /dev/null; then
            fswatch -o "$CLAUDE_DIR/CLAUDE.md" | while read f; do
                print_msg "Change detected, syncing..."
                sync_to_repo
                auto_commit
            done
        else
            print_warning "fswatch not found, using polling method"
            while true; do
                sync_to_repo
                auto_commit
                sleep 60  # Check ogni minuto
            done
        fi
        ;;
    *)
        echo "Claude Code Configuration Sync Tool"
        echo ""
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  to-repo    - Sync from Claude config to repository"
        echo "  from-repo  - Sync from repository to Claude config (creates backup)"
        echo "  backup     - Create a backup of current Claude config"
        echo "  status     - Show sync status"
        echo "  watch      - Watch for changes and auto-sync"
        echo ""
        echo "Examples:"
        echo "  $0 to-repo    # Update repository with latest Claude config"
        echo "  $0 from-repo  # Update Claude config from repository"
        echo "  $0 watch      # Auto-sync on changes"
        exit 1
        ;;
esac