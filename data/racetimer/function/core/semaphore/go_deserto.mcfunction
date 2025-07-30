# Spegni tutte le copper bulb
setblock -1539 67 -810 waxed_copper_bulb[lit=false]
setblock -1538 67 -810 waxed_copper_bulb[lit=false]
setblock -1537 67 -810 waxed_copper_bulb[lit=false]
setblock -1536 67 -810 waxed_copper_bulb[lit=false]
setblock -1535 67 -810 waxed_copper_bulb[lit=false]

# Rimuovi blocchi
setblock -1540 65 -810 air
setblock -1539 65 -810 air
setblock -1538 65 -810 air
setblock -1537 65 -810 air
setblock -1536 65 -810 air
setblock -1535 65 -810 air
setblock -1534 65 -810 air

# Rimuovi blocchi dalla griglia (in contemporanea)
execute if data storage racetimer:current {circuit:"deserto"} run function racetimer:circuits/deserto/grid_clear

# Parti i giocatori
execute as @a[tag=starting_race] run function racetimer:circuits/deserto/start
tag @a[tag=starting_race] remove starting_race