# File principale che chiama quello giusto
execute at @a[tag=starting_race] run playsound minecraft:block.note_block.pling player @a ~ ~ ~ 2 2

execute if data storage racetimer:current {circuit:"snowy_race"} run function racetimer:core/semaphore/go_snowy_race
execute if data storage racetimer:current {circuit:"deserto"} run function racetimer:core/semaphore/go_deserto
execute if data storage racetimer:current {circuit:"savana"} run function racetimer:core/semaphore/go_savana

scoreboard players set #semaphore_active semaphore_state 0
data remove storage racetimer:current circuit