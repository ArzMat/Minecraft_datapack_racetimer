# core/bossbar_pool/setup.mcfunction
# Crea pool di 15 bossbar condivise

# Rimuovi vecchie bossbar se esistono
bossbar remove racetimer:player_1
bossbar remove racetimer:player_2
bossbar remove racetimer:player_3
bossbar remove racetimer:player_4
bossbar remove racetimer:player_5
bossbar remove racetimer:player_6
bossbar remove racetimer:player_7
bossbar remove racetimer:player_8
bossbar remove racetimer:player_9
bossbar remove racetimer:player_10
bossbar remove racetimer:player_11
bossbar remove racetimer:player_12
bossbar remove racetimer:player_13
bossbar remove racetimer:player_14
bossbar remove racetimer:player_15

# Crea nuove bossbar
bossbar add racetimer:player_1 {"text":""}
bossbar add racetimer:player_2 {"text":""}
bossbar add racetimer:player_3 {"text":""}
bossbar add racetimer:player_4 {"text":""}
bossbar add racetimer:player_5 {"text":""}
bossbar add racetimer:player_6 {"text":""}
bossbar add racetimer:player_7 {"text":""}
bossbar add racetimer:player_8 {"text":""}
bossbar add racetimer:player_9 {"text":""}
bossbar add racetimer:player_10 {"text":""}
bossbar add racetimer:player_11 {"text":""}
bossbar add racetimer:player_12 {"text":""}
bossbar add racetimer:player_13 {"text":""}
bossbar add racetimer:player_14 {"text":""}
bossbar add racetimer:player_15 {"text":""}

# Setup di base per tutte
bossbar set racetimer:player_1 max 10000
bossbar set racetimer:player_2 max 10000
bossbar set racetimer:player_3 max 10000
bossbar set racetimer:player_4 max 10000
bossbar set racetimer:player_5 max 10000
bossbar set racetimer:player_6 max 10000
bossbar set racetimer:player_7 max 10000
bossbar set racetimer:player_8 max 10000
bossbar set racetimer:player_9 max 10000
bossbar set racetimer:player_10 max 10000
bossbar set racetimer:player_11 max 10000
bossbar set racetimer:player_12 max 10000
bossbar set racetimer:player_13 max 10000
bossbar set racetimer:player_14 max 10000
bossbar set racetimer:player_15 max 10000

# Scoreboard per gestione
scoreboard objectives add player_bossbar_id dummy
scoreboard objectives add bossbar_occupied dummy

# Marca tutte come libere (0 = libera, 1 = occupata)
scoreboard players set #bb1_occupied bossbar_occupied 0
scoreboard players set #bb2_occupied bossbar_occupied 0
scoreboard players set #bb3_occupied bossbar_occupied 0
scoreboard players set #bb4_occupied bossbar_occupied 0
scoreboard players set #bb5_occupied bossbar_occupied 0
scoreboard players set #bb6_occupied bossbar_occupied 0
scoreboard players set #bb7_occupied bossbar_occupied 0
scoreboard players set #bb8_occupied bossbar_occupied 0
scoreboard players set #bb9_occupied bossbar_occupied 0
scoreboard players set #bb10_occupied bossbar_occupied 0
scoreboard players set #bb11_occupied bossbar_occupied 0
scoreboard players set #bb12_occupied bossbar_occupied 0
scoreboard players set #bb13_occupied bossbar_occupied 0
scoreboard players set #bb14_occupied bossbar_occupied 0
scoreboard players set #bb15_occupied bossbar_occupied 0

tellraw @a[tag=admin] [{"text":"[RaceTimer] ","color":"gold"},{"text":"Pool di 15 bossbar inizializzato","color":"green"}]