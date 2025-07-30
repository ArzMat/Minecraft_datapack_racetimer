# Spegni tutte le copper bulb
setblock 882343 251 -102491 waxed_copper_bulb[lit=false]
setblock 882344 251 -102491 waxed_copper_bulb[lit=false]
setblock 882345 251 -102491 waxed_copper_bulb[lit=false]
setblock 882346 251 -102491 waxed_copper_bulb[lit=false]
setblock 882347 251 -102491 waxed_copper_bulb[lit=false]

# Rimuovi blocchi
setblock 882343 248 -102491 air
setblock 882344 248 -102491 air
setblock 882345 248 -102491 air
setblock 882346 248 -102491 air
setblock 882347 248 -102491 air

# Rimuovi blocchi dalla griglia (in contemporanea)
execute if data storage racetimer:current {circuit:"snowy_race"} run function racetimer:circuits/snowy_race/grid_clear

# Parti i giocatori
execute as @a[tag=starting_race] run function racetimer:circuits/snowy_race/start
tag @a[tag=starting_race] remove starting_race
