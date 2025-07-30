# File di test per verificare che la formattazione funzioni
# Mettilo in racetimer/function/test_formatting.mcfunction
# Esegui con: /function racetimer:test_formatting

tellraw @a ["",{"text":"=== TEST FORMATTAZIONE TEMPI ===","color":"gold","bold":true}]

# Test 1: 9.25 secondi (dovrebbe mostrare 0:09.25)
scoreboard players set @s tempo 185
function racetimer:core/calculate_time
tellraw @a ["",{"text":"Test 185 tick (9.25s): ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"@s","objective":"sec_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"sec_unita"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"@s","objective":"cent_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"cent_unita"},"color":"aqua"}]

# Test 2: 1 minuto 7.5 secondi (dovrebbe mostrare 1:07.50)
scoreboard players set @s tempo 1350
function racetimer:core/calculate_time
tellraw @a ["",{"text":"Test 1350 tick (1:07.50): ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"@s","objective":"sec_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"sec_unita"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"@s","objective":"cent_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"cent_unita"},"color":"aqua"}]

# Test 3: 10.05 secondi (dovrebbe mostrare 0:10.05)
scoreboard players set @s tempo 201
function racetimer:core/calculate_time
tellraw @a ["",{"text":"Test 201 tick (10.05s): ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"@s","objective":"sec_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"sec_unita"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"@s","objective":"cent_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"cent_unita"},"color":"aqua"}]

# Test 4: 2 minuti 30 secondi (dovrebbe mostrare 2:30.00)
scoreboard players set @s tempo 3000
function racetimer:core/calculate_time
tellraw @a ["",{"text":"Test 3000 tick (2:30.00): ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"@s","objective":"sec_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"sec_unita"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"@s","objective":"cent_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"cent_unita"},"color":"aqua"}]

# Test 5: 0.05 secondi (dovrebbe mostrare 0:00.05)
scoreboard players set @s tempo 1
function racetimer:core/calculate_time
tellraw @a ["",{"text":"Test 1 tick (0.05s): ","color":"yellow"},{"score":{"name":"@s","objective":"minuti"},"color":"aqua"},{"text":":","color":"aqua"},{"score":{"name":"@s","objective":"sec_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"sec_unita"},"color":"aqua"},{"text":".","color":"aqua"},{"score":{"name":"@s","objective":"cent_decine"},"color":"aqua"},{"score":{"name":"@s","objective":"cent_unita"},"color":"aqua"}]

tellraw @a ["",{"text":"=== FINE TEST ===","color":"gold","bold":true}]