# Setup scoreboard objectives
scoreboard objectives add start_time dummy
scoreboard objectives add sector1_time dummy
scoreboard objectives add sector2_time dummy
scoreboard objectives add sector3_time dummy
scoreboard objectives add sector4_time dummy
scoreboard objectives add sector5_time dummy
scoreboard objectives add total_time dummy
scoreboard objectives add tempo dummy
scoreboard objectives add secondi dummy
scoreboard objectives add minuti dummy
scoreboard objectives add secondi_resto dummy
scoreboard objectives add centesimi dummy
scoreboard objectives add costanti dummy

# Setup constants
scoreboard players set #20 costanti 20
scoreboard players set #60 costanti 60
scoreboard players set #100 costanti 100
scoreboard players set #1200 costanti 1200

# Scoreboard per i confronti dei vecchi record (WR)
scoreboard objectives add old_min dummy
scoreboard objectives add old_sec_d dummy
scoreboard objectives add old_sec_u dummy
scoreboard objectives add old_cent_d dummy
scoreboard objectives add old_cent_u dummy

# Scoreboard per i confronti dei vecchi personal best (PB)
scoreboard objectives add old_pb_min dummy
scoreboard objectives add old_pb_sec_d dummy
scoreboard objectives add old_pb_sec_u dummy
scoreboard objectives add old_pb_cent_d dummy
scoreboard objectives add old_pb_cent_u dummy

# Scoreboard per i confronti del tempo totale
scoreboard objectives add old_tot_min dummy
scoreboard objectives add old_tot_sec_d dummy
scoreboard objectives add old_tot_sec_u dummy
scoreboard objectives add old_tot_cent_d dummy
scoreboard objectives add old_tot_cent_u dummy

# Scoreboard per i confronti del PB totale
scoreboard objectives add old_pb_tot_min dummy
scoreboard objectives add old_pb_tot_sec_d dummy
scoreboard objectives add old_pb_tot_sec_u dummy
scoreboard objectives add old_pb_tot_cent_d dummy
scoreboard objectives add old_pb_tot_cent_u dummy

# Altri scoreboard per il sistema (se non esistono già)
scoreboard objectives add old_wr dummy
scoreboard objectives add old_pb dummy
scoreboard objectives add old_wr_tot dummy
scoreboard objectives add old_pb_tot dummy

# Setup record objectives per circuito

# Snowy Race (5 settori)
scoreboard objectives add pb_s1_snowy_race dummy "PB Snowy Race - Settore 1"
scoreboard objectives add pb_s2_snowy_race dummy "PB Snowy Race - Settore 2"
scoreboard objectives add pb_s3_snowy_race dummy "PB Snowy Race - Settore 3"
scoreboard objectives add pb_s4_snowy_race dummy "PB Snowy Race - Settore 4"
scoreboard objectives add pb_s5_snowy_race dummy "PB Snowy Race - Settore 5"
scoreboard objectives add pb_total_snowy_race dummy "PB Snowy Race - Giro"

# Deserto (4 settori)
scoreboard objectives add pb_s1_deserto dummy "PB Deserto - Settore 1"
scoreboard objectives add pb_s2_deserto dummy "PB Deserto - Settore 2"
scoreboard objectives add pb_s3_deserto dummy "PB Deserto - Settore 3"
scoreboard objectives add pb_s4_deserto dummy "PB Deserto - Settore 4"
scoreboard objectives add pb_total_deserto dummy "PB Deserto - Giro"

# Savana (3 settori)
scoreboard objectives add pb_s1_savana dummy "PB Savana - Settore 1"
scoreboard objectives add pb_s2_savana dummy "PB Savana - Settore 2"
scoreboard objectives add pb_s3_savana dummy "PB Savana - Settore 3"
scoreboard objectives add pb_total_savana dummy "PB Savana - Giro"

# Setup semaphore system
function racetimer:core/semaphore/setup

# Inizializza tutti i circuiti
function racetimer:circuits/snowy_race/load
function racetimer:circuits/deserto/load
function racetimer:circuits/savana/load

# Inizializza dashboard
function racetimer:core/dashboard/setup

# ===== NUOVO: Setup pool bossbar =====
function racetimer:core/bossbar_pool/setup

# Rimuovi vecchie bossbar se esistono (non più necessarie)
bossbar remove racetimer:deserto_live
bossbar remove racetimer:snowy_race_live
bossbar remove racetimer:savana_live

# Inizializza storage per formattazione tempi
data modify storage racetimer:format time set value '{"text":"0:00.00"}'
data modify storage racetimer:format wr_time set value '{"text":"--:--"}'
data modify storage racetimer:format pb_time set value '{"text":"--:--"}'
data modify storage racetimer:format live_time set value '{"text":"0:00.00"}'

# Messaggio di conferma
tellraw @a[gamemode=creative] ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Sistema di formattazione tempi inizializzato","color":"green"}]

# Scoreboard per calcolo tempi
scoreboard objectives add sec_decine dummy
scoreboard objectives add sec_unita dummy
scoreboard objectives add cent_decine dummy
scoreboard objectives add cent_unita dummy

# Costante
scoreboard players set #10 costanti 10

# Scoreboard per dashboard
scoreboard objectives add wr_minuti dummy
scoreboard objectives add wr_secondi dummy
scoreboard objectives add wr_centesimi dummy
scoreboard objectives add pb_minuti dummy
scoreboard objectives add pb_secondi dummy
scoreboard objectives add pb_centesimi dummy
scoreboard objectives add wr_tot_minuti dummy
scoreboard objectives add pb_tot_minuti dummy

tellraw @a ["",{"text":"[Racing Timer]","color":"yellow"},{"text":" Loaded successfully!","color":"white"}]