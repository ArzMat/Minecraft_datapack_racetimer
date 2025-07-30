# === reset_pb_all.mcfunction ===
# racetimer/function/circuits/snowy_race/reset_pb_all.mcfunction
# Reset PB di tutti i giocatori per il circuito snowy_race
# Uso: /function racetimer:circuits/snowy_race/reset_pb_all

scoreboard players set @a pb_s1_snowy_race 999999
scoreboard players set @a pb_s2_snowy_race 999999
scoreboard players set @a pb_s3_snowy_race 999999
scoreboard players set @a pb_s4_snowy_race 999999
scoreboard players set @a pb_s5_snowy_race 999999
scoreboard players set @a pb_total_snowy_race 999999

tellraw @a ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Tutti i personal best per il circuito SNOWY RACE sono stati resettati!","color":"red"}]
