# === MOSTRA PERSONAL BEST FORMATTATI ===
# racetimer/function/circuits/snowy_race/show_pb.mcfunction

tellraw @s ["",{"text":"=== I TUOI PERSONAL BEST - SNOWY RACE ===","color":"gold","bold":true}]

# Settore 1
execute if score @s pb_s1_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 1: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s1_snowy_race matches 999999 run scoreboard players operation @s tempo = @s pb_s1_snowy_race
execute unless score @s pb_s1_snowy_race matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s1_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 1: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Settore 2
execute if score @s pb_s2_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 2: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s2_snowy_race matches 999999 run scoreboard players operation @s tempo = @s pb_s2_snowy_race
execute unless score @s pb_s2_snowy_race matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s2_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 2: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Settore 3
execute if score @s pb_s3_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 3: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s3_snowy_race matches 999999 run scoreboard players operation @s tempo = @s pb_s3_snowy_race
execute unless score @s pb_s3_snowy_race matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s3_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 3: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Settore 4
execute if score @s pb_s4_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 4: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s4_snowy_race matches 999999 run scoreboard players operation @s tempo = @s pb_s4_snowy_race
execute unless score @s pb_s4_snowy_race matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s4_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 4: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Settore 5
execute if score @s pb_s5_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 5: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s5_snowy_race matches 999999 run scoreboard players operation @s tempo = @s pb_s5_snowy_race
execute unless score @s pb_s5_snowy_race matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s5_snowy_race matches 999999 run tellraw @s ["",{"text":"Settore 5: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Giro completo
execute if score @s pb_total_snowy_race matches 999999 run tellraw @s ["",{"text":"Giro completo: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_total_snowy_race matches 999999 run scoreboard players operation @s tempo = @s pb_total_snowy_race
execute unless score @s pb_total_snowy_race matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_total_snowy_race matches 999999 run tellraw @s ["",{"text":"Giro completo: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

tellraw @s ["",{"text":"================================","color":"gold","bold":true}]