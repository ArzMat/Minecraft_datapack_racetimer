# Calculate seconds
scoreboard players operation @s secondi = @s tempo
scoreboard players operation @s secondi /= #20 costanti

# Calculate minutes
scoreboard players operation @s minuti = @s secondi
scoreboard players operation @s minuti /= #60 costanti

# Calculate remaining seconds
scoreboard players operation @s secondi_resto = @s secondi
scoreboard players operation @s secondi_resto %= #60 costanti

# Calculate centiseconds (5 centisecond precision)
scoreboard players operation @s centesimi = @s tempo
scoreboard players operation @s centesimi %= #20 costanti
scoreboard players operation @s centesimi *= #100 costanti
scoreboard players operation @s centesimi /= #20 costanti

# Format seconds with leading zero
# execute if score @s secondi_resto matches 0..9 run data modify storage racetimer:temp secondi_format set value "0"
# execute if score @s secondi_resto matches 10.. run data modify storage racetimer:temp secondi_format set value ""

# Format centiseconds with leading zero
# execute if score @s centesimi matches 0..9 run data modify storage racetimer:temp centesimi_format set value "0"
# execute if score @s centesimi matches 10.. run data modify storage racetimer:temp centesimi_format set value ""

# Decine secondi
scoreboard players operation @s sec_decine = @s secondi_resto
scoreboard players operation @s sec_decine /= #10 costanti

# Unità secondi
scoreboard players operation @s sec_unita = @s secondi_resto
scoreboard players operation @s sec_unita %= #10 costanti

# Decine centesimi
scoreboard players operation @s cent_decine = @s centesimi
scoreboard players operation @s cent_decine /= #10 costanti

# Unità centesimi
scoreboard players operation @s cent_unita = @s centesimi
scoreboard players operation @s cent_unita %= #10 costanti
