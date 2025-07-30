# Gestione stati semaforo
execute if score #semaphore_active semaphore_state matches 1..7 run scoreboard players add #semaphore_timer semaphore_timer 1

# Accensione sequenziale (ogni 10 tick = 0.5s)
execute if score #semaphore_active semaphore_state matches 1 if score #semaphore_timer semaphore_timer matches 1 run function racetimer:core/semaphore/light_1
execute if score #semaphore_active semaphore_state matches 1 if score #semaphore_timer semaphore_timer matches 10 run function racetimer:core/semaphore/next_state

execute if score #semaphore_active semaphore_state matches 2 if score #semaphore_timer semaphore_timer matches 1 run function racetimer:core/semaphore/light_2
execute if score #semaphore_active semaphore_state matches 2 if score #semaphore_timer semaphore_timer matches 10 run function racetimer:core/semaphore/next_state

execute if score #semaphore_active semaphore_state matches 3 if score #semaphore_timer semaphore_timer matches 1 run function racetimer:core/semaphore/light_3
execute if score #semaphore_active semaphore_state matches 3 if score #semaphore_timer semaphore_timer matches 10 run function racetimer:core/semaphore/next_state

execute if score #semaphore_active semaphore_state matches 4 if score #semaphore_timer semaphore_timer matches 1 run function racetimer:core/semaphore/light_4
execute if score #semaphore_active semaphore_state matches 4 if score #semaphore_timer semaphore_timer matches 10 run function racetimer:core/semaphore/next_state

execute if score #semaphore_active semaphore_state matches 5 if score #semaphore_timer semaphore_timer matches 1 run function racetimer:core/semaphore/light_5
execute if score #semaphore_active semaphore_state matches 5 if score #semaphore_timer semaphore_timer matches 10 run function racetimer:core/semaphore/next_state

# Attesa random
execute if score #semaphore_active semaphore_state matches 6 if score #semaphore_timer semaphore_timer >= #random_delay random_delay run function racetimer:core/semaphore/go