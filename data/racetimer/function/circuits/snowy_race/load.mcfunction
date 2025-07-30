# Setup semaforo per questo circuito
function racetimer:circuits/snowy_race/setup_semaphore

# Inizializza WR per Snowy Race se non esistono
execute unless data storage racetimer:snowy_race records run data modify storage racetimer:snowy_race records set value {s1:999999,s2:999999,s3:999999,s4:999999,s5:999999,total:999999,s1_player:"Nessuno",s2_player:"Nessuno",s3_player:"Nessuno",s4_player:"Nessuno",s5_player:"Nessuno",total_player:"Nessuno"}

# Messaggio di caricamento circuito
tellraw @a ["",{"text":"[Racing Timer]","color":"green"},{"text":" Snowy Race circuit loaded!","color":"white"}]
