# 🏁 RaceTimer Datapack per Minecraft

Un sistema professionale di cronometraggio per circuiti di gara in Minecraft con gestione settori, record mondiali e personal best.

## 📋 Caratteristiche Principali

- **⏱️ Cronometraggio Preciso**: Sistema di timing con precisione al centesimo di secondo
- **📊 Gestione Record**: World Record (WR) e Personal Best (PB) per ogni settore e giro completo
- **🚦 Sistema Semaforo**: Partenze sincronizzate con delay randomico (1-7 secondi)
- **📈 Dashboard Live**: Bossbar dinamiche che mostrano WR, PB e tempo live in tempo reale
- **🎯 Multi-Circuito**: Supporto per circuiti multipli con numero variabile di settori
- **🔄 Pool Bossbar**: Sistema ottimizzato con 15 bossbar riutilizzabili

## 🎮 Circuiti Disponibili

### 1. Snowy Race (5 settori)
- **Coordinate partenza**: 882343, 248, -102491
- **Settori**: 5
- **Particolarità**: Circuito più lungo con percorso innevato

### 2. Deserto (4 settori)
- **Coordinate partenza**: -1539, 65, -810
- **Settori**: 4
- **Particolarità**: Circuito nel deserto

### 3. Savana (3 settori)
- **Settori**: 3
- **Status**: Da implementare

## 🛠️ Installazione

1. Scarica il datapack
2. Posizionalo nella cartella `datapacks` del tuo mondo
3. Esegui `/reload` o riavvia il mondo
4. Il sistema si inizializzerà automaticamente

## 📖 Comandi Principali

### Gestione Griglie di Partenza
```
/function racetimer:circuits/[nome_circuito]/grid_setup    # Prepara la griglia
/function racetimer:circuits/[nome_circuito]/grid_clear    # Rimuove la griglia
/function racetimer:circuits/[nome_circuito]/grid          # Comando rapido setup
```

### Gestione Record
```
/function racetimer:circuits/[nome_circuito]/show_records  # Mostra i WR del circuito
/execute as @p run function racetimer:circuits/[nome_circuito]/show_pb  # Mostra i tuoi PB
/function racetimer:circuits/[nome_circuito]/reset_wr      # Reset WR (admin)
/execute as @p run function racetimer:circuits/[nome_circuito]/reset_pb  # Reset dei tuoi PB
/function racetimer:circuits/[nome_circuito]/reset_pb_all  # Reset PB di tutti
```

### Utility
```
/function racetimer:show_records   # Menu selezione circuito per record
```

## 🏃 Come Funziona

### Partenza
1. I giocatori si posizionano sulla griglia di partenza
2. Un giocatore preme il bottone del semaforo
3. Le 5 luci si accendono sequenzialmente (0.5s ciascuna)
4. Dopo un delay random (1-7 secondi), le luci si spengono
5. I blocchi vengono rimossi e la gara inizia

### Durante la Gara
- Il sistema registra automaticamente i tempi di passaggio nei settori
- La bossbar mostra in tempo reale:
  - **Viola**: Stai battendo il WR
  - **Verde**: Stai battendo il tuo PB
  - **Bianco**: Tempo normale
- Confronto live con WR e PB del settore corrente

### Arrivo
- Tempo totale e di ogni settore registrato
- Confronto automatico con record precedenti
- Messaggio con "(previous X:XX.XX)" quando batti un record

## 🎨 Formato Tempi

I tempi sono mostrati nel formato `M:SS.CC`:
- `M` = minuti (senza zero iniziale)
- `SS` = secondi (con zero iniziale se < 10)
- `CC` = centesimi (con zero iniziale se < 10)

Esempi: `1:07.50`, `0:09.25`, `2:30.00`

## ⚙️ Dettagli Tecnici

### Scoreboard Principali
- `tempo`: Tempo in tick da calcolare
- `minuti`, `secondi_resto`, `centesimi`: Componenti tempo
- `sec_decine`, `sec_unita`, `cent_decine`, `cent_unita`: Per formattazione
- `player_bossbar_id`: ID della bossbar assegnata (1-15)
- `pb_s[1-5]_[circuito]`: Personal best per settore
- `pb_total_[circuito]`: Personal best giro completo

### Storage
- `racetimer:[nome_circuito]`: Contiene i record del circuito
- `racetimer:temp`: Storage temporaneo per operazioni
- `racetimer:current`: Circuito attualmente in uso per semaforo

### Tag Giocatore
- `partito_[circuito]`: Il giocatore è in gara
- `settore[1-5]_[circuito]`: Settore raggiunto
- `starting_race`: Giocatore in attesa di partenza

## 🐛 Risoluzione Problemi

**La bossbar non appare:**
- Verifica di essere entro l'area del circuito
- Controlla che non ci siano già 15 giocatori in gara

**I tempi non vengono registrati:**
- Assicurati di passare esattamente nelle coordinate dei trigger
- Verifica di avere i tag corretti con `/tag @s list`

**Il semaforo non funziona:**
- Controlla che il bottone sia alle coordinate corrette
- Verifica che non ci sia già una gara in corso

## 📝 Note per Sviluppatori

- Il sistema usa `time query gametime` per timing preciso
- I trigger dei settori usano volumi `dx/dy/dz` precisi
- La conversione tick→tempo avviene in `calculate_time.mcfunction`
- I nomi giocatori sono salvati tramite loot table di player head

## 🔧 Personalizzazione

Per aggiungere un nuovo circuito:
1. Copia la struttura di un circuito esistente
2. Modifica coordinate dei trigger in `tick.mcfunction`
3. Aggiorna il numero di settori nelle funzioni
4. Aggiungi scoreboard per PB in `load.mcfunction`
5. Configura semaforo e griglia di partenza

## 📜 Crediti

Sviluppato per Minecraft Java Edition 1.21.8+

---

Per segnalazioni o suggerimenti, contatta lo sviluppatore.