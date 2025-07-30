# === reset_pb.mcfunction ===
# racetimer/function/circuits/snowy_race/reset_pb.mcfunction
# Reset PB per un singolo giocatore (esegui come il giocatore)
# Uso: /execute as @p run function racetimer:circuits/snowy_race/reset_pb

scoreboard players set @s pb_s1_snowy_race 999999
scoreboard players set @s pb_s2_snowy_race 999999
scoreboard players set @s pb_s3_snowy_race 999999
scoreboard players set @s pb_s4_snowy_race 999999
scoreboard players set @s pb_s5_snowy_race 999999
scoreboard players set @s pb_total_snowy_race 999999

tellraw @s ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"I tuoi personal best per il circuito SNOWY RACE sono stati resettati!","color":"yellow"}]
