# Inizia sequenza semaforo
scoreboard players set #semaphore_active semaphore_state 1
scoreboard players set #semaphore_timer semaphore_timer 0

# Genera delay random (20-140 tick = 1-7 secondi)
execute store result score #random_delay random_delay run random value 10..140

# Salva chi ha attivato la partenza
tag @a[distance=..20] add starting_race