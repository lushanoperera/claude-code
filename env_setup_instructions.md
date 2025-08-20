# Claude Code - Environment Variables Setup

## Istruzioni per configurare le variabili d'ambiente

Per il corretto funzionamento degli MCP, aggiungi le seguenti variabili d'ambiente al tuo shell profile (`.zshrc`, `.bashrc`, etc.):

```bash
# Claude Code MCP Configuration
export GEMINI_API_KEY="AIzaSyD_l2c9joOEuFbWE5Et59Mqx8YEp8SzvP4"
export NOTION_API_KEY="your_notion_api_key_here"
export ASANA_ACCESS_TOKEN="your_asana_access_token_here"
```

## Come applicare le variabili:

1. Apri il tuo file di configurazione shell:
   ```bash
   nano ~/.zshrc  # oppure ~/.bashrc se usi bash
   ```

2. Aggiungi le variabili d'ambiente sopra elencate

3. Ricarica la configurazione:
   ```bash
   source ~/.zshrc  # oppure source ~/.bashrc
   ```

4. Verifica che le variabili siano impostate:
   ```bash
   echo $GEMINI_API_KEY
   ```

## Per ottenere le API Key mancanti:

- **Notion API**: https://developers.notion.com/
- **Asana API**: https://developers.asana.com/

⚠️ **Importante**: Non salvare mai le API key direttamente nei file di configurazione per motivi di sicurezza.