# core/bossbar_pool/check_area.mcfunction
# Controlla se il giocatore è ancora nell'area del circuito

# Flag per tracciare se siamo in un'area valida
scoreboard players set #in_circuit_area costanti 0

# DESERTO
execute if entity @s[tag=partito_deserto] if entity @s[x=-1718,y=40,z=-911,dx=260,dy=50,dz=428] run scoreboard players set #in_circuit_area costanti 1

# SAVANA - SOSTITUISCI con le tue coordinate
# execute if entity @s[tag=partito_savana] if entity @s[x=X_MIN,y=Y_MIN,z=Z_MIN,dx=DX,dy=DY,dz=DZ] run scoreboard players set #in_circuit_area costanti 1

# SNOWY RACE - SOSTITUISCI con le tue coordinate
execute if entity @s[tag=partito_snowy_race] if entity @s[x=882303,y=-59,z=-102550,dx=487,dy=339,dz=450] run scoreboard players set #in_circuit_area costanti 1

# Se il giocatore è fuori dall'area, libera la bossbar
execute if score #in_circuit_area costanti matches 0 run function racetimer:core/bossbar_pool/release