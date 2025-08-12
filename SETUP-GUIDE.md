# Claude Code Configuration - Setup e Utilizzo Completo

## 📋 Indice

- [Panoramica](#panoramica)
- [Setup Iniziale](#setup-iniziale)
- [Comandi Disponibili](#comandi-disponibili)
- [Workflow Quotidiano](#workflow-quotidiano)
- [Sincronizzazione Avanzata](#sincronizzazione-avanzata)
- [Troubleshooting](#troubleshooting)

## 🎯 Panoramica

Questo sistema fornisce una sincronizzazione bidirezionale tra:
- **Configurazione Attiva**: `~/.claude/` (utilizzata da Claude Code)
- **Repository di Sviluppo**: `~/Sites/claude-code-config` (per versioning e backup)

## 🚀 Setup Iniziale

### Passo 1: Verifica Posizione Repository
```bash
# Il repository dovrebbe essere in ~/Sites/claude-code-config
ls -la ~/Sites/claude-code-config/
```

### Passo 2: Esegui Setup Automatico
```bash
# Esegui lo script di setup
~/.claude/setup-sync.sh
```

Questo script:
- ✅ Crea symlink `~/.claude/repo` → `~/Sites/claude-code-config`
- ✅ Genera file aliases per comandi rapidi
- ✅ Esegue sincronizzazione iniziale
- ✅ Mostra istruzioni per attivare aliases

### Passo 3: Attiva Aliases (Raccomandato)
```bash
# Aggiungi al tuo shell profile (~/.bashrc o ~/.zshrc)
echo 'source ~/.claude/sync-aliases.sh' >> ~/.zshrc  # per zsh
echo 'source ~/.claude/sync-aliases.sh' >> ~/.bashrc # per bash

# Oppure carica per la sessione corrente
source ~/.claude/sync-aliases.sh
```

### Passo 4: Verifica Setup
```bash
# Controlla stato sincronizzazione
claude-sync-status

# Test comando rapido
claude-help
```

## 📝 Comandi Disponibili

### Comandi Base (sempre disponibili)

```bash
# Script di sincronizzazione principale
~/.claude/sync-config.sh [comando]

# Comandi disponibili:
~/.claude/sync-config.sh to-repo      # Claude → Repository
~/.claude/sync-config.sh from-repo    # Repository → Claude (con backup)
~/.claude/sync-config.sh status       # Mostra stato sync
~/.claude/sync-config.sh backup       # Crea backup manuale
~/.claude/sync-config.sh watch        # Auto-sync continuo
```

### Aliases Rapidi (dopo setup)

```bash
# Sincronizzazione
claude-sync-to          # Sync da Claude a repository
claude-sync-from        # Sync da repository a Claude
claude-sync-status      # Stato sincronizzazione
claude-sync-watch       # Auto-sync in background
claude-backup           # Crea backup

# Navigazione
claude-config          # cd ~/.claude
claude-repo            # cd ~/Sites/claude-code-config

# Git Workflow
claude-commit "msg"    # Sync + commit con messaggio
claude-push "msg"      # Sync + commit + push
claude-pull            # Pull dal remote + sync a Claude

# Aiuto
claude-help            # Mostra tutti i comandi
```

## 🔄 Workflow Quotidiano

### Scenario 1: Modifiche Locali
```bash
# 1. Modifica la configurazione
nano ~/.claude/CLAUDE.md

# 2. Sync al repository
claude-sync-to

# 3. Commit delle modifiche
claude-commit "Added new Laravel workflows"

# 4. Push quando pronto (opzionale)
cd ~/Sites/claude-code-config && git push
```

### Scenario 2: Sincronizzazione Team
```bash
# Pull modifiche dal team
claude-pull

# Le modifiche sono automaticamente applicate a ~/.claude/
```

### Scenario 3: Auto-Sync Continuo
```bash
# Lancia watcher in background
claude-sync-watch &

# Ora ogni modifica a ~/.claude/CLAUDE.md viene automaticamente:
# - Sincronizzata al repository
# - Committata con timestamp
```

## ⚙️ Sincronizzazione Avanzata

### File Sincronizzati
```
~/.claude/
├── CLAUDE.md              → ~/Sites/claude-code-config/CLAUDE.md
├── settings.json          → ~/Sites/claude-code-config/settings.json
├── agents/               → ~/Sites/claude-code-config/agents/
├── templates/            → ~/Sites/claude-code-config/templates/
└── workflows/            → ~/Sites/claude-code-config/workflows/
```

### Backup Automatico
```bash
# Ogni sync da repository crea backup in:
~/.claude/backups/YYYYMMDD_HHMMSS/

# Lista backup disponibili
ls -la ~/.claude/backups/
```

### Monitoraggio
```bash
# Status dettagliato
claude-sync-status

# Output esempio:
# Claude Directory: /Users/user/.claude
#   ✓ CLAUDE.md exists
#   ✓ settings.json exists
#   ✓ agents/ directory exists
# 
# Repository Directory: /Users/user/Sites/claude-code-config
#   ✓ CLAUDE.md exists
#   ✓ README.md exists
#   ✓ Git repository initialized
```

## 🔧 Casi d'Uso Avanzati

### Setup Nuovo Computer
```bash
# 1. Clone repository
git clone https://github.com/yourusername/claude-code.git ~/Sites/claude-code-config

# 2. Setup sincronizzazione
~/Sites/claude-code-config/setup-sync.sh

# 3. Sync configurazione a Claude
claude-sync-from
```

### Sviluppo Collaborativo
```bash
# Branch per nuove features
cd ~/Sites/claude-code-config
git checkout -b feature/new-agents

# Modifica, sync, commit
claude-commit "Added AI agents"

# Push branch
git push -u origin feature/new-agents
```

### Restore da Backup
```bash
# Lista backup
ls ~/.claude/backups/

# Restore manuale
cp -r ~/.claude/backups/20250112_143000/* ~/.claude/

# Re-sync
claude-sync-to
```

## 🛠️ Troubleshooting

### Problema: "Repository not found"
```bash
# Verifica percorso
ls -la ~/Sites/claude-code-config/

# Se non esiste, clona da GitHub
git clone YOUR_REPO_URL ~/Sites/claude-code-config
```

### Problema: "Permission denied"
```bash
# Rendi eseguibili gli script
chmod +x ~/.claude/sync-config.sh
chmod +x ~/.claude/setup-sync.sh
```

### Problema: "Git conflicts"
```bash
# Vai al repository
claude-repo

# Risolvi conflitti manualmente
git status
git diff

# Dopo risoluzione
git add .
git commit -m "Resolved conflicts"
claude-sync-from
```

### Problema: "Sync out of sync"
```bash
# Forza sync completo
claude-backup                    # Crea backup di sicurezza
claude-sync-from                # Sync da repository (autoritativo)
# oppure
claude-sync-to                  # Sync da Claude (autoritativo)
```

### Problema: "Auto-sync non funziona"
```bash
# Installa fswatch per monitoring ottimale
brew install fswatch   # macOS
# oppure usa polling mode (automatico fallback)

# Test watcher
claude-sync-watch
```

## 📊 Monitoring e Diagnostica

### Health Check Completo
```bash
# Status generale
claude-sync-status

# Verifica git
cd ~/Sites/claude-code-config
git status
git log --oneline -5

# Verifica backup
ls -la ~/.claude/backups/ | tail -5
```

### Log e Debug
```bash
# Per debug degli script, aggiungi -x
bash -x ~/.claude/sync-config.sh status

# Log git
cd ~/Sites/claude-code-config
git log --stat -3
```

## 🔒 Sicurezza e Best Practices

### File Sensibili
- ✅ `.env` files sono esclusi da git
- ✅ Backup automatici creati prima di ogni sync
- ✅ File personali non vengono sincronizzati

### Raccomandazioni
1. **Commit Frequenti**: Usa `claude-commit` spesso
2. **Backup Regolari**: I backup automatici vengono conservati
3. **Branch per Features**: Usa git branches per sviluppo
4. **Review Changes**: Controlla `git diff` prima dei commit

## 🆘 Comandi di Emergenza

```bash
# PANIC: Ripristina tutto
claude-backup                           # Backup corrente
claude-sync-from                        # Restore da repository
source ~/.claude/sync-aliases.sh        # Ricarica aliases

# PANIC: Repository corrotto
cd ~/Sites/
rm -rf claude-code-config
git clone YOUR_REPO_URL claude-code-config
~/.claude/setup-sync.sh

# PANIC: Claude config corrotto
claude-sync-from                        # Restore da repository
```

---

**📞 Supporto**: Per problemi, controlla prima questo file, poi apri un issue su GitHub.

**📅 Ultimo aggiornamento**: 2025-01-12