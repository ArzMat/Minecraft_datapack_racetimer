tellraw @a ["",{"text":"=== SNOWY RACE RECORDS ===","color":"gold","bold":true}]

# Settore 1
execute store result score @s tempo run data get storage racetimer:snowy_race records.s1
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 1: ","color":"gold"},{"nbt":"records.s1_player","storage":"racetimer:snowy_race","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 2
execute store result score @s tempo run data get storage racetimer:snowy_race records.s2
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 2: ","color":"gold"},{"nbt":"records.s2_player","storage":"racetimer:snowy_race","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 3
execute store result score @s tempo run data get storage racetimer:snowy_race records.s3
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 3: ","color":"gold"},{"nbt":"records.s3_player","storage":"racetimer:snowy_race","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 4
execute store result score @s tempo run data get storage racetimer:snowy_race records.s4
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 4: ","color":"gold"},{"nbt":"records.s4_player","storage":"racetimer:snowy_race","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Settore 5
execute store result score @s tempo run data get storage racetimer:snowy_race records.s5
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Settore 5: ","color":"gold"},{"nbt":"records.s5_player","storage":"racetimer:snowy_race","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

# Giro completo
execute store result score @s tempo run data get storage racetimer:snowy_race records.total
function racetimer:core/calculate_time
function racetimer:core/format_time
tellraw @a ["",{"text":"Giro completo: ","color":"gold"},{"nbt":"records.total_player","storage":"racetimer:snowy_race","color":"light_purple"},{"text":" - ","color":"gray"},{"nbt":"time","storage":"racetimer:format","interpret":true,"color":"light_purple"}]

tellraw @a ["",{"text":"==========================","color":"gold","bold":true}]