# IMPORTANTE: Sostituire XXX, YY, ZZZ con le coordinate reali

## Arrivo prima della Partenza per motivi di registrazione tempi su più giri

# Arrivo
# execute as @a[x=XXX,y=YY,z=ZZZ,dx=4,dy=0,dz=0,tag=settore2_savana] at @s run function racetimer:circuits/savana/finish

# Partenza
# execute as @a[x=XXX,y=YY,z=ZZZ,dx=4,dy=0,dz=0,tag=!partito_savana] at @s run function racetimer:circuits/savana/start

# Settore 1
# execute as @a[x=XXX,y=YY,z=ZZZ,dx=0,dy=0,dz=-5,tag=partito_savana,tag=!settore1_savana] at @s run function racetimer:circuits/savana/sector1

# Settore 2
execute as @a[x=XXX,y=YY,z=ZZZ,dx=0,dy=0,dz=-3,tag=settore1_savana,tag=!settore2_savana] at @s run function racetimer:circuits/savana/sector2

# Tick del semaforo
execute if score #semaphore_active semaphore_state matches 1.. if data storage racetimer:current {circuit:"savana"} run function racetimer:core/semaphore/tick

# Trigger semaforo - IMPORTANTE: Sostituire con coordinate del bottone
# execute if block XXX YY ZZZ pale_oak_button[powered=true] if score #semaphore_active semaphore_state matches 0 run data modify storage racetimer:current circuit set value "savana"
# execute if block XXX YY ZZZ pale_oak_button[powered=true] if score #semaphore_active semaphore_state matches 0 run function racetimer:core/semaphore/start

# Update bossbar per chi corre
# execute as @a[tag=partito_savana] run function racetimer:circuits/savana/dashboard/update