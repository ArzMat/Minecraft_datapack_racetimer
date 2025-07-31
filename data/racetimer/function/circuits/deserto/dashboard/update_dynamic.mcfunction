# circuits/deserto/dashboard/update_dynamic.mcfunction

# === CALCOLO TEMPI LIVE ===
execute store result score #current_time costanti run time query gametime

# Live settore
execute if entity @s[tag=!settore1_deserto] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=!settore1_deserto] run scoreboard players operation #live_sector costanti -= @s start_time

execute if entity @s[tag=settore1_deserto,tag=!settore2_deserto] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore1_deserto,tag=!settore2_deserto] run scoreboard players operation #live_sector costanti -= @s sector1_time

execute if entity @s[tag=settore2_deserto,tag=!settore3_deserto] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore2_deserto,tag=!settore3_deserto] run scoreboard players operation #live_sector costanti -= @s sector2_time

execute if entity @s[tag=settore3_deserto] run scoreboard players operation #live_sector costanti = #current_time costanti
execute if entity @s[tag=settore3_deserto] run scoreboard players operation #live_sector costanti -= @s sector3_time

# === CALCOLO TEMPO TOTALE LIVE ===
scoreboard players operation #live_total costanti = #current_time costanti
scoreboard players operation #live_total costanti -= @s start_time

# === CALCOLO WR SETTORE ATTUALE ===
execute if entity @s[tag=!settore1_deserto] store result score #wr_sector costanti run data get storage racetimer:deserto records.s1
execute if entity @s[tag=settore1_deserto,tag=!settore2_deserto] store result score #wr_sector costanti run data get storage racetimer:deserto records.s2
execute if entity @s[tag=settore2_deserto,tag=!settore3_deserto] store result score #wr_sector costanti run data get storage racetimer:deserto records.s3
execute if entity @s[tag=settore3_deserto] store result score #wr_sector costanti run data get storage racetimer:deserto records.s4

# Calcola WR per display
scoreboard players operation @s tempo = #wr_sector costanti
execute if score @s tempo matches 999999 run scoreboard players set @s wr_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_secondi = @s secondi_resto
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_centesimi = @s centesimi

# === NUOVO: CALCOLA DECINE E UNITÀ PER WR ===
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_d costanti = @s wr_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_u costanti = @s wr_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_sec_u costanti %= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_d costanti = @s wr_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_u costanti = @s wr_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_cent_u costanti %= #10 costanti

# === CALCOLO WR TOTALE ===
execute store result score #wr_total costanti run data get storage racetimer:deserto records.total
scoreboard players operation @s tempo = #wr_total costanti
execute if score @s tempo matches 999999 run scoreboard players set @s wr_tot_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s wr_tot_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_sec_d costanti = @s sec_decine
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_sec_u costanti = @s sec_unita
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_cent_d costanti = @s cent_decine
execute if score @s tempo matches ..999998 run scoreboard players operation #wr_tot_cent_u costanti = @s cent_unita

# === CALCOLO PB SETTORE ATTUALE ===
execute if entity @s[tag=!settore1_deserto] run scoreboard players operation #pb_sector costanti = @s pb_s1_deserto
execute if entity @s[tag=settore1_deserto,tag=!settore2_deserto] run scoreboard players operation #pb_sector costanti = @s pb_s2_deserto
execute if entity @s[tag=settore2_deserto,tag=!settore3_deserto] run scoreboard players operation #pb_sector costanti = @s pb_s3_deserto
execute if entity @s[tag=settore3_deserto] run scoreboard players operation #pb_sector costanti = @s pb_s4_deserto

# Calcola PB per display
scoreboard players operation @s tempo = #pb_sector costanti
execute unless score @s tempo matches 1.. run scoreboard players set @s tempo 999999
execute if score @s tempo matches 999999 run scoreboard players set @s pb_minuti -1
execute if score @s tempo matches ..999998 run function racetimer:core/calculate_time
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_minuti = @s minuti
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_secondi = @s secondi_resto
execute if score @s tempo matches ..999998 run scoreboard players operation @s pb_centesimi = @s centesimi

