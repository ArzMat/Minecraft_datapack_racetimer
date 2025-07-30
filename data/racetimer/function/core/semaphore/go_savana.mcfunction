# AGGIUNGI LE COORDINATE QUANDO CONFIGURI SAVANA
# Spegni tutte le copper bulb
# setblock X Y Z waxed_copper_bulb[lit=false]
# setblock X Y Z waxed_copper_bulb[lit=false]
# setblock X Y Z waxed_copper_bulb[lit=false]
# setblock X Y Z waxed_copper_bulb[lit=false]
# setblock X Y Z waxed_copper_bulb[lit=false]

# Rimuovi blocchi
# setblock XXX YY ZZZ air
# setblock XXX YY ZZZ air
# setblock XXX YY ZZZ air
# setblock XXX YY ZZZ air
# setblock XXX YY ZZZ air

# Rimuovi blocchi dalla griglia (in contemporanea)
execute if data storage racetimer:current {circuit:"savana"} run function racetimer:circuits/savana/grid_clear

# Parti i giocatori
execute as @a[tag=starting_race] run function racetimer:circuits/savana/start
tag @a[tag=starting_race] remove starting_race