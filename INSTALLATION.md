# 🚀 Claude Code Configuration - Installazione e Setup

## 📋 Overview

Questa configurazione Claude Code fornisce:
- 🤖 **100+ Agenti Specializzati** per ogni tipo di sviluppo
- 🔄 **Sincronizzazione Bidirezionale** tra configurazione attiva e repository
- 📚 **Context7 Integration** per documentazione real-time
- ⚡ **Workflow Automatizzati** per massima produttività

## 🛠️ Installazione Completa

### Opzione 1: Setup da Zero (Nuovo Computer)

```bash
# 1. Clone repository in posizione standard
git clone https://github.com/lushanoperera/claude-code.git ~/Sites/claude-code-config

# 2. Esegui setup automatico
~/Sites/claude-code-config/setup-sync.sh

# 3. Attiva aliases per comandi rapidi
source ~/.claude/sync-aliases.sh
echo 'source ~/.claude/sync-aliases.sh' >> ~/.zshrc  # rende permanente

# 4. Sincronizza configurazione a Claude
claude-sync-from

# 5. Verifica installazione
claude-sync-status
```

### Opzione 2: Setup da Repository Esistente

```bash
# 1. Se hai già il repository, assicurati sia in ~/Sites
mv /path/to/existing/claude-code-config ~/Sites/

# 2. Esegui setup
~/.claude/setup-sync.sh

# 3. Attiva aliases
source ~/.claude/sync-aliases.sh
echo 'source ~/.claude/sync-aliases.sh' >> ~/.zshrc

# 4. Verifica tutto funzioni
claude-sync-status
```

## ✅ Verifica Installazione

Dopo l'installazione, dovresti avere:

```bash
# Struttura directory
ls -la ~/.claude/          # Configurazione attiva
ls -la ~/Sites/claude-code-config/  # Repository di sviluppo

# Comandi funzionanti
claude-help                # Mostra tutti i comandi
claude-sync-status         # Status sincronizzazione
claude-config              # Naviga a ~/.claude
claude-repo                # Naviga al repository
```

## 📝 Primo Utilizzo

### Test Rapido
```bash
# 1. Modifica la configurazione
echo "# Test modifica" >> ~/.claude/CLAUDE.md

# 2. Sync al repository
claude-sync-to

# 3. Commit la modifica
claude-commit "Test installation"

# 4. Controlla che sia tutto OK
claude-sync-status
```

### Setup Auto-Sync (Opzionale)
```bash
# Lancia watcher in background per sync automatico
nohup claude-sync-watch > ~/.claude/sync.log 2>&1 &

# Ora ogni modifica a ~/.claude/CLAUDE.md viene automaticamente:
# - Sincronizzata al repository
# - Committata con timestamp
```

## 🔄 Comandi Essenziali

Una volta installato, questi sono i comandi che userai quotidianamente:

### Workflow di Base
```bash
# Modifica configurazione
nano ~/.claude/CLAUDE.md

# Sincronizza e commit
claude-commit "Added new workflows"

# Push quando pronto
cd ~/Sites/claude-code-config && git push
```

### Sincronizzazione
```bash
claude-sync-to      # Da Claude a Repository
claude-sync-from    # Da Repository a Claude
claude-pull         # Pull dal remote + sync
```

### Navigazione
```bash
claude-config       # cd ~/.claude
claude-repo         # cd ~/Sites/claude-code-config
```

## 🔧 Troubleshooting Installazione

### Problema: "Command not found"
```bash
# Ricarica aliases
source ~/.claude/sync-aliases.sh

# Verifica che il file esista
ls -la ~/.claude/sync-aliases.sh

# Re-run setup se necessario
~/.claude/setup-sync.sh
```

### Problema: "Permission denied"
```bash
# Rendi eseguibili gli script
chmod +x ~/.claude/sync-config.sh
chmod +x ~/.claude/setup-sync.sh
```

### Problema: "Repository not found"
```bash
# Verifica posizione repository
ls -la ~/Sites/claude-code-config/

# Se non esiste, clona nuovamente
git clone https://github.com/lushanoperera/claude-code.git ~/Sites/claude-code-config
```

## 📚 Documentazione Completa

Dopo l'installazione, hai accesso a:

- **`~/.claude/SETUP-GUIDE.md`** - Guida completa all'utilizzo
- **`~/.claude/CLAUDE.md`** - Configurazione principale con tutti gli agenti
- **`~/Sites/claude-code-config/README.md`** - Documentazione del progetto

```bash
# Leggi la guida completa
less ~/.claude/SETUP-GUIDE.md

# Vedi tutti gli agenti disponibili
less ~/.claude/agents.md

# Documentazione Context7
less ~/.claude/context7-integration.md
```

## 🎯 Prossimi Passi

Dopo l'installazione:

1. **Personalizza CLAUDE.md** con le tue preferenze
2. **Aggiungi i tuoi agenti custom** in `agents/`
3. **Crea template personalizzati** in `templates/`
4. **Setup auto-sync** per workflow continuo
5. **Configura GitHub** per collaboration

## 🆘 Supporto

Se hai problemi:

1. **Consulta** `~/.claude/SETUP-GUIDE.md`
2. **Controlla** `claude-sync-status`
3. **Apri issue** su GitHub con output del problema

---

**🎉 Benvenuto nel sistema Claude Code avanzato!**

Ora hai accesso a 100+ agenti specializzati, sincronizzazione automatica, e workflow intelligenti per lo sviluppo full-stack.