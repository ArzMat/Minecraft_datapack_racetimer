# === reset_wr.mcfunction ===
# racetimer/function/circuits/snowy_race/reset_wr.mcfunction
# Uso: /function racetimer:circuits/snowy_race/reset_wr

# Reset tutti i WR del circuito snowy_race
data modify storage racetimer:snowy_race records.s1 set value 999999
data modify storage racetimer:snowy_race records.s2 set value 999999
data modify storage racetimer:snowy_race records.s3 set value 999999
data modify storage racetimer:snowy_race records.s4 set value 999999
data modify storage racetimer:snowy_race records.s5 set value 999999
data modify storage racetimer:snowy_race records.total set value 999999

# Reset i nomi dei giocatori
data modify storage racetimer:snowy_race records.s1_player set value "---"
data modify storage racetimer:snowy_race records.s2_player set value "---"
data modify storage racetimer:snowy_race records.s3_player set value "---"
data modify storage racetimer:snowy_race records.s4_player set value "---"
data modify storage racetimer:snowy_race records.s5_player set value "---"
data modify storage racetimer:snowy_race records.total_player set value "---"

tellraw @a ["",{"text":"[RaceTimer] ","color":"gold"},{"text":"Tutti i World Record del circuito SNOWY RACE sono stati resettati!","color":"red","bold":true}]
