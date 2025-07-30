# racetimer/function/core/format_time.mcfunction
# Formatta il tempo corrente e lo salva nel storage
# Input: @s con minuti, secondi_resto, centesimi già calcolati
# Output: storage racetimer:format time con JSON formattato correttamente

# Metodo 1: Usa direttamente i valori già calcolati per costruire il display
# Questo crea un JSON array che può essere usato direttamente nei tellraw

# Caso 1: secondi < 10, centesimi < 10 (X:0X.0X)
execute if score @s secondi_resto matches 0..9 if score @s centesimi matches 0..9 run data modify storage racetimer:format time set value [{"score":{"name":"@s","objective":"minuti"}},{"text":":0"},{"score":{"name":"@s","objective":"secondi_resto"}},{"text":".0"},{"score":{"name":"@s","objective":"centesimi"}}]

# Caso 2: secondi < 10, centesimi >= 10 (X:0X.XX)
execute if score @s secondi_resto matches 0..9 if score @s centesimi matches 10.. run data modify storage racetimer:format time set value [{"score":{"name":"@s","objective":"minuti"}},{"text":":0"},{"score":{"name":"@s","objective":"secondi_resto"}},{"text":"."},{"score":{"name":"@s","objective":"centesimi"}}]

# Caso 3: secondi >= 10, centesimi < 10 (X:XX.0X)
execute if score @s secondi_resto matches 10.. if score @s centesimi matches 0..9 run data modify storage racetimer:format time set value [{"score":{"name":"@s","objective":"minuti"}},{"text":":"},{"score":{"name":"@s","objective":"secondi_resto"}},{"text":".0"},{"score":{"name":"@s","objective":"centesimi"}}]

# Caso 4: secondi >= 10, centesimi >= 10 (X:XX.XX)
execute if score @s secondi_resto matches 10.. if score @s centesimi matches 10.. run data modify storage racetimer:format time set value [{"score":{"name":"@s","objective":"minuti"}},{"text":":"},{"score":{"name":"@s","objective":"secondi_resto"}},{"text":"."},{"score":{"name":"@s","objective":"centesimi"}}]