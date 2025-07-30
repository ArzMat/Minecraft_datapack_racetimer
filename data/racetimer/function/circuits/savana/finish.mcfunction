# === SETTORE 3 ===
# Record sector 3 time
execute store result score @s sector3_time run time query gametime
scoreboard players operation @s tempo = @s sector3_time
scoreboard players operation @s tempo -= @s sector2_time

# Calculate sector 3 time components
function racetimer:core/calculate_time

# Check sector 3 records
scoreboard players set #is_pb costanti 0
scoreboard players set #is_wr costanti 0

execute unless score @s pb_s3_savana matches 1.. run scoreboard players set @s pb_s3_savana 999999
execute if score @s tempo < @s pb_s3_savana run scoreboard players set #is_pb costanti 1

execute store result score #wr_time costanti run data get storage racetimer:savana records.s3
execute if score @s tempo < #wr_time costanti run scoreboard players set #is_wr costanti 1

# === SALVA VECCHIO WR S3 PER CONFRONTO ===
execute if score #is_wr costanti matches 1 store result score #old_wr costanti run data get storage racetimer:savana records.s3
execute if score #is_wr costanti matches 1 run scoreboard players operation @s tempo = #old_wr costanti
execute if score #is_wr costanti matches 1 run function racetimer:core/calculate_time
execute if score #is_wr costanti matches 1 run scoreboard players operation old_min costanti = @s minuti
execute if score #is_wr costanti matches 1 run scoreboard players operation old_sec_d costanti = @s sec_decine
execute if score #is_wr costanti matches 1 run scoreboard players operation old_sec_u costanti = @s sec_unita
execute if score #is_wr costanti matches 1 run scoreboard players operation old_cent_d costanti = @s cent_decine
execute if score #is_wr costanti matches 1 run scoreboard players operation old_cent_u costanti = @s cent_unita

# Ripristina il tempo attuale S3
execute if score #is_wr costanti matches 1 run scoreboard players operation @s tempo = @s sector3_time
execute if score #is_wr costanti matches 1 run scoreboard players operation @s tempo -= @s sector2_time
execute if score #is_wr costanti matches 1 run function racetimer:core/calculate_time

execute if score #is_wr costanti matches 1 store result storage racetimer:savana records.s3 int 1 run scoreboard players get @s tempo
execute if score #is_wr costanti matches 1 as @s run function racetimer:core/save_player_name
execute if score #is_wr costanti matches 1 run data modify storage racetimer:savana records.s3_player set from storage racetimer:temp player_name

# === SALVA VECCHIO PB S3 PER CONFRONTO ===
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb costanti = @s pb_s3_savana
execute if score #is_pb costanti matches 1 run scoreboard players operation @s tempo = old_pb costanti
execute if score #is_pb costanti matches 1 run function racetimer:core/calculate_time
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_min costanti = @s minuti
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_sec_d costanti = @s sec_decine
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_sec_u costanti = @s sec_unita
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_cent_d costanti = @s cent_decine
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_cent_u costanti = @s cent_unita

# Ripristina tempo attuale S3
execute if score #is_pb costanti matches 1 run scoreboard players operation @s tempo = @s sector3_time
execute if score #is_pb costanti matches 1 run scoreboard players operation @s tempo -= @s sector2_time
execute if score #is_pb costanti matches 1 run function racetimer:core/calculate_time

# Aggiorna il PB S3
execute if score #is_pb costanti matches 1 run scoreboard players operation @s pb_s3_savana = @s tempo

# === DISPLAY SETTORE 3 CON CONFRONTO ===
# WR con vecchio record
execute if score #is_wr costanti matches 1 if score old_wr costanti matches 999999 run tellraw @a ["",{"selector":"@s"},{"text":" - Settore 3: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"light_purple","bold":true},{"text":":","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"light_purple","bold":true},{"text":".","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"light_purple","bold":true},{"text":" WR!","color":"light_purple","bold":true}]

execute if score #is_wr costanti matches 1 if score old_wr costanti matches ..999998 run tellraw @a ["",{"selector":"@s"},{"text":" - Settore 3: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"light_purple","bold":true},{"text":":","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"light_purple","bold":true},{"text":".","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"light_purple","bold":true},{"text":" WR!","color":"light_purple","bold":true},{"text":" (previous ","color":"gray"},{"score":{"name":"#old_min","objective":"costanti"},"color":"gray"},{"text":":","color":"gray"},{"score":{"name":"#old_sec_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_sec_u","objective":"costanti"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"#old_cent_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_cent_u","objective":"costanti"},"color":"gray"},{"text":")","color":"gray"}]

