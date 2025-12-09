⏱️ Inerimento TIMER

Implementazione di un Timer di gioco visibile nell’interfaccia (HUD)

🎯 Obiettivo

Aggiungere un timer che tenga traccia del tempo di gioco durante il livello.
Il timer deve partire automaticamente all’inizio della partita e deve essere visualizzato sullo schermo.

📝 Descrizione funzionale

All’avvio del livello, il timer inizia da 0 e aumenta ogni secondo (cronometro).

Il tempo deve essere mostrato in un elemento grafico dell’interfaccia (un Label).

Il timer deve rimanere aggiornato per tutta la durata del livello.

Il tempo finale potrà essere usato in futuro per statistiche, punteggio o classifiche.

📍 Dettagli tecnici

Aggiungere un nodo Timer nella scena principale del gioco (es. Main.tscn).

Impostare il Timer su autostart = true e wait_time = 1 (un secondo).

Collegare il segnale timeout() del Timer a uno script che aggiornerà il tempo trascorso.

Creare una variabile che mantiene il tempo totale, ad esempio:

var elapsed_time = 0


Ogni volta che il timer va in timeout:

elapsed_time += 1
hud.update_timer(elapsed_time)


Aggiungere nell’HUD un Label chiamato ad esempio:
"TimerLabel"

🗂️ File coinvolti

scenes/Main.tscn → aggiunta del nodo Timer

scripts/main.gd → logica incrementale del tempo

scenes/HUD.tscn → aggiunta del Label del timer

scripts/hud.gd → funzione per aggiornare il testo del timer

✔️ Criteri di completamento

Il timer appare visibile nell’interfaccia di gioco.

Il tempo aumenta correttamente ogni secondo.

Non si resetta finché non viene ricaricato il livello.
