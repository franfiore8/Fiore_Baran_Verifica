🕒 Caratteristica: Timer Competitivo per il Tempo di Gioco  
⏱️ **Descrizione**

🎮 Implementazione di un timer competitivo che parte da 0 secondi e misura il tempo impiegato dal giocatore per completare il livello. L'obiettivo è consentire ai giocatori di competere tra loro per vedere chi completa il gioco nel minor tempo possibile, creando un senso di urgenza e sfida.

---

# 🎯 Obiettivi

- **Competizione tra Giocatori** → Misurare il tempo impiegato per completare il livello e consentire ai giocatori di competere tra loro.  
- **Senso di Urgenza** → Incentivare il completamento rapido del livello, aumentando la pressione del gioco.  
- **Feedback Visivo** → Fornire un'indicazione visibile e precisa del tempo trascorso durante il gioco.  
- **Preparazione per Estensioni Future** → Creare le basi per funzionalità aggiuntive come classifiche, salvataggio dei record e altre meccaniche competitive.  

---

# 🔧 Implementazione Tecnica

**Componente Tecnico Principale**  
- **Singleton (AutoLoad): TimerManager.gd** → Gestisce la logica del timer, avviando e fermando il conteggio e inviando segnali quando il tempo cambia.  
- **UI: TimerUI.tscn** → Scena dedicata che mostra il timer sullo schermo, semplice e riutilizzabile.  
- **Separazione tra Logica e Presentazione** → La logica è separata dalla visualizzazione per mantenere il codice pulito e gestibile.  

---

# 📋 Dettagli Implementativi

- **TimerManager.gd** → Singleton con segnali `time_changed` e `timer_finished`.  
- **Tempo Iniziale** → Parte da 0 secondi e cresce senza limiti fino al completamento.  
- **Aggiornamento** → Aggiornato ogni frame con `_process(delta)` per garantire precisione.  
- **Formato Visualizzato** → MM:SS con zero padding (es. 00:05, 01:23, 02:45).  
- **Comportamento al Completo** → Si ferma automaticamente e segnala il tempo finale.  
- **Effetti Visivi** → Cambio colore (verde → arancione/rosso) per enfatizzare urgenza e competizione.  

---

# 🖼️ Interfaccia Utente

- **Posizione del Timer** → In alto a sinistra, chiaro ma non invasivo.  
- **Formato del Tempo** → MM:SS con zero padding uniforme.  
- **Stile del Timer** → Font grande, alto contrasto, cambio colore in fase critica.  

---

# ✅ Test Effettuati

- **Inizio Timer** → Parte correttamente da 0 secondi.  
- **Formato Visualizzazione** → Mostra MM:SS con zero padding.  
- **Timer Infinito** → Continua a crescere fino al completamento.  
- **Feedback in Tempo Reale** → Aggiornamento ogni frame.  
- **Arresto del Timer** → Si ferma automaticamente al completamento.  
- **Compatibilità Frame Rate** → Funziona su diversi frame rate e risoluzioni.  
- **Visibilità UI** → Sempre chiaro e non interferente.  

---

# 🚀 Possibili Estensioni Future

- **Bonus Tempo** → Oggetti che aggiungono +10s o +20s.  
- **Classifiche e Salvataggio Tempi** → Locali e online, con record salvati.  
- **Livelli con Tempi Diversi** → Difficoltà variabile.  
- **Modalità Speedrun** → Punteggio basato sul tempo impiegato.  