# PB con vecchio record
execute if score #is_wr costanti matches 0 if score #is_pb costanti matches 1 if score old_pb costanti matches 999999 run tellraw @a ["",{"selector":"@s"},{"text":" - Settore 3: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"green","bold":true},{"text":":","color":"green","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"green","bold":true},{"text":".","color":"green","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"green","bold":true}]

execute if score #is_wr costanti matches 0 if score #is_pb costanti matches 1 if score old_pb costanti matches ..999998 run tellraw @a ["",{"selector":"@s"},{"text":" - Settore 3: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"green","bold":true},{"text":":","color":"green","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"green","bold":true},{"text":".","color":"green","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"green","bold":true},{"text":" (previous ","color":"gray"},{"score":{"name":"#old_pb_min","objective":"costanti"},"color":"gray"},{"text":":","color":"gray"},{"score":{"name":"#old_pb_sec_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_pb_sec_u","objective":"costanti"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"#old_pb_cent_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_pb_cent_u","objective":"costanti"},"color":"gray"},{"text":")","color":"gray"}]

# Tempo normale
execute if score #is_pb costanti matches 0 if score #is_wr costanti matches 0 run tellraw @a ["",{"selector":"@s"},{"text":" - Settore 3: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"yellow","bold":true},{"text":":","color":"yellow","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"yellow","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"yellow","bold":true},{"text":".","color":"yellow","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"yellow","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"yellow","bold":true}]

# Salva colore S3
execute if score #is_wr costanti matches 1 run scoreboard players set @s s3_color 3
execute if score #is_wr costanti matches 0 if score #is_pb costanti matches 1 run scoreboard players set @s s3_color 2
execute if score #is_wr costanti matches 0 if score #is_pb costanti matches 0 run scoreboard players set @s s3_color 1

# === TEMPO TOTALE ===
# Calculate total time
scoreboard players operation @s total_time = @s sector3_time
scoreboard players operation @s total_time -= @s start_time
scoreboard players operation @s tempo = @s total_time

# Calculate total time components
function racetimer:core/calculate_time

# Check total time records
scoreboard players set #is_pb costanti 0
scoreboard players set #is_wr costanti 0

execute unless score @s pb_total_savana matches 1.. run scoreboard players set @s pb_total_savana 999999
execute if score @s tempo < @s pb_total_savana run scoreboard players set #is_pb costanti 1

execute store result score wr_time costanti run data get storage racetimer:savana records.total
execute if score @s tempo < wr_time costanti run scoreboard players set #is_wr costanti 1

# === SALVA VECCHIO WR TOTALE PER CONFRONTO ===
execute if score #is_wr costanti matches 1 store result score old_wr_tot costanti run data get storage racetimer:savana records.total
execute if score #is_wr costanti matches 1 run scoreboard players operation @s tempo = old_wr_tot costanti
execute if score #is_wr costanti matches 1 run function racetimer:core/calculate_time
execute if score #is_wr costanti matches 1 run scoreboard players operation old_tot_min costanti = @s minuti
execute if score #is_wr costanti matches 1 run scoreboard players operation old_tot_sec_d costanti = @s sec_decine
execute if score #is_wr costanti matches 1 run scoreboard players operation old_tot_sec_u costanti = @s sec_unita
execute if score #is_wr costanti matches 1 run scoreboard players operation old_tot_cent_d costanti = @s cent_decine
execute if score #is_wr costanti matches 1 run scoreboard players operation old_tot_cent_u costanti = @s cent_unita

# Ripristina il tempo totale attuale
execute if score #is_wr costanti matches 1 run scoreboard players operation @s tempo = @s total_time
execute if score #is_wr costanti matches 1 run function racetimer:core/calculate_time

execute if score #is_wr costanti matches 1 store result storage racetimer:savana records.total int 1 run scoreboard players get @s tempo
execute if score #is_wr costanti matches 1 as @s run function racetimer:core/save_player_name
execute if score #is_wr costanti matches 1 run data modify storage racetimer:savana records.total_player set from storage racetimer:temp player_name

