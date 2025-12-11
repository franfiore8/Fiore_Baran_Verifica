🕒 Caratteristica: Timer Competitivo per il Tempo di Gioco ⏱️
Descrizione:

🎮 Implementazione di un timer competitivo che parte da 0 secondi e misura il tempo impiegato dal giocatore per completare il livello. L'obiettivo è consentire ai giocatori di competere tra loro per vedere chi completa il gioco nel minor tempo possibile, creando un senso di urgenza e sfida.

| **Obiettivo**                          | **Descrizione**                                                                                                     |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Competizione tra Giocatori**         | Misurare il tempo impiegato per completare il livello e consentire ai giocatori di competere tra loro.              |
| **Senso di Urgenza**                   | Incentivare il completamento rapido del livello, aumentando la pressione del gioco.                                 |
| **Feedback Visivo**                    | Fornire un'indicazione visibile e precisa del tempo trascorso durante il gioco.                                     |
| **Preparazione per Estensioni Future** | Creare le basi per funzionalità aggiuntive come classifiche, salvataggio dei record e altre meccaniche competitive. |

🔧 Implementazione Tecnica:
Componente Tecnico Principale:

Singleton (AutoLoad): TimerManager.gd
Gestisce la logica del timer. Questo script centralizza il controllo del tempo, avviando e fermando il timer, e segnala quando il tempo è cambiato.

UI:

Scena dedicata: TimerUI.tscn
La scena UI mostra il timer sullo schermo. È progettata per essere semplice e facilmente riutilizzabile.

📋 Dettagli Implementativi:
| **Componente**                | **Descrizione**                                                                                                                                                       |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **TimerManager.gd**           | Singleton con segnali `time_changed` e `timer_finished`. Gestisce il timer che parte da **0 secondi** e tiene traccia del tempo impiegato dal giocatore nel livello.  |
| **Tempo Iniziale**            | Il timer parte da **0 secondi** e cresce durante l'intero gioco, senza limiti predefiniti. Viene misurato il tempo impiegato dal giocatore per completare il livello. |
| **Aggiornamento**             | Il timer viene aggiornato ogni frame, utilizzando `_process(delta)`, per garantire precisione in tempo reale.                                                         |
| **Formato Visualizzato**      | Il tempo è visualizzato nel formato **MM:SS** con zero padding (es. **00:05**, **01:23**, **02:45**).                                                                 |
| **Comportamento al Completo** | Quando il livello è completato, il timer si ferma automaticamente e segnala il tempo impiegato dal giocatore.                                                         |
| **Effetti Visivi**            | Il timer cambia colore (da verde a rosso/arancione) quando si avvicina al termine del livello, enfatizzando la competizione e l'urgenza.                              |

🖼️ Interfaccia Utente:
| **Posizione**           | **Descrizione**                                                                                                                                                           |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Posizione del Timer** | Il timer è visibile nell'angolo in alto a sinistra della schermata, per una visualizzazione non invasiva ma sempre chiara.                                                |
| **Formato del Tempo**   | Il tempo è visualizzato nel formato **MM:SS**, con **zero padding** per garantire un aspetto uniforme.                                                                    |
| **Stile del Timer**     | Font grande con **alto contrasto** per garantire la leggibilità. Il timer cambia colore quando il tempo rimanente è critico, per aumentare la tensione (rosso/arancione). |

✅ Test Effettuati:
| **Test**                     | **Descrizione**                                                                                             |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------- |
| **Inizio Timer**             | Il timer parte correttamente da **0 secondi** all'inizio del livello.                                       |
| **Formato Visualizzazione**  | Il tempo viene visualizzato nel formato **MM:SS**, con **zero padding**.                                    |
| **Timer Infinito**           | Il timer cresce senza limiti fino al completamento del livello.                                             |
| **Feedback in Tempo Reale**  | Il tempo impiegato viene visualizzato in tempo reale, aggiornando il timer ogni frame.                      |
| **Arresto del Timer**        | Il timer si ferma automaticamente quando il livello è completato e mostra il tempo impiegato dal giocatore. |
| **Compatibilità Frame Rate** | Il timer funziona correttamente su vari **frame rate** e su diverse **risoluzioni**.                        |
| **Visibilità UI**            | Il timer è visibile nell'interfaccia utente, senza interferire con altre componenti del gioco.              |

🚀 Possibili Estensioni Future:
| **Funzionalità**                    | **Descrizione**                                                                                                                                       |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Bonus Tempo**                     | Oggetti speciali che il giocatore può raccogliere per guadagnare **+10s** o **+20s** extra durante il gioco.                                          |
| **Classifiche e Salvataggio Tempi** | Creazione di **classifiche** locali e online per confrontare i migliori tempi, con la possibilità di **salvare il record**.                           |
| **Livelli con Tempi Diversi**       | Aggiungere **livelli** con **tempi di completamento variabili** per aumentare la difficoltà.                                                          |
| **Modalità Speedrun**               | Modalità di gioco dove il giocatore deve completare il livello nel **minor tempo possibile**, con un sistema di punteggio basato sul tempo impiegato. |
