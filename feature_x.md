# ⏱️ Sistema di Cronometro di Gioco

**Progetto:** GreenPixel - Platform Educativo sulla Raccolta Differenziata  
**Versione:** 1.0.0  
**Engine:** Godot 4.x  

---

## 📋 Sommario

Il Sistema di Cronometro è una meccanica fondamentale che traccia il tempo trascorso durante ogni partita in GreenPixel. Misura la durata della sessione di gioco dall'inizio del livello fino al completamento o al game over, fornendo al giocatore un feedback costante sulla propria velocità e creando le basi per sfide competitive basate sul tempo.

---

## 🎯 Obiettivo della Funzionalità

| Obiettivo | Descrizione |
|-----------|-------------|
| **Tracciare la Durata della Partita** | Il cronometro registra ogni secondo trascorso dall'inizio del livello, permettendo al giocatore di conoscere esattamente quanto tempo ha impiegato per completare la missione di raccolta differenziata. |
| **Incentivare la Velocità** | La visualizzazione del tempo che scorre motiva il giocatore a completare il livello nel minor tempo possibile, aggiungendo un elemento di sfida personale oltre al punteggio. |
| **Abilitare Sfide a Tempo** | Il sistema prepara il terreno per future modalità di gioco con limiti di tempo, dove il giocatore deve raccogliere e smaltire un certo numero di rifiuti entro un tempo prestabilito. |
| **Creare Competizione** | Il tempo finale di ogni partita può essere confrontato con i record precedenti, stimolando il giocatore a migliorare continuamente le proprie prestazioni. |
| **Fornire Feedback Costante** | Il timer sempre visibile nell'HUD permette al giocatore di gestire il proprio ritmo di gioco e prendere decisioni strategiche sul percorso da seguire. |

---

## ⏰ Sistema di Misurazione del Tempo

### Specifiche Tecniche del Cronometro

| Parametro | Valore | Descrizione |
|-----------|:------:|-------------|
| **Unità di Misura** | Secondi | Il tempo viene calcolato e memorizzato in secondi interi |
| **Intervallo di Aggiornamento** | 1 secondo | Il cronometro si incrementa di 1 ogni secondo tramite un nodo Timer |
| **Formato Visualizzazione** | `MM:SS` | Minuti e secondi con padding a due cifre (es. `02:35`) |
| **Valore Iniziale** | `00:00` | Il cronometro parte sempre da zero all'inizio di ogni partita |
| **Valore Massimo** | `99:59` | Limite teorico di 99 minuti e 59 secondi (5999 secondi totali) |
| **Precisione** | ±0 ms | Nessuna deriva grazie all'uso del nodo Timer di Godot |

### Componenti del Sistema

| Componente | Tipo Nodo | Funzione | Proprietà Chiave |
|------------|-----------|----------|------------------|
| **GameTimer** | Timer | Emette segnale `timeout` ogni secondo | `wait_time = 1.0`, `autostart = true` |
| **elapsed_time** | int | Variabile che memorizza i secondi trascorsi | Inizializzata a `0` |
| **timer_label** | Label | Visualizza il tempo formattato nell'HUD | Testo formato `TIMER: MM:SS` |
| **HUD** | CanvasLayer | Contiene la label e gestisce l'aggiornamento | Metodo `update_timer(seconds)` |

### Formula di Conversione

```
FORMATO VISUALIZZATO = "TIMER: " + [minuti con padding] + ":" + [secondi con padding]

Dove:
• minuti = elapsed_time / 60        (divisione intera)
• secondi = elapsed_time % 60       (resto della divisione)
• padding = formattazione a 2 cifre con zeri iniziali
```

### Esempio di Conversione

