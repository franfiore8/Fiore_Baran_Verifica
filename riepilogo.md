# 📋 Riepilogo del Lavoro - Verifica GPO 
**Progetto: GreenPixel - L'Eco-Avventura Verticale!**  

---

## 👥 Composizione del Team  

Il progetto **GreenPixel** è stato è stato realizzato in modo autonomo da:**  

| Nome              | Ruolo nel Progetto                          | Contributo principale                                                                 |
| ----------------- | ------------------------------------------- | ------------------------------------------------------------------------------------- |
| **Fiore Francesco** | Sviluppatore, Game Designer, Documentatore, Tester, Gestore del Repository | Progettazione, implementazione, testing, documentazione, gestione di tutto il workflow di sviluppo. |


---

## 📋 Divisione dei Compiti  

Poiché il lavoro è stato svolto in modo autonomo, **tutti i compiti sono stati gestiti direttamente da Fiore Francesco**.  

### **1. Feature 1: Sistema di Cronometro di Gioco**  
*(Branch: `feature/cronometro`)*  

**Attività svolte:**  
- **Analisi e progettazione:** Studio di come implementare un cronometro per misurare il tempo di gioco.  
- **Implementazione:**  
  - Creazione di un nodo `Timer` per misurare il tempo trascorso.  
  - Implementazione di una label nell’HUD per visualizzare il tempo in formato `MM:SS`.  
  - Aggiornamento del timer ogni secondo e sincronizzazione con l’interfaccia utente.  
- **Ottimizzazione:**  
  - Formattazione del tempo con padding a due cifre (es. `02:35`).  
  - Gestione della conversione da secondi a minuti/seconds.  
- **Documentazione:** Creazione del file **`feature_2.md`** con una descrizione tecnica completa (vedi allegato).  
- **Test:** Verifica del corretto avvio, incremento e formattazione del timer, nonché della sua sincronizzazione con l’HUD.

---
### **2. Feature 2: Sistema di Punteggio per Raccolta Rifiuti**  
*(Branch: `feature/sistema-punteggio`)*  

**Attività svolte:**  
- **Analisi e progettazione:** Studio della meccanica di raccolta e smistamento dei rifiuti esistenti, definizione dei tipi di rifiuti (`ROSSO`, `GIALLO`, `BLU`) e dei relativi bidoni.  
- **Creazione degli asset:** Disegno e importazione di sprite dedicati per ogni tipo di rifiuto e per i bidoni corrispondenti.  
- **Implementazione:**  
  - Creazione di nuovi `Node2D` per i rifiuti (`RifiutoRosso`, `RifiutoGiallo`, `RifiutoBlu`).  
  - Implementazione dei bidoni (`BidoneRosso`, `BidoneGiallo`, `BidoneBlu`) come `StaticBody2D`.  
  - Modifica dello script del personaggio (`Player.gd`) per riconoscere i rifiuti e smistarli nei bidoni corretti.  
  - Aggiunta di un sistema di punteggio (`+10` punti per raccolta, `+20` punti per deposito corretto).  
- **Documentazione:** Creazione del file **`feature_1.md`** con una descrizione tecnica dettagliata (vedi allegato).  
- **Test:** Verifica approfondita del corretto funzionamento della raccolta, dello smistamento e dell’aggiornamento del punteggio.  

---
 

### 2. **Creazione dei Branch per le Feature**  

Per ogni feature è stato creato un **branch dedicato**, partendo dal ramo `main`:  

| Feature                   | Nome Branch               | Scopo                                                                 |
| ------------------------- | ------------------------- | --------------------------------------------------------------------- |
| Sistema di Cronometro     | `feature/cronometro`         | Implementazione del cronometro di gioco.                             |
| Sistema di Punteggio      | `feature/sistema-punteggio` | Sviluppo del sistema di punteggio e smistamento rifiuti.             |


> ✅ **Buona pratica:** Ogni branch è stato utilizzato **esclusivamente** per una singola feature, mantenendo `main` sempre stabile.

### 3. **Documentazione delle Feature**  

Per ogni feature è stato creato un file di documentazione nel repository:  


- **`feature_1.md`**  
  - **Oggetto:** Implementazione del sistema di cronometro.  
  - **Contenuto:**  
    - Descrizione della meccanica di misurazione del tempo.  
    - Specifiche tecniche (formato `MM:SS`, aggiornamento ogni secondo).  
    - Layout dell’HUD con il timer.  
    - Test effettuati (avvio, incremento, formattazione, sincronizzazione UI).  
    - Estensioni future (modalità countdown, pausa, record, ecc.).  

- **`feature_2.md`**  
  - **Oggetto:** Implementazione del sistema di punteggio per la raccolta e lo smistamento dei rifiuti.  
  - **Contenuto:**  
    - Descrizione dettagliata delle meccaniche di punteggio.  
    - Tabella completa dei punti assegnati per ogni azione.  
    - Flusso di funzionamento (raccolta e deposito).  
    - Test effettuati (verifica raccolta, deposito, anti-exploit, sincronizzazione UI).  
    - Estensioni future (feedback audio, animazioni, combo, ecc.).  

### 4. **Implementazione delle Feature**  

#### **Strumenti e Tecniche Utilizzate**  
- **Linguaggio:** GDScript (script nativi di Godot Engine).  
