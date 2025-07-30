# Piazza tutti i 12 blocchi in griglia per il Deserto
setblock -1538 65 -803 minecraft:deepslate_tiles
setblock -1536 65 -802 minecraft:deepslate_tiles
setblock -1538 65 -800 minecraft:deepslate_tiles
setblock -1536 65 -799 minecraft:deepslate_tiles
setblock -1538 65 -797 minecraft:deepslate_tiles
setblock -1536 65 -796 minecraft:deepslate_tiles
setblock -1538 65 -794 minecraft:deepslate_tiles
setblock -1536 65 -793 minecraft:deepslate_tiles
setblock -1538 65 -791 minecraft:deepslate_tiles
setblock -1536 65 -790 minecraft:deepslate_tiles
setblock -1538 65 -788 minecraft:deepslate_tiles
setblock -1536 65 -787 minecraft:deepslate_tiles

# Piazza gli slab sulla linea di partenza
fill -1540 65 -810 -1534 65 -810 minecraft:deepslate_tile_slab[type=top]

# Feedback
tellraw @a [{"text":"[RaceTimer] ","color":"gold"},{"text":"Griglia di partenza Deserto pronta!","color":"yellow"}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2