```
┌────────────────────────────────────────────────────────────────┐
│  ESEMPI DI CONVERSIONE TEMPO                                   │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  elapsed_time = 0                                              │
│  • minuti = 0 / 60 = 0                                         │
│  • secondi = 0 % 60 = 0                                        │
│  • Visualizzato: TIMER: 00:00                                  │
│                                                                │
│  elapsed_time = 45                                             │
│  • minuti = 45 / 60 = 0                                        │
│  • secondi = 45 % 60 = 45                                      │
│  • Visualizzato: TIMER: 00:45                                  │
│                                                                │
│  elapsed_time = 125                                            │
│  • minuti = 125 / 60 = 2                                       │
│  • secondi = 125 % 60 = 5                                      │
│  • Visualizzato: TIMER: 02:05                                  │
│                                                                │
│  elapsed_time = 754                                            │
│  • minuti = 754 / 60 = 12                                      │
│  • secondi = 754 % 60 = 34                                     │
│  • Visualizzato: TIMER: 12:34                                  │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

---


## 🖥️ Interfaccia Utente

### Layout HUD con Timer

```
┌──────────────────────────────────────────────────────────────────────────────────────┐
│  TIMER: 02:35            SCORE: 240                    SACCHI: 🔴 2  🟡 1  🔵 0     │
│       ↑                                                 BIDONI: 🔴 5  🟡 3  🔵 2    │
│       │                                                                              │
│  Cronometro sempre                                                                   │
│  visibile in alto                                                                    │
├──────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                      │
│                                                                                      │
│                                                                                      │
│                              AREA DI GIOCO                                           │
│                                                                                      │
│                                                                                      │
│                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────┘
```

### Specifiche Elemento Timer

| Proprietà | Valore | Descrizione |
|-----------|--------|-------------|
| **Posizione** | Angolo in alto a sinistra | Visibile senza ostacolare il gameplay |
| **Formato Testo** | `TIMER: MM:SS` | Etichetta chiara seguita dal tempo |
| **Font Size** | 24-32px (consigliato) | Grande e leggibile anche su schermi piccoli |
| **Colore Testo** | Bianco con ombra nera | Alto contrasto su qualsiasi sfondo di gioco |
| **Aggiornamento** | Ogni 1 secondo | Sincronizzato con il segnale timeout del Timer |
| **Allineamento** | A sinistra | Coerente con la lettura occidentale |

### Stati Visuali del Timer

| Stato | Aspetto | Quando |
|-------|---------|--------|
| **Normale** | `TIMER: 02:35` (bianco) | Durante il gameplay standard |
| **Iniziale** | `TIMER: 00:00` (bianco) | All'avvio della partita |
| **Avviso Tempo** | `TIMER: 00:30` (giallo) | Ultimi 30 secondi in modalità a tempo (futuro) |
| **Critico** | `TIMER: 00:10` (rosso lampeggiante) | Ultimi 10 secondi in modalità a tempo (futuro) |
| **Fermato** | `TIMER: 05:42` (grigio) | Durante la pausa del gioco (futuro) |

---

## 📊 Timeline di una Partita Tipica

```
TIMELINE CRONOMETRO - PARTITA ESEMPIO
═══════════════════════════════════════════════════════════════════════════════

Tempo       Evento                              Timer Display    elapsed_time
──────────────────────────────────────────────────────────────────────────────
0:00        Inizio partita                      TIMER: 00:00          0
0:01        Primo tick del timer                TIMER: 00:01          1
0:05        Primo sacco raccolto                TIMER: 00:05          5
0:12        Secondo sacco raccolto              TIMER: 00:12         12
0:18        Primo deposito nel bidone           TIMER: 00:18         18
0:30        Mezzo minuto trascorso              TIMER: 00:30         30
0:45        Terzo sacco raccolto                TIMER: 00:45         45
1:00        Un minuto trascorso                 TIMER: 01:00         60
1:15        Secondo deposito                    TIMER: 01:15         75
1:30        Un minuto e mezzo                   TIMER: 01:30         90
2:00        Due minuti trascorsi                TIMER: 02:00        120
2:35        Tutti i rifiuti smaltiti            TIMER: 02:35        155
2:35        FINE PARTITA - Tempo finale         TIMER: 02:35        155

