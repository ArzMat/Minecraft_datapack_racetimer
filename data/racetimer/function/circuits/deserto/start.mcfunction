# Record start time
execute store result score @s start_time run time query gametime

scoreboard players set @s s1_color 0
scoreboard players set @s s2_color 0
scoreboard players set @s s3_color 0
scoreboard players set @s s4_color 0

# Announce start
tellraw @a ["",{"selector":"@s"},{"text":" è partito al circuito Deserto!","color":"red","bold":true}]

# Add circuit-specific tag
tag @s add partito_deserto

# Assegna bossbar dal pool
function racetimer:core/bossbar_pool/assign

# Se non ha ottenuto una bossbar, interrompi
execute unless score @s player_bossbar_id matches 1.. run return 0