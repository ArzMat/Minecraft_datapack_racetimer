tellraw @a ["",{"text":"=== DESERTO RECORDS ===","color":"gold","bold":true}]

# Settore 1
execute store result score @s tempo run data get storage racetimer:deserto records.s1
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 1: ","color":"gold"},{"nbt":"records.s1_player","storage":"racetimer:deserto","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 2
execute store result score @s tempo run data get storage racetimer:deserto records.s2
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 2: ","color":"gold"},{"nbt":"records.s2_player","storage":"racetimer:deserto","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 3
execute store result score @s tempo run data get storage racetimer:deserto records.s3
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 3: ","color":"gold"},{"nbt":"records.s3_player","storage":"racetimer:deserto","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 4
execute store result score @s tempo run data get storage racetimer:deserto records.s4
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 4: ","color":"gold"},{"nbt":"records.s4_player","storage":"racetimer:deserto","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Giro completo
execute store result score @s tempo run data get storage racetimer:deserto records.total
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Giro completo: ","color":"gold"},{"nbt":"records.total_player","storage":"racetimer:deserto","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

tellraw @a ["",{"text":"==========================","color":"gold","bold":true}]