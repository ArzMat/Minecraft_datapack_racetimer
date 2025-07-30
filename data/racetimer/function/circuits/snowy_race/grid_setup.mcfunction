# Piazza tutti i 12 blocchi in griglia
setblock 882344 248 -102493 minecraft:deepslate_tiles
setblock 882346 248 -102494 minecraft:deepslate_tiles
setblock 882344 248 -102496 minecraft:deepslate_tiles
setblock 882346 248 -102497 minecraft:deepslate_tiles
setblock 882344 248 -102499 minecraft:deepslate_tiles
setblock 882346 248 -102500 minecraft:deepslate_tiles
setblock 882344 248 -102502 minecraft:deepslate_tiles
setblock 882346 248 -102503 minecraft:deepslate_tiles
setblock 882344 248 -102505 minecraft:deepslate_tiles
setblock 882346 248 -102506 minecraft:deepslate_tiles
setblock 882344 248 -102508 minecraft:deepslate_tiles
setblock 882346 248 -102509 minecraft:deepslate_tiles

# Piazza gli slab sulla linea di partenza
fill 882343 248 -102491 882347 248 -102491 minecraft:deepslate_tile_slab[type=top]

# Feedback
tellraw @a [{"text":"[RaceTimer] ","color":"gold"},{"text":"Griglia di partenza Snowy Race pronta!","color":"green"}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2