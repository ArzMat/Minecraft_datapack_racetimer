# === MOSTRA PERSONAL BEST FORMATTATI ===
# racetimer/function/circuits/savana/show_pb.mcfunction

tellraw @s ["",{"text":"=== I TUOI PERSONAL BEST - SAVANA ===","color":"gold","bold":true}]

# Settore 1
execute if score @s pb_s1_savana matches 999999 run tellraw @s ["",{"text":"Settore 1: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s1_savana matches 999999 run scoreboard players operation @s tempo = @s pb_s1_savana
execute unless score @s pb_s1_savana matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s1_savana matches 999999 run tellraw @s ["",{"text":"Settore 1: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Settore 2
execute if score @s pb_s2_savana matches 999999 run tellraw @s ["",{"text":"Settore 2: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s2_savana matches 999999 run scoreboard players operation @s tempo = @s pb_s2_savana
execute unless score @s pb_s2_savana matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s2_savana matches 999999 run tellraw @s ["",{"text":"Settore 2: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Settore 3
execute if score @s pb_s3_savana matches 999999 run tellraw @s ["",{"text":"Settore 3: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_s3_savana matches 999999 run scoreboard players operation @s tempo = @s pb_s3_savana
execute unless score @s pb_s3_savana matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_s3_savana matches 999999 run tellraw @s ["",{"text":"Settore 3: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

# Giro completo
execute if score @s pb_total_savana matches 999999 run tellraw @s ["",{"text":"Giro completo: ","color":"yellow"},{"text":"--:--","color":"gray"}]
execute unless score @s pb_total_savana matches 999999 run scoreboard players operation @s tempo = @s pb_total_savana
execute unless score @s pb_total_savana matches 999999 run function racetimer:core/calculate_time
execute unless score @s pb_total_savana matches 999999 run tellraw @s ["",{"text":"Giro completo: ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"@s","objective":"sec_decine"},"color":"green"},{"score":{"name":"@s","objective":"sec_unita"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"@s","objective":"cent_decine"},"color":"green"},{"score":{"name":"@s","objective":"cent_unita"},"color":"green"}]

tellraw @s ["",{"text":"================================","color":"gold","bold":true}]