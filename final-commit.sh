#!/bin/bash

# Script per completare il commit finale della documentazione

echo "Completing final commit with all documentation..."

# Vai al repository
cd ~/Sites/claude-code-config

# Aggiungi tutti i file
git add .

# Commit con messaggio dettagliato
git commit -m "Add complete setup and usage documentation

- Added SETUP-GUIDE.md with detailed usage instructions
- Added INSTALLATION.md for new users
- Added sync-config.sh and setup-sync.sh scripts  
- Updated CLAUDE.md with quick setup instructions
- Complete workflow documentation with troubleshooting
- Ready for production use"

# Mostra status
echo "Repository status:"
git log --oneline -3
echo ""
echo "Files in repository:"
ls -la

echo ""
echo "✅ Documentation complete!"
echo ""
echo "Next steps:"
echo "1. Push to GitHub: cd ~/Sites/claude-code-config && git push"
echo "2. Test setup: ~/.claude/setup-sync.sh"
echo "3. Activate aliases: source ~/.claude/sync-aliases.sh"