──────────────────────────────────────────────────────────────────────────────
RIEPILOGO PARTITA:
• Tempo totale: 2 minuti e 35 secondi (155 secondi)
• Sacchi raccolti: 8
• Sacchi depositati: 8
• Punteggio finale: 240 punti
═══════════════════════════════════════════════════════════════════════════════
```

---


## ✅ Test Effettuati

| Test | Descrizione | Risultato |
|------|-------------|:---------:|
| **Avvio corretto** | Il timer parte da 00:00 all'inizio della partita | ✅ |
| **Incremento regolare** | Il timer aumenta di 1 secondo ogni secondo reale | ✅ |
| **Formato corretto** | Il tempo viene visualizzato nel formato MM:SS | ✅ |
| **Padding zeri** | Valori sotto 10 mostrano lo zero iniziale (es. 01:05) | ✅ |
| **Transizione minuti** | Passaggio corretto da 00:59 a 01:00 | ✅ |
| **Precisione** | Nessuna deriva temporale su partite lunghe (10+ minuti) | ✅ |
| **UI sincronizzata** | La label si aggiorna esattamente ogni secondo | ✅ |
| **Performance** | Nessun impatto su FPS (stabile 60 FPS) | ✅ |
| **Reset partita** | Il timer torna a 00:00 al restart della scena | ✅ |
| **Indipendenza framerate** | Funziona correttamente a qualsiasi FPS | ✅ |

---

## 🚀 Estensioni Future

| Funzionalità | Descrizione | Priorità |
|--------------|-------------|:--------:|
| **Modalità Countdown** | Timer che conta alla rovescia da un tempo limite impostato | Alta |
| **Pausa Timer** | Possibilità di mettere in pausa il cronometro durante il menu di pausa | Alta |
| **Record Personali** | Salvataggio del miglior tempo per ogni livello | Alta |
| **Feedback Visivo Urgenza** | Cambio colore del timer quando il tempo sta per scadere (giallo → rosso) | Media |
| **Animazione Lampeggio** | Timer lampeggiante negli ultimi 10 secondi della modalità countdown | Media |
| **Suoni Countdown** | Effetti sonori per gli ultimi secondi (tick-tock) | Media |
| **Bonus Tempo** | Oggetti che aggiungono secondi extra in modalità countdown | Media |
| **Classifiche Tempo** | Leaderboard basate sul tempo di completamento | Bassa |
| **Sfide Giornaliere** | Livelli con tempo limite da completare per ricompense | Bassa |
| **Cronometro al Millisecondo** | Precisione maggiore per speedrunner (formato MM:SS.ms) | Bassa |

---


## 📐 Specifiche di Formattazione

### Codice di Formattazione Tempo

```
Formato GDScript:
timer_label.text = "TIMER: %02d:%02d" % [minuti, secondi]

Spiegazione:
• %02d = numero intero con minimo 2 cifre, padding con zeri
• [minuti, secondi] = array di valori da inserire nella stringa

Esempi di output:
• [0, 5]   → "TIMER: 00:05"
• [1, 30]  → "TIMER: 01:30"
• [12, 5]  → "TIMER: 12:05"
• [99, 59] → "TIMER: 99:59"
```

### Logica di Calcolo

```
┌────────────────────────────────────────────────────────────────┐
│  CALCOLO MINUTI E SECONDI DA elapsed_time                     │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  Input: elapsed_time (int) - secondi totali trascorsi         │
│                                                                │
│  Calcolo:                                                      │
│  ─────────                                                     │
│  minuti = elapsed_time / 60    ← Divisione intera              │
│  secondi = elapsed_time % 60   ← Operatore modulo (resto)      │
│                                                                │
│  Output: stringa formattata "TIMER: MM:SS"                     │
│                                                                │
│  Esempio con elapsed_time = 155:                               │
│  • minuti = 155 / 60 = 2                                       │
│  • secondi = 155 % 60 = 35                                     │
│  • Output: "TIMER: 02:35"                                      │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

**Documento Tecnico - GreenPixel v1.0**
