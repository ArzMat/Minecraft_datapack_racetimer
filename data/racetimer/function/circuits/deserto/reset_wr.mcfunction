# === RESET WORLD RECORDS ===
# racetimer/function/circuits/deserto/reset_wr.mcfunction
# Uso: /function racetimer:circuits/deserto/reset_wr

# Reset tutti i WR del circuito deserto
data modify storage racetimer:deserto records.s1 set value 999999
data modify storage racetimer:deserto records.s2 set value 999999
data modify storage racetimer:deserto records.s3 set value 999999
data modify storage racetimer:deserto records.s4 set value 999999
data modify storage racetimer:deserto records.total set value 999999

# Reset i nomi dei giocatori
data modify storage racetimer:deserto records.s1_player set value "---"
data modify storage racetimer:deserto records.s2_player set value "---"
data modify storage racetimer:deserto records.s3_player set value "---"
data modify storage racetimer:deserto records.s4_player set value "---"
data modify storage racetimer:deserto records.total_player set value "---"

tellraw @a ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Tutti i World Record del circuito DESERTO sono stati resettati!","color":"red","bold":true}]