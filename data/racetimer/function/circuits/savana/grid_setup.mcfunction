# Piazza tutti i 12 blocchi in griglia per la Savana
setblock -562 67 879 minecraft:deepslate_tiles
setblock -560 67 880 minecraft:deepslate_tiles
setblock -562 67 882 minecraft:deepslate_tiles
setblock -560 67 883 minecraft:deepslate_tiles
setblock -562 67 885 minecraft:deepslate_tiles
setblock -560 67 886 minecraft:deepslate_tiles
setblock -562 67 888 minecraft:deepslate_tiles
setblock -560 67 889 minecraft:deepslate_tiles
setblock -562 67 891 minecraft:deepslate_tiles
setblock -560 67 892 minecraft:deepslate_tiles
setblock -562 67 894 minecraft:deepslate_tiles
setblock -560 67 895 minecraft:deepslate_tiles

# Piazza gli slab sulla linea di partenza
fill -565 67 875 -557 67 875 minecraft:acacia_slab[type=top]

# Feedback
tellraw @a [{"text":"[RaceTimer] ","color":"gold"},{"text":"Griglia di partenza Savana pronta!","color":"#F4A460"}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2