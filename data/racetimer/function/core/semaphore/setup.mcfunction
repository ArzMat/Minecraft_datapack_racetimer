# Setup semaphore system
scoreboard objectives add semaphore_state dummy
scoreboard objectives add semaphore_timer dummy
scoreboard objectives add random_delay dummy

# Stati: 0=idle, 1-5=accensione luci, 6=attesa random, 7=go
scoreboard players set #semaphore_active semaphore_state 0