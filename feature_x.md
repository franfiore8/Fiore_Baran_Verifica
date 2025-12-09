# Feature: Timer di Livello con Countdown

## Descrizione
Implementazione di un **timer di livello** con countdown decrescente visibile in gioco.  
Il timer parte da **2 minuti (120 secondi)** e, una volta terminato, determina la fine della partita (Game Over).

## Obiettivo
- Aumentare il senso di urgenza e sfida durante il gameplay  
- Incoraggiare il giocatore a completare il livello in modo efficiente  
- Fornire un feedback visivo chiaro e professionale del tempo rimanente  
- Preparare la base per future meccaniche (es. bonus tempo, classifiche)

## Implementazione tecnica

### Architettura scelta
- **Singleton (AutoLoad)**: `TimerManager.gd` → gestisce la logica del tempo in modo centralizzato  
- **Scena UI dedicata**: `TimerUI.tscn` → interfaccia pulita e riutilizzabile  
- Separazione netta tra logica e presentazione (best practice)

### Dettagli implementativi
| Componente                  | Descrizione                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| `TimerManager.gd`           | Singleton con segnali `time_changed` e `timer_finished`                    |
| Tempo iniziale              | 120 secondi (configurabile tramite `@export var starting_time`)            |
| Aggiornamento               | Basato su `_process(delta)` per precisione al frame                         |
| Formato visualizzato        | `MM:SS` (es. `01:47`) con zero padding                                      |
| Comportamento a zero        | Emissione segnale `timer_finished` → Game Over                              |
| Effetti visivi              | Testo diventa rosso/arancione quando rimangono meno di 20 secondi         |

## Interfaccia utente
- Posizione: angolo **in alto a sinistra**  
- Testo: `02:00` → `01:23` → `00:05` → `00:00` (rosso)  
- Stile: font grande, contrasto elevato, animazione colore negli ultimi secondi

## Test effettuati
- Il timer parte correttamente all'avvio del livello  
- Il formato è sempre `MM:SS` con due cifre  
- Il segnale `timer_finished` viene emesso esattamente a 0.00  
- Il gioco si blocca e mostra schermata Game Over  
- Funziona correttamente su diversi frame rate

## Possibili estensioni future
- Bonus tempo (+10s, +20s) raccogliendo oggetti speciali  
- Record del tempo migliore (salvataggio locale)  
- Livelli con tempi diversi  
- Modalità "Speedrun"
