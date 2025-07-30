# Metodo semplice che funziona in 1.21.8
summon armor_stand ~ ~ ~ {Invisible:1b,Tags:["name_getter"],CustomNameVisible:0b}
loot replace entity @e[type=armor_stand,tag=name_getter,limit=1] armor.head loot racetimer:player_name
data modify storage racetimer:temp player_name set from entity @e[type=armor_stand,tag=name_getter,limit=1] ArmorItems[3].components."minecraft:profile".name
kill @e[type=armor_stand,tag=name_getter]