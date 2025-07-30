# === reset_wr.mcfunction ===
# racetimer/function/circuits/savana/reset_wr.mcfunction
# Uso: /function racetimer:circuits/savana/reset_wr

# Reset tutti i WR del circuito savana
data modify storage racetimer:savana records.s1 set value 999999
data modify storage racetimer:savana records.s2 set value 999999
data modify storage racetimer:savana records.s3 set value 999999
data modify storage racetimer:savana records.total set value 999999

# Reset i nomi dei giocatori
data modify storage racetimer:savana records.s1_player set value "---"
data modify storage racetimer:savana records.s2_player set value "---"
data modify storage racetimer:savana records.s3_player set value "---"
data modify storage racetimer:savana records.total_player set value "---"

tellraw @a ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Tutti i World Record del circuito SAVANA sono stati resettati!","color":"red","bold":true}]
