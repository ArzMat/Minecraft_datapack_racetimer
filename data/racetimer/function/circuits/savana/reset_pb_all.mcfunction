# === reset_pb_all.mcfunction ===
# racetimer/function/circuits/savana/reset_pb_all.mcfunction
# Reset PB di tutti i giocatori per il circuito savana
# Uso: /function racetimer:circuits/savana/reset_pb_all

scoreboard players set @a pb_s1_savana 999999
scoreboard players set @a pb_s2_savana 999999
scoreboard players set @a pb_s3_savana 999999
scoreboard players set @a pb_total_savana 999999

tellraw @a ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Tutti i personal best per il circuito SAVANA sono stati resettati!","color":"red"}]