# === NUOVO: CALCOLA DECINE E UNITÀ PER PB ===
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_d costanti = @s pb_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_u costanti = @s pb_secondi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_sec_u costanti %= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_d costanti = @s pb_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_d costanti /= #10 costanti
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_u costanti = @s pb_centesimi
execute if score @s tempo matches ..999998 run scoreboard players operation #pb_cent_u costanti %= #10 costanti

# === CALCOLO PB TOTALE ===
scoreboard players operation #pb_total costanti = @s pb_total_deserto
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

# === NUOVO: CALCOLA DECINE E UNITÀ PER LIVE ===
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

# === CALCOLO PROGRESSO BOSSBAR (proporzionale al WR del settore) ===
execute if score #wr_sector costanti matches 999999 run scoreboard players set #wr_sector costanti 10000
scoreboard players operation #progress costanti = #live_sector costanti
scoreboard players operation #progress costanti *= #10000 costanti
scoreboard players operation #progress costanti /= #wr_sector costanti
execute if score #progress costanti matches 10001.. run scoreboard players set #progress costanti 10000

# ===== NUOVO: Aggiorna la bossbar specifica del giocatore =====
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
# Prima imposta bianco di default
execute if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 color white
execute if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 color white
execute if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 color white
execute if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 color white
execute if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 color white
execute if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 color white
execute if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 color white
execute if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 color white
execute if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 color white
execute if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 color white
execute if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 color white
execute if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 color white
execute if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 color white
execute if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 color white
execute if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 color white

# Poi controlla se è verde (PB)
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 color green
execute if score #live_sector costanti <= @s pb_s1_deserto if entity @s[tag=!settore1_deserto] if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 color green

execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 color green
execute if score #live_sector costanti <= @s pb_s2_deserto if entity @s[tag=!settore2_deserto] if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 color green

execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 color green
execute if score #live_sector costanti <= @s pb_s3_deserto if entity @s[tag=!settore3_deserto] if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 color green

execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 color green
execute if score #live_sector costanti <= @s pb_s4_deserto if entity @s[tag=!settore4_deserto] if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 color green



# Infine controlla se è viola (WR)
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 1 run bossbar set racetimer:player_1 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 2 run bossbar set racetimer:player_2 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 3 run bossbar set racetimer:player_3 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 4 run bossbar set racetimer:player_4 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 5 run bossbar set racetimer:player_5 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 6 run bossbar set racetimer:player_6 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 7 run bossbar set racetimer:player_7 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 8 run bossbar set racetimer:player_8 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 9 run bossbar set racetimer:player_9 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 10 run bossbar set racetimer:player_10 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 11 run bossbar set racetimer:player_11 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 12 run bossbar set racetimer:player_12 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 13 run bossbar set racetimer:player_13 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 14 run bossbar set racetimer:player_14 color purple
execute if score #live_sector costanti < #wr_sector costanti if score @s player_bossbar_id matches 15 run bossbar set racetimer:player_15 color purple

# === NOME BOSSBAR CON SETTORE E TEMPI ===
# Determina quale settore mostrare
scoreboard players set #sector_num costanti 1
execute if entity @s[tag=settore1_deserto,tag=!settore2_deserto] run scoreboard players set #sector_num costanti 2
execute if entity @s[tag=settore2_deserto,tag=!settore3_deserto] run scoreboard players set #sector_num costanti 3
execute if entity @s[tag=settore3_deserto] run scoreboard players set #sector_num costanti 4

# Crea il testo della bossbar nello storage CON TEMPI TOTALI
execute if score #sector_num costanti matches 1 run data modify storage racetimer:temp bossbar_name set value ["",{"text":"DESERTO S1 | ","color":"gold","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}},{"text":" || ","color":"gray"},{"text":"TOT WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_tot_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_tot_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_tot_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_tot_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_tot_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_tot_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"aqua"},{"score":{"name":"#live_tot_min","objective":"costanti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"#live_tot_sec_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_sec_u","objective":"costanti"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"#live_tot_cent_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_cent_u","objective":"costanti"},"color":"aqua"}]

