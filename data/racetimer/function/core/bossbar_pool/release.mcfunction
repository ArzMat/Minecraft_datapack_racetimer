# core/bossbar_pool/release.mcfunction
# Libera la bossbar del giocatore E rimuove tutti i tag del circuito

# Nascondi la bossbar
execute if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 visible false
execute if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 visible false
execute if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 visible false
execute if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 visible false
execute if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 visible false
execute if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 visible false
execute if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 visible false
execute if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 visible false
execute if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 visible false
execute if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 visible false
execute if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 visible false
execute if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 visible false
execute if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 visible false
execute if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 visible false
execute if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 visible false

# Rimuovi il giocatore dalla bossbar
execute if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 players
execute if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 players
execute if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 players
execute if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 players
execute if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 players
execute if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 players
execute if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 players
execute if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 players
execute if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 players
execute if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 players
execute if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 players
execute if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 players
execute if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 players
execute if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 players
execute if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 players

# Marca la bossbar come libera
execute if score @s player_bossbar_id matches 1 run scoreboard players set #bb1_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 2 run scoreboard players set #bb2_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 3 run scoreboard players set #bb3_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 4 run scoreboard players set #bb4_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 5 run scoreboard players set #bb5_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 6 run scoreboard players set #bb6_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 7 run scoreboard players set #bb7_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 8 run scoreboard players set #bb8_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 9 run scoreboard players set #bb9_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 10 run scoreboard players set #bb10_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 11 run scoreboard players set #bb11_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 12 run scoreboard players set #bb12_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 13 run scoreboard players set #bb13_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 14 run scoreboard players set #bb14_occupied bossbar_occupied 0
execute if score @s player_bossbar_id matches 15 run scoreboard players set #bb15_occupied bossbar_occupied 0

# === NUOVO: Rimuovi tutti i tag del circuito ===

# DESERTO - rimuovi tutti i tag relativi
tag @s[tag=partito_deserto] remove partito_deserto
tag @s[tag=settore1_deserto] remove settore1_deserto
tag @s[tag=settore2_deserto] remove settore2_deserto
tag @s[tag=settore3_deserto] remove settore3_deserto
tag @s[tag=finito_deserto] remove finito_deserto

# SAVANA - rimuovi tutti i tag relativi
tag @s[tag=partito_savana] remove partito_savana
tag @s[tag=settore1_savana] remove settore1_savana
tag @s[tag=settore2_savana] remove settore2_savana
tag @s[tag=finito_savana] remove finito_savana

# SNOWY RACE - rimuovi tutti i tag relativi
tag @s[tag=partito_snowy_race] remove partito_snowy_race
tag @s[tag=settore1_snowy_race] remove settore1_snowy_race
tag @s[tag=settore2_snowy_race] remove settore2_snowy_race
tag @s[tag=settore3_snowy_race] remove settore3_snowy_race
tag @s[tag=settore4_snowy_race] remove settore4_snowy_race
tag @s[tag=finito_snowy_race] remove finito_snowy_race

# Reset player data
scoreboard players reset @s player_bossbar_id

# Messaggio di debug (opzionale - rimuovi in produzione)
# tellraw @s [{"text":"[RaceTimer] ","color":"red"},{"text":"Sei uscito dal circuito!","color":"yellow"}]