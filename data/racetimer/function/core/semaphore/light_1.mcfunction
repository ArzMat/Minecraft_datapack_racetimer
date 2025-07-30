# Accende la prima luce E rimuove i blocchi dalla griglia

# Accendi prima copper bulb
execute if data storage racetimer:current {circuit:"snowy_race"} run setblock 882343 251 -102491 waxed_copper_bulb[lit=true]
execute if data storage racetimer:current {circuit:"deserto"} run setblock -1539 67 -810 waxed_copper_bulb[lit=true]

