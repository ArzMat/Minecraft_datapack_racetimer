# === CALCOLO TEMPI LIVE ===
execute store result score #current_time costanti run time query gametime

# Live settore
execute if entity @s[tag=!settore1_snowy_race] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=!settore1_snowy_race] run scoreboard players operation #live_sector costanti -= @s start_time

execute if entity @s[tag=settore1_snowy_race,tag=!settore2_snowy_race] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore1_snowy_race,tag=!settore2_snowy_race] run scoreboard players operation #live_sector costanti -= @s sector1_time

execute if entity @s[tag=settore2_snowy_race,tag=!settore3_snowy_race] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore2_snowy_race,tag=!settore3_snowy_race] run scoreboard players operation #live_sector costanti -= @s sector2_time

execute if entity @s[tag=settore3_snowy_race,tag=!settore4_snowy_race] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore3_snowy_race,tag=!settore4_snowy_race] run scoreboard players operation #live_sector costanti -= @s sector3_time

execute if entity @s[tag=settore4_snowy_race] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore4_snowy_race] run scoreboard players operation #live_sector costanti -= @s sector4_time

# === CALCOLO TEMPO TOTALE LIVE ===
scoreboard players operation #live_total costanti = #current_time costanti
scoreboard players operation #live_total costanti -= @s start_time

# === CALCOLO WR SETTORE ATTUALE ===
execute if entity @s[tag=!settore1_snowy_race] store result score #wr_sector costanti run data get storage racetimer:snowy_race records.s1
execute if entity @s[tag=settore1_snowy_race,tag=!settore2_snowy_race] store result score #wr_sector costanti run data get storage racetimer:snowy_race records.s2
execute if entity @s[tag=settore2_snowy_race,tag=!settore3_snowy_race] store result score #wr_sector costanti run data get storage racetimer:snowy_race records.s3
execute if entity @s[tag=settore3_snowy_race,tag=!settore4_snowy_race] store result score #wr_sector costanti run data get storage racetimer:snowy_race records.s4
execute if entity @s[tag=settore4_snowy_race] store result score #wr_sector costanti run data get storage racetimer:snowy_race records.s5

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

# === CALCOLO WR TOTALE ===
execute store result score #wr_total costanti run data get storage racetimer:snowy_race records.total
scoreboard players operation @s tempo = #wr_total costanti
execute if score @s tempo matches 999999 run scoreboard players set @s wr_tot_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_tot_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_sec_d costanti = @s sec_decine
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_sec_u costanti = @s sec_unita
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_cent_d costanti = @s cent_decine
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_cent_u costanti = @s cent_unita

# === CALCOLO PB SETTORE ATTUALE ===
execute if entity @s[tag=!settore1_snowy_race] run scoreboard players operation #pb_sector costanti = @s pb_s1_snowy_race
execute if entity @s[tag=settore1_snowy_race,tag=!settore2_snowy_race] run scoreboard players operation #pb_sector costanti = @s pb_s2_snowy_race
execute if entity @s[tag=settore2_snowy_race,tag=!settore3_snowy_race] run scoreboard players operation #pb_sector costanti = @s pb_s3_snowy_race
execute if entity @s[tag=settore3_snowy_race,tag=!settore4_snowy_race] run scoreboard players operation #pb_sector costanti = @s pb_s4_snowy_race
execute if entity @s[tag=settore4_snowy_race] run scoreboard players operation #pb_sector costanti = @s pb_s5_snowy_race

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

# === CALCOLO PB TOTALE ===
scoreboard players operation #pb_total costanti = @s pb_total_snowy_race
scoreboard players operation @s tempo = #pb_total costanti
execute unless score @s tempo matches 1.. run scoreboard players set @s tempo 999999
execute if score @s tempo matches 999999 run scoreboard players set @s pb_tot_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_tot_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_tot_sec_d costanti = @s sec_decine
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_tot_sec_u costanti = @s sec_unita
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_tot_cent_d costanti = @s cent_decine
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_tot_cent_u costanti = @s cent_unita

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