execute if score #sector_num costanti matches 2 run data modify storage racetimer:temp bossbar_name set value ["",{"text":"DESERTO S2 | ","color":"yellow","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}},{"text":" || ","color":"gray"},{"text":"TOT WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_tot_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_tot_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_tot_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_tot_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_tot_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_tot_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"aqua"},{"score":{"name":"#live_tot_min","objective":"costanti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"#live_tot_sec_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_sec_u","objective":"costanti"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"#live_tot_cent_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_cent_u","objective":"costanti"},"color":"aqua"}]

execute if score #sector_num costanti matches 3 run data modify storage racetimer:temp bossbar_name set value ["",{"text":"DESERTO S3 | ","color":"yellow","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}},{"text":" || ","color":"gray"},{"text":"TOT WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_tot_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_tot_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_tot_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_tot_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_tot_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_tot_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"aqua"},{"score":{"name":"#live_tot_min","objective":"costanti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"#live_tot_sec_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_sec_u","objective":"costanti"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"#live_tot_cent_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_cent_u","objective":"costanti"},"color":"aqua"}]

execute if score #sector_num costanti matches 4 run data modify storage racetimer:temp bossbar_name set value ["",{"text":"DESERTO S4 | ","color":"yellow","bold":true},{"text":"WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"white"},{"score":{"name":"#live_s_min","objective":"costanti"}},{"text":":"},{"score":{"name":"#live_s_sec_d","objective":"costanti"}},{"score":{"name":"#live_s_sec_u","objective":"costanti"}},{"text":"."},{"score":{"name":"#live_s_cent_d","objective":"costanti"}},{"score":{"name":"#live_s_cent_u","objective":"costanti"}},{"text":" || ","color":"gray"},{"text":"TOT WR: ","color":"light_purple"},{"score":{"name":"@s","objective":"wr_tot_minuti"},"color":"light_purple"},{"text":":","color":"light_purple"},{"score":{"name":"#wr_tot_sec_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_sec_u","objective":"costanti"},"color":"light_purple"},{"text":".","color":"light_purple"},{"score":{"name":"#wr_tot_cent_d","objective":"costanti"},"color":"light_purple"},{"score":{"name":"#wr_tot_cent_u","objective":"costanti"},"color":"light_purple"},{"text":" | PB: ","color":"green"},{"score":{"name":"@s","objective":"pb_tot_minuti"},"color":"green"},{"text":":","color":"green"},{"score":{"name":"#pb_tot_sec_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_sec_u","objective":"costanti"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"#pb_tot_cent_d","objective":"costanti"},"color":"green"},{"score":{"name":"#pb_tot_cent_u","objective":"costanti"},"color":"green"},{"text":" | LIVE: ","color":"aqua"},{"score":{"name":"#live_tot_min","objective":"costanti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"#live_tot_sec_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_sec_u","objective":"costanti"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"#live_tot_cent_d","objective":"costanti"},"color":"aqua"},{"score":{"name":"#live_tot_cent_u","objective":"costanti"},"color":"aqua"}]

# Applica il nome alla bossbar corretta
execute if score @s player_bossbar_id matches 1 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_1,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 2 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_2,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 3 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_3,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 4 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_4,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 5 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_5,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 6 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_6,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 7 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_7,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 8 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_8,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 9 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_9,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 10 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_10,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 11 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_11,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 12 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_12,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 13 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_13,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 14 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_14,limit=1] CustomName set from storage racetimer:temp bossbar_name
execute if score @s player_bossbar_id matches 15 run data modify entity @e[type=minecraft:marker,tag=bossbar_name_15,limit=1] CustomName set from storage racetimer:temp bossbar_name