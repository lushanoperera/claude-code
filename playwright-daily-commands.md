# 🚀 Playwright MCP - Daily Commands Cheatsheet

## Setup Status ✅

**Playwright MCP è già configurato e attivo nel tuo sistema!**

La configurazione è già presente in `~/.claude/settings.json`:
- Command: `npx @playwright/mcp@latest`
- Browser: Chromium (default)
- Mode: Headless (per performance ottimali)

Tutti i comandi browser_* sono disponibili immediatamente.

## 📋 Comandi Quotidiani per Laravel

### Testing Rapido
```
"Naviga su localhost:8000 e testa il login con email test@example.com password 123456"

"Apri il mio sito Laravel e verifica che tutte le API rispondano correttamente"

"Testa il form di registrazione con dati validi e invalidi"

"Genera uno screenshot del dashboard admin"
```

### Debug e Troubleshooting
```
"Apri la console del browser su localhost:8000 e cattura tutti gli errori JavaScript"

"Naviga alle mie API e monitora i tempi di risposta"

"Verifica che tutti i link nella navbar funzionino"

"Controlla se ci sono errori 404 o 500 nel sito"
```

### Testing E2E
```
"Completa l'intero flusso di acquisto dall'aggiunta al carrello al pagamento"

"Testa tutte le validazioni del form di contatto"

"Verifica il funzionamento della ricerca con vari termini"

"Simula un utente che si registra, fa login e completa il profilo"
```

## 🎨 Comandi per WordPress

### Testing Theme/Plugin
```
"Naviga su wp-admin, attiva il mio plugin e testa tutte le funzionalità"

"Verifica che il tema sia responsive su mobile, tablet e desktop"

"Crea un nuovo post e testa tutti i blocchi Gutenberg custom"

"Estrai tutti i meta tag SEO dalla homepage"
```

### Content Management
```
"Naviga al pannello WordPress e crea un nuovo articolo con titolo e contenuto di test"

"Verifica che tutte le immagini nella galleria si carichino correttamente"

"Testa l'upload di media nel media library"

"Controlla tutti i widget nella sidebar"
```

## 💻 Comandi Full-Stack

### Testing Multi-Tab
```
"Apri due tab del mio sito e verifica la sincronizzazione real-time"

"Testa il sistema di notifiche aprendo admin e user in tab separate"

"Verifica che il logout in una tab faccia logout anche nelle altre"
```

### Performance Testing
```
"Misura i tempi di caricamento di tutte le pagine principali"

"Monitora le richieste di rete durante la navigazione"

"Genera un report PDF delle performance del sito"
```

## 🔧 Comandi Utility

### Screenshot e Report
```
"Fai uno screenshot fullpage della homepage"

"Genera un PDF del report dashboard"

"Cattura screenshot di tutti gli stati del form (vuoto, con errori, successo)"

"Crea una galleria di screenshot per la documentazione"
```

### Data Extraction
```
"Estrai tutti i prezzi dalla pagina prodotti"

"Raccogli tutti i link esterni dal sito"

"Estrai la struttura degli heading (H1-H6) per analisi SEO"

"Ottieni tutti i testi alt delle immagini"
```

### Form Automation
```
"Compila il form di contatto con dati di test"

"Testa tutti i campi obbligatori lasciandoli vuoti"

"Inserisci dati invalidi e verifica i messaggi di errore"

"Compila un form multi-step fino al completamento"
```

## ⚡ One-Liners Utili

```bash
# Verifica rapida che il sito sia online
"Naviga su [tuo-sito] e verifica che carichi correttamente"

# O usando il comando diretto:
"Usa browser_navigate per andare su [tuo-sito]"

# Test login veloce
"Vai al login e accedi con le credenziali di test"

# Check responsive
"Apri il sito e testalo a 375px, 768px e 1920px di larghezza"

# Estrai dati
"Estrai tutti i titoli H1 e H2 dalla pagina"

# Test ricerca
"Cerca 'test' e verifica i risultati"

# Screenshot comparativo
"Fai screenshot della stessa pagina in Chrome, Firefox e Safari"

# Test 404
"Naviga su una pagina inesistente e verifica la pagina 404"

# Cookie check
"Verifica che il banner cookie funzioni correttamente"

# Test stampa
"Genera un PDF della pagina per verificare il CSS di stampa"

# Performance quick check
"Misura il tempo di caricamento della homepage"
```

## 🎯 Workflow Combinati

### Morning Check
```
1. "Naviga sul sito e verifica che sia online"
2. "Controlla la console per errori JavaScript"
3. "Testa il login con utente admin"
4. "Verifica le funzionalità principali"
5. "Genera screenshot del dashboard"
```

### Pre-Deploy Test
```
1. "Esegui tutti i test di autenticazione"
2. "Verifica tutti i form principali"
3. "Testa i pagamenti con carta di test"
4. "Controlla responsive su tutti i dispositivi"
5. "Genera report PDF completo"
```

### Debug Session
```
1. "Apri DevTools e monitora network"
2. "Cattura tutti gli errori console"
3. "Traccia le chiamate API"
4. "Identifica elementi che non si caricano"
5. "Genera report di debug"
```

## 💡 Tips & Tricks

### Selettori Intelligenti
- Usa testi visibili: "Clicca sul bottone 'Invia'"
- Usa aria-label: "Clicca sull'elemento con aria-label 'menu'"
- Usa data-testid: "Clicca su [data-testid='submit-button']"

### Gestione Tab
- "Lista tutte le tab aperte"
- "Passa alla tab con titolo 'Dashboard'"
- "Chiudi tutte le tab tranne quella attiva"

### Network Control
- "Blocca tutte le richieste a Google Analytics"
- "Simula connessione lenta 3G"
- "Intercetta e logga tutte le chiamate API"

## 🚨 Troubleshooting Comuni

```bash
# Se il browser non si apre
"Installa i browser necessari con: browser_install"

# Se non trova elementi
"Usa browser_snapshot per vedere la struttura della pagina"

# Se i test sono lenti
"Headless mode è già attivo per default"

# Per debug visuale
"Configura headless: false in settings.json per vedere il browser"

# Se servono permessi
"Controlla i permessi del browser per webcam/microfono"
```

## 📊 Metriche da Monitorare

```
"Misura e riporta:"
- Tempo primo byte (TTFB)
- Largest Contentful Paint (LCP)  
- First Input Delay (FID)
- Cumulative Layout Shift (CLS)
- Tempo totale caricamento
- Numero richieste HTTP
- Dimensione totale pagina
```

---

**Pro Tip**: Salva i comandi più usati come alias nel tuo shell:
```bash
alias test-login="echo 'Naviga su localhost:8000 e testa il login'"
alias test-checkout="echo 'Completa intero flusso checkout'"
```

Ricorda: Playwright MCP trasforma i test da codice complesso a semplici comandi in linguaggio naturale! 🚀