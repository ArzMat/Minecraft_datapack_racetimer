# === reset_pb.mcfunction ===
# racetimer/function/circuits/savana/reset_pb.mcfunction
# Reset PB per un singolo giocatore (esegui come il giocatore)
# Uso: /execute as @p run function racetimer:circuits/savana/reset_pb

scoreboard players set @s pb_s1_savana 999999
scoreboard players set @s pb_s2_savana 999999
scoreboard players set @s pb_s3_savana 999999
scoreboard players set @s pb_total_savana 999999

tellraw @s ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"I tuoi personal best per il circuito SAVANA sono stati resettati!","color":"yellow"}]
