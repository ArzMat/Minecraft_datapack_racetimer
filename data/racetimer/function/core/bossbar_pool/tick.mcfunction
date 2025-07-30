# core/bossbar_pool/tick.mcfunction
# Gestisce bossbar in base alla posizione del giocatore

# Rilascia bossbar se il giocatore è troppo lontano dal circuito
execute as @a[scores={player_bossbar_id=1..}] at @s run function racetimer:core/bossbar_pool/check_area

# Pulisci bossbar di giocatori disconnessi
execute as @a[scores={player_bossbar_id=1..}] run tag @s add has_bossbar
execute as @e[type=minecraft:player,tag=has_bossbar] run tag @s remove has_bossbar
scoreboard players reset @e[type=!minecraft:player,scores={player_bossbar_id=1..}] player_bossbar_id

# Sistema di pulizia slot occupati
execute unless entity @a[scores={player_bossbar_id=1}] if score #bb1_occupied bossbar_occupied matches 1 run scoreboard players set #bb1_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=2}] if score #bb2_occupied bossbar_occupied matches 1 run scoreboard players set #bb2_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=3}] if score #bb3_occupied bossbar_occupied matches 1 run scoreboard players set #bb3_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=4}] if score #bb4_occupied bossbar_occupied matches 1 run scoreboard players set #bb4_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=5}] if score #bb5_occupied bossbar_occupied matches 1 run scoreboard players set #bb5_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=6}] if score #bb6_occupied bossbar_occupied matches 1 run scoreboard players set #bb6_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=7}] if score #bb7_occupied bossbar_occupied matches 1 run scoreboard players set #bb7_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=8}] if score #bb8_occupied bossbar_occupied matches 1 run scoreboard players set #bb8_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=9}] if score #bb9_occupied bossbar_occupied matches 1 run scoreboard players set #bb9_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=10}] if score #bb10_occupied bossbar_occupied matches 1 run scoreboard players set #bb10_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=11}] if score #bb11_occupied bossbar_occupied matches 1 run scoreboard players set #bb11_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=12}] if score #bb12_occupied bossbar_occupied matches 1 run scoreboard players set #bb12_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=13}] if score #bb13_occupied bossbar_occupied matches 1 run scoreboard players set #bb13_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=14}] if score #bb14_occupied bossbar_occupied matches 1 run scoreboard players set #bb14_occupied bossbar_occupied 0
execute unless entity @a[scores={player_bossbar_id=15}] if score #bb15_occupied bossbar_occupied matches 1 run scoreboard players set #bb15_occupied bossbar_occupied 0

# Nascondi bossbar non usate
execute unless entity @a[scores={player_bossbar_id=1}] run bossbar set racetimer:player_1 visible false
execute unless entity @a[scores={player_bossbar_id=2}] run bossbar set racetimer:player_2 visible false
execute unless entity @a[scores={player_bossbar_id=3}] run bossbar set racetimer:player_3 visible false
execute unless entity @a[scores={player_bossbar_id=4}] run bossbar set racetimer:player_4 visible false
execute unless entity @a[scores={player_bossbar_id=5}] run bossbar set racetimer:player_5 visible false
execute unless entity @a[scores={player_bossbar_id=6}] run bossbar set racetimer:player_6 visible false
execute unless entity @a[scores={player_bossbar_id=7}] run bossbar set racetimer:player_7 visible false
execute unless entity @a[scores={player_bossbar_id=8}] run bossbar set racetimer:player_8 visible false
execute unless entity @a[scores={player_bossbar_id=9}] run bossbar set racetimer:player_9 visible false
execute unless entity @a[scores={player_bossbar_id=10}] run bossbar set racetimer:player_10 visible false
execute unless entity @a[scores={player_bossbar_id=11}] run bossbar set racetimer:player_11 visible false
execute unless entity @a[scores={player_bossbar_id=12}] run bossbar set racetimer:player_12 visible false
execute unless entity @a[scores={player_bossbar_id=13}] run bossbar set racetimer:player_13 visible false
execute unless entity @a[scores={player_bossbar_id=14}] run bossbar set racetimer:player_14 visible false
execute unless entity @a[scores={player_bossbar_id=15}] run bossbar set racetimer:player_15 visible false