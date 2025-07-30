# === RESET PERSONAL BEST DI TUTTI I GIOCATORI ===
# Metti questo file in: racetimer/function/circuits/deserto/reset_pb_all.mcfunction

# Reset PB di tutti i giocatori per il circuito deserto
# Uso: /function racetimer:circuits/deserto/reset_pb_all

scoreboard players set @a pb_s1_deserto 999999
scoreboard players set @a pb_s2_deserto 999999
scoreboard players set @a pb_s3_deserto 999999
scoreboard players set @a pb_s4_deserto 999999
scoreboard players set @a pb_total_deserto 999999

tellraw @a ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Tutti i personal best per il circuito DESERTO sono stati resettati!","color":"red"}]