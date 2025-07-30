# Record start time
execute store result score @s start_time run time query gametime

# Inizializza colori settori
scoreboard players set @s s1_color 0
scoreboard players set @s s2_color 0
scoreboard players set @s s3_color 0

# Announce start
tellraw @a ["",{"selector":"@s"},{"text":" è partito al circuito Savana!","color":"red","bold":true}]

# Add circuit-specific tag
tag @s add partito_savana

# Chiama bossbar
function racetimer:circuits/savana/dashboard/show