# === CALCOLO LIVE TOTALE PER DISPLAY ===
scoreboard players operation @s tempo = #live_total costanti
function racetimer:core/calculate_time
scoreboard players operation #live_tot_min costanti = @s minuti
scoreboard players operation #live_tot_sec_d costanti = @s sec_decine
scoreboard players operation #live_tot_sec_u costanti = @s sec_unita
scoreboard players operation #live_tot_cent_d costanti = @s cent_decine
scoreboard players operation #live_tot_cent_u costanti = @s cent_unita

# === CALCOLO PROGRESSO BOSSBAR ===
execute if score #wr_sector costanti matches 999999 run scoreboard players set #wr_sector costanti 10000
scoreboard players operation #progress costanti = #live_sector costanti
scoreboard players operation #progress costanti *= #10000 costanti
scoreboard players operation #progress costanti /= #wr_sector costanti
execute if score #progress costanti matches 10001.. run scoreboard players set #progress costanti 10000

execute if score @s player_bossbar_id matches 1 run execute store result bossbar racetimer:player_1 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 2 run execute store result bossbar racetimer:player_2 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 3 run execute store result bossbar racetimer:player_3 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 4 run execute store result bossbar racetimer:player_4 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 5 run execute store result bossbar racetimer:player_5 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 6 run execute store result bossbar racetimer:player_6 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 7 run execute store result bossbar racetimer:player_7 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 8 run execute store result bossbar racetimer:player_8 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 9 run execute store result bossbar racetimer:player_9 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 10 run execute store result bossbar racetimer:player_10 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 11 run execute store result bossbar racetimer:player_11 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 12 run execute store result bossbar racetimer:player_12 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 13 run execute store result bossbar racetimer:player_13 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 14 run execute store result bossbar racetimer:player_14 value run scoreboard players get #progress costanti
execute if score @s player_bossbar_id matches 15 run execute store result bossbar racetimer:player_15 value run scoreboard players get #progress costanti


# === COLORE BOSSBAR BASATO SU PERFORMANCE ===
scoreboard players set #color_type costanti 1
execute if score #live_sector costanti <= @s pb_s1_snowy_race if entity @s[tag=!settore1_snowy_race] run scoreboard players set #color_type costanti 2
execute if score #live_sector costanti <= @s pb_s2_snowy_race if entity @s[tag=settore1_snowy_race,tag=!settore2_snowy_race] run scoreboard players set #color_type costanti 2
execute if score #live_sector costanti <= @s pb_s3_snowy_race if entity @s[tag=settore2_snowy_race,tag=!settore3_snowy_race] run scoreboard players set #color_type costanti 2
execute if score #live_sector costanti <= @s pb_s4_snowy_race if entity @s[tag=settore3_snowy_race,tag=!settore4_snowy_race] run scoreboard players set #color_type costanti 2
execute if score #live_sector costanti <= @s pb_s5_snowy_race if entity @s[tag=settore4_snowy_race] run scoreboard players set #color_type costanti 2
execute if score #live_sector costanti < #wr_sector costanti run scoreboard players set #color_type costanti 3

function racetimer:core/bossbar_pool/set_color

# === NOME BOSSBAR CON SETTORE E TEMPI ===
# Determina quale settore mostrare
scoreboard players set #sector_num costanti 1
execute if entity @s[tag=settore1_snowy_race,tag=!settore2_snowy_race] run scoreboard players set #sector_num costanti 2
execute if entity @s[tag=settore2_snowy_race,tag=!settore3_snowy_race] run scoreboard players set #sector_num costanti 3
execute if entity @s[tag=settore3_snowy_race,tag=!settore4_snowy_race] run scoreboard players set #sector_num costanti 4
execute if entity @s[tag=settore4_snowy_race] run scoreboard players set #sector_num costanti 5

# Imposta il nome della bossbar
function racetimer:core/bossbar_pool/set_name_snowy_race