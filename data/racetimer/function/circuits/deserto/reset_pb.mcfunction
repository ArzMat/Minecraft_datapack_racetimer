# === RESET PERSONAL BEST ===
# Metti questo file in: racetimer/function/circuits/deserto/reset_pb.mcfunction

# Reset PB per un singolo giocatore (esegui come il giocatore)
# Uso: /execute as @p run function racetimer:circuits/deserto/reset_pb

scoreboard players set @s pb_s1_deserto 999999
scoreboard players set @s pb_s2_deserto 999999
scoreboard players set @s pb_s3_deserto 999999
scoreboard players set @s pb_s4_deserto 999999
scoreboard players set @s pb_total_deserto 999999

tellraw @s ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"I tuoi personal best per il circuito DESERTO sono stati resettati!","color":"yellow"}]