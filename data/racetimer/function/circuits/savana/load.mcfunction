# Setup semaforo per questo circuito
function racetimer:circuits/savana/setup_semaphore

# Inizializza WR per Savana se non esistono
execute unless data storage racetimer:savana records run data modify storage racetimer:savana records set value {s1:999999,s2:999999,s3:999999,total:999999,s1_player:"Nessuno",s2_player:"Nessuno",s3_player:"Nessuno",total_player:"Nessuno"}

# Messaggio di caricamento circuito
tellraw @a ["",{"text":"[Racing Timer]","color":"green"},{"text":" Savana circuit loaded!","color":"white"}]