# === SALVA VECCHIO PB TOTALE PER CONFRONTO ===
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_tot costanti = @s pb_total_savana
execute if score #is_pb costanti matches 1 run scoreboard players operation @s tempo = old_pb_tot costanti
execute if score #is_pb costanti matches 1 run function racetimer:core/calculate_time
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_tot_min costanti = @s minuti
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_tot_sec_d costanti = @s sec_decine
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_tot_sec_u costanti = @s sec_unita
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_tot_cent_d costanti = @s cent_decine
execute if score #is_pb costanti matches 1 run scoreboard players operation old_pb_tot_cent_u costanti = @s cent_unita

# Ripristina tempo totale attuale
execute if score #is_pb costanti matches 1 run scoreboard players operation @s tempo = @s total_time
execute if score #is_pb costanti matches 1 run function racetimer:core/calculate_time

# Aggiorna il PB totale
execute if score #is_pb costanti matches 1 run scoreboard players operation @s pb_total_savana = @s tempo

# === DISPLAY ARRIVO E TEMPO TOTALE ===
tellraw @a ["",{"text":"=== ","color":"aqua","bold":true},{"selector":"@s"},{"text":" ARRIVATO! ===","color":"aqua","bold":true}]

# WR con confronto
execute if score #is_wr costanti matches 1 if score old_wr_tot costanti matches 999999 run tellraw @a ["",{"text":"TEMPO TOTALE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"light_purple","bold":true},{"text":":","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"light_purple","bold":true},{"text":".","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"light_purple","bold":true},{"text":" WORLD RECORD!","color":"light_purple","bold":true}]

execute if score #is_wr costanti matches 1 if score old_wr_tot costanti matches ..999998 run tellraw @a ["",{"text":"TEMPO TOTALE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"light_purple","bold":true},{"text":":","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"light_purple","bold":true},{"text":".","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"light_purple","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"light_purple","bold":true},{"text":" WORLD RECORD!","color":"light_purple","bold":true},{"text":" (previous ","color":"gray"},{"score":{"name":"#old_tot_min","objective":"costanti"},"color":"gray"},{"text":":","color":"gray"},{"score":{"name":"#old_tot_sec_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_tot_sec_u","objective":"costanti"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"#old_tot_cent_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_tot_cent_u","objective":"costanti"},"color":"gray"},{"text":")","color":"gray"}]

# PB con confronto
execute if score #is_wr costanti matches 0 if score #is_pb costanti matches 1 if score old_pb_tot costanti matches 999999 run tellraw @a ["",{"text":"TEMPO TOTALE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"green","bold":true},{"text":":","color":"green","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"green","bold":true},{"text":".","color":"green","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"green","bold":true},{"text":" PERSONAL BEST!","color":"green","bold":true}]

execute if score #is_wr costanti matches 0 if score #is_pb costanti matches 1 if score old_pb_tot costanti matches ..999998 run tellraw @a ["",{"text":"TEMPO TOTALE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"green","bold":true},{"text":":","color":"green","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"green","bold":true},{"text":".","color":"green","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"green","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"green","bold":true},{"text":" PERSONAL BEST!","color":"green","bold":true},{"text":" (previous ","color":"gray"},{"score":{"name":"#old_pb_tot_min","objective":"costanti"},"color":"gray"},{"text":":","color":"gray"},{"score":{"name":"#old_pb_tot_sec_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_pb_tot_sec_u","objective":"costanti"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"#old_pb_tot_cent_d","objective":"costanti"},"color":"gray"},{"score":{"name":"#old_pb_tot_cent_u","objective":"costanti"},"color":"gray"},{"text":")","color":"gray"}]

# Tempo normale
execute if score #is_pb costanti matches 0 if score #is_wr costanti matches 0 run tellraw @a ["",{"text":"TEMPO TOTALE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"minuti"},"color":"yellow","bold":true},{"text":":","color":"yellow","bold":true},{"score":{"name":"@s","objective":"sec_decine"},"color":"yellow","bold":true},{"score":{"name":"@s","objective":"sec_unita"},"color":"yellow","bold":true},{"text":".","color":"yellow","bold":true},{"score":{"name":"@s","objective":"cent_decine"},"color":"yellow","bold":true},{"score":{"name":"@s","objective":"cent_unita"},"color":"yellow","bold":true}]

# Bossbar utility
bossbar set racetimer:savana_live visible false

# Reset tags
tag @s remove settore2_savana
tag @s remove partito_savana