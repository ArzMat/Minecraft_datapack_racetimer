## Arrivo prima della Partenza per motivi di registrazione tempi su più giri

# Arrivo
execute as @a[x=882638,y=-49,z=-102422,dx=4,dy=0,dz=0,tag=settore4_snowy_race] at @s run function racetimer:circuits/snowy_race/finish

# Partenza
execute as @a[x=882343,y=248,z=-102491,dx=4,dy=0,dz=0,tag=!partito_snowy_race] at @s run function racetimer:circuits/snowy_race/start

# Settore 1
execute as @a[x=882551,y=144,z=-102238,dx=0,dy=0,dz=-5,tag=partito_snowy_race,tag=!settore1_snowy_race] at @s run function racetimer:circuits/snowy_race/sector1

# Settore 2
execute as @a[x=882551,y=63,z=-102166,dx=0,dy=0,dz=-3,tag=settore1_snowy_race,tag=!settore2_snowy_race] at @s run function racetimer:circuits/snowy_race/sector2

# Settore 3
execute as @a[x=882572,y=69,z=-102329,dx=0,dy=0,dz=-5,tag=settore2_snowy_race,tag=!settore3_snowy_race] at @s run function racetimer:circuits/snowy_race/sector3

# Settore 4
execute as @a[x=882654,y=-22,z=-102219,dx=2,dy=0,dz=0,tag=settore3_snowy_race,tag=!settore4_snowy_race] at @s run function racetimer:circuits/snowy_race/sector4

# Tick del semaforo
execute if score #semaphore_active semaphore_state matches 1.. if data storage racetimer:current {circuit:"snowy_race"} run function racetimer:core/semaphore/tick

# Trigger semaforo
execute if block 882342 249 -102492 pale_oak_button[powered=true] if score #semaphore_active semaphore_state matches 0 run data modify storage racetimer:current circuit set value "snowy_race"
execute if block 882342 249 -102492 pale_oak_button[powered=true] if score #semaphore_active semaphore_state matches 0 run function racetimer:core/semaphore/start

# Update bossbar per chi corre
execute as @a[tag=partito_snowy_race,scores={player_bossbar_id=1..}] at @s run function racetimer:circuits/snowy_race/dashboard/update