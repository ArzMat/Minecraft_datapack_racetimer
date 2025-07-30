# === dashboard/update.mcfunction ===
# racetimer/function/circuits/savana/dashboard/update.mcfunction

# === CALCOLO TEMPI LIVE ===
execute store result score #current_time costanti run time query gametime

# Live settore
execute if entity @s[tag=!settore1_savana] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=!settore1_savana] run scoreboard players operation #live_sector costanti -= @s start_time

execute if entity @s[tag=settore1_savana,tag=!settore2_savana] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore1_savana,tag=!settore2_savana] run scoreboard players operation #live_sector costanti -= @s sector1_time

execute if entity @s[tag=settore2_savana] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore2_savana] run scoreboard players operation #live_sector costanti -= @s sector2_time

# === CALCOLO WR SETTORE ATTUALE ===
execute if entity @s[tag=!settore1_savana] store result score #wr_sector costanti run data get storage racetimer:savana records.s1
execute if entity @s[tag=settore1_savana,tag=!settore2_savana] store result score #wr_sector costanti run data get storage racetimer:savana records.s2
execute if entity @s[tag=settore2_savana] store result score #wr_sector costanti run data get storage racetimer:savana records.s3

# Calcola WR per display
scoreboard players operation @s tempo = #wr_sector costanti
execute if score @s tempo matches 999999 run scoreboard players set @s wr_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_secondi = @s secondi_resto
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_centesimi = @s centesimi

# === CALCOLA DECINE E UNITÀ PER WR ===
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_d costanti = @s wr_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_u costanti = @s wr_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_u costanti %= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_d costanti = @s wr_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_u costanti = @s wr_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_u costanti %= #10 costanti

# === CALCOLO PB SETTORE ATTUALE ===
execute if entity @s[tag=!settore1_savana] run scoreboard players operation #pb_sector costanti = @s pb_s1_savana
execute if entity @s[tag=settore1_savana,tag=!settore2_savana] run scoreboard players operation #pb_sector costanti = @s pb_s2_savana
execute if entity @s[tag=settore2_savana] run scoreboard players operation #pb_sector costanti = @s pb_s3_savana

# Calcola PB per display
scoreboard players operation @s tempo = #pb_sector costanti
execute unless score @s tempo matches 1.. run scoreboard players set @s tempo 999999
execute if score @s tempo matches 999999 run scoreboard players set @s pb_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_secondi = @s secondi_resto
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_centesimi = @s centesimi

# === CALCOLA DECINE E UNITÀ PER PB ===
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_d costanti = @s pb_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_u costanti = @s pb_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_u costanti %= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_d costanti = @s pb_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_u costanti = @s pb_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_u costanti %= #10 costanti

# === CALCOLO LIVE SETTORE PER DISPLAY ===
scoreboard players operation @s tempo = #live_sector costanti
function racetimer:core/calculate_time
scoreboard players operation #live_s_min costanti = @s minuti
scoreboard players operation #live_s_sec costanti = @s secondi_resto
scoreboard players operation #live_s_cent costanti = @s centesimi

# === CALCOLA DECINE E UNITÀ PER LIVE ===
scoreboard players operation #live_s_sec_d costanti = @s sec_decine
scoreboard players operation #live_s_sec_u costanti = @s sec_unita
scoreboard players operation #live_s_cent_d costanti = @s cent_decine
scoreboard players operation #live_s_cent_u costanti = @s cent_unita

# === CALCOLO PROGRESSO BOSSBAR ===
execute if score #wr_sector costanti matches 999999 run scoreboard players set #wr_sector costanti 10000
scoreboard players operation #progress costanti = #live_sector costanti
scoreboard players operation #progress costanti *= #10000 costanti
scoreboard players operation #progress costanti /= #wr_sector costanti
execute if score #progress costanti matches 10001.. run scoreboard players set #progress costanti 10000
execute store result bossbar racetimer:savana_live value run scoreboard players get #progress costanti

# === COLORE BOSSBAR BASATO SU PERFORMANCE ===
bossbar set racetimer:savana_live color white
execute if score #live_sector costanti <= @s pb_s1_savana if entity @s[tag=!settore1_savana] run bossbar set racetimer:savana_live color green
execute if score #live_sector costanti <= @s pb_s2_savana if entity @s[tag=settore1_savana,tag=!settore2_savana] run bossbar set racetimer:savana_live color green
execute if score #live_sector costanti <= @s pb_s3_savana if entity @s[tag=settore2_savana] run bossbar set racetimer:savana_live color green

execute if score #live_sector costanti < #wr_sector costanti run bossbar set racetimer:savana_live color purple

# === NOME BOSSBAR CON SETTORE E TEMPI ===
# Determina quale settore mostrare
scoreboard players set #sector_num costanti 1
execute if entity @s[tag=settore1_savana,tag=!settore2_savana] run scoreboard players set #sector_num costanti 2
execute if entity @s[tag=settore2_savana] run scoreboard players set #sector_num costanti 3

# Settore 1
execute if score #sector_num costanti matches 1 run bossbar set racetimer:savana_live name ["",{"text":"SAVANA S1 | ","color":"gold","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}}]

# Settore 2
execute if score #sector_num costanti matches 2 run bossbar set racetimer:savana_live name ["",{"text":"SAVANA S2 | ","color":"yellow","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}}]

# Settore 3
execute if score #sector_num costanti matches 3 run bossbar set racetimer:savana_live name ["",{"text":"SAVANA S3 | ","color":"yellow","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}}]
