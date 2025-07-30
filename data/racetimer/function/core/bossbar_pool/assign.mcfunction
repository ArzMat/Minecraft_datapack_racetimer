# core/bossbar_pool/assign.mcfunction
# Assegna una bossbar libera al giocatore
# Chiamato da: start.mcfunction di ogni circuito

# Se ha già una bossbar, liberala prima
execute if score @s player_bossbar_id matches 1.. run function racetimer:core/bossbar_pool/release

# Cerca una bossbar libera e assegnala
execute unless score @s player_bossbar_id matches 1.. if score #bb1_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 1
execute unless score @s player_bossbar_id matches 1.. if score #bb2_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 2
execute unless score @s player_bossbar_id matches 1.. if score #bb3_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 3
execute unless score @s player_bossbar_id matches 1.. if score #bb4_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 4
execute unless score @s player_bossbar_id matches 1.. if score #bb5_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 5
execute unless score @s player_bossbar_id matches 1.. if score #bb6_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 6
execute unless score @s player_bossbar_id matches 1.. if score #bb7_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 7
execute unless score @s player_bossbar_id matches 1.. if score #bb8_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 8
execute unless score @s player_bossbar_id matches 1.. if score #bb9_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 9
execute unless score @s player_bossbar_id matches 1.. if score #bb10_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 10
execute unless score @s player_bossbar_id matches 1.. if score #bb11_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 11
execute unless score @s player_bossbar_id matches 1.. if score #bb12_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 12
execute unless score @s player_bossbar_id matches 1.. if score #bb13_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 13
execute unless score @s player_bossbar_id matches 1.. if score #bb14_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 14
execute unless score @s player_bossbar_id matches 1.. if score #bb15_occupied bossbar_occupied matches 0 run scoreboard players set @s player_bossbar_id 15

# Se non c'è nessuna bossbar libera
execute unless score @s player_bossbar_id matches 1.. run tellraw @s [{"text":"[RaceTimer] ","color":"red"},{"text":"Troppe persone stanno correndo! Attendi che si liberi uno slot.","color":"yellow"}]
execute unless score @s player_bossbar_id matches 1.. run return 0

# Marca la bossbar come occupata
execute if score @s player_bossbar_id matches 1 run scoreboard players set #bb1_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 2 run scoreboard players set #bb2_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 3 run scoreboard players set #bb3_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 4 run scoreboard players set #bb4_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 5 run scoreboard players set #bb5_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 6 run scoreboard players set #bb6_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 7 run scoreboard players set #bb7_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 8 run scoreboard players set #bb8_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 9 run scoreboard players set #bb9_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 10 run scoreboard players set #bb10_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 11 run scoreboard players set #bb11_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 12 run scoreboard players set #bb12_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 13 run scoreboard players set #bb13_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 14 run scoreboard players set #bb14_occupied bossbar_occupied 1
execute if score @s player_bossbar_id matches 15 run scoreboard players set #bb15_occupied bossbar_occupied 1

# Assegna la bossbar al giocatore
execute if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 players @s
execute if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 players @s
execute if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 players @s
execute if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 players @s
execute if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 players @s
execute if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 players @s
execute if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 players @s
execute if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 players @s
execute if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 players @s
execute if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 players @s
execute if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 players @s
execute if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 players @s
execute if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 players @s
execute if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 players @s
execute if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 players @s

# Rendi visibile la bossbar
execute if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 visible true
execute if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 visible true
execute if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 visible true
execute if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 visible true
execute if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 visible true
execute if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 visible true
execute if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 visible true
execute if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 visible true
execute if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 visible true
execute if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 visible true
execute if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 visible true
execute if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 visible true
execute if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 visible true
execute if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 visible true
execute if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 visible true

# Reset timer finish
scoreboard players set @s finish_timer 0
