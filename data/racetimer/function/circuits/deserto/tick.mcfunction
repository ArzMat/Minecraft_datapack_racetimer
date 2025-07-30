## Arrivo prima della Partenza per motivi di registrazione tempi su più giri

# Arrivo
execute as @a[x=-1540,y=65,z=-810,dx=6,dy=0,dz=0,tag=settore3_deserto] at @s run function racetimer:circuits/deserto/finish

# Partenza
execute as @a[x=-1540,y=65,z=-810,dx=6,dy=0,dz=0,tag=!partito_deserto] at @s run function racetimer:circuits/deserto/start

# Settore 1
execute as @a[x=-1505,y=64,z=-685,dx=0,dy=0,dz=8,tag=partito_deserto,tag=!settore1_deserto] at @s run function racetimer:circuits/deserto/sector1

# Settore 2
execute as @a[x=-1592,y=66,z=-506,dx=0,dy=0,dz=8,tag=settore1_deserto,tag=!settore2_deserto] at @s run function racetimer:circuits/deserto/sector2

# Settore 3
execute as @a[x=-1601,y=67,z=-651,dx=9,dy=0,dz=0,tag=settore2_deserto,tag=!settore3_deserto] at @s run function racetimer:circuits/deserto/sector3

# Tick del semaforo
execute if score #semaphore_active semaphore_state matches 1.. if data storage racetimer:current {circuit:"deserto"} run function racetimer:core/semaphore/tick

# Trigger semaforo
execute if block -1540 65 -801 pale_oak_button[powered=true] if score #semaphore_active semaphore_state matches 0 run data modify storage racetimer:current circuit set value "deserto"
execute if block -1540 65 -801 pale_oak_button[powered=true] if score #semaphore_active semaphore_state matches 0 run function racetimer:core/semaphore/start

# Update bossbar per chi corre
execute as @a[tag=partito_deserto,scores={player_bossbar_id=1..}] at @s run function racetimer:circuits/deserto/dashboard/update