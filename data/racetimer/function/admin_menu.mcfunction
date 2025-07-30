# === MENU ADMIN PER GESTIRE I RECORD ===
# racetimer/function/admin_menu.mcfunction
# Uso: /function racetimer:admin_menu

tellraw @s {"text":"\n=== RACETIMER ADMIN MENU ===","color":"gold","bold":true}

# DESERTO
tellraw @s {"text":"[DESERTO]","color":"yellow","bold":true}

tellraw @s ["",{"text":"  [Reset WR] ","color":"red","click_event":{"action":"run_command","value":"/function racetimer:circuits/deserto/reset_wr"}},{"text":"[Reset PB (tutti)] ","color":"red","click_event":{"action":"run_command","value":"/function racetimer:circuits/deserto/reset_pb_all"}},{"text":"[Reset MIO PB] ","color":"orange","click_event":{"action":"run_command","value":"/execute as @s run function racetimer:circuits/deserto/reset_pb"}}]

tellraw @s ["",{"text":"  [Mostra WR] ","color":"light_purple","click_event":{"action":"run_command","value":"/function racetimer:circuits/deserto/show_records"}},{"text":"[Mostra miei PB] ","color":"green","click_event":{"action":"run_command","value":"/execute as @s run function racetimer:circuits/deserto/show_pb"}}]

# SAVANA
tellraw @s {"text":"\n[SAVANA]","color":"yellow","bold":true}

tellraw @s ["",{"text":"  [Reset WR] ","color":"red","click_event":{"action":"run_command","value":"/function racetimer:circuits/savana/reset_wr"}},{"text":"[Reset PB (tutti)] ","color":"red","click_event":{"action":"run_command","value":"/function racetimer:circuits/savana/reset_pb_all"}},{"text":"[Reset MIO PB] ","color":"orange","click_event":{"action":"run_command","value":"/execute as @s run function racetimer:circuits/savana/reset_pb"}}]

tellraw @s ["",{"text":"  [Mostra WR] ","color":"light_purple","click_event":{"action":"run_command","value":"/function racetimer:circuits/savana/show_records"}},{"text":"[Mostra miei PB] ","color":"green","click_event":{"action":"run_command","value":"/execute as @s run function racetimer:circuits/savana/show_pb"}}]

# SNOWY RACE
tellraw @s {"text":"\n[SNOWY RACE]","color":"aqua","bold":true}

tellraw @s ["",{"text":"  [Reset WR] ","color":"red","click_event":{"action":"run_command","value":"/function racetimer:circuits/snowy_race/reset_wr"}},{"text":"[Reset PB (tutti)] ","color":"red","click_event":{"action":"run_command","value":"/function racetimer:circuits/snowy_race/reset_pb_all"}},{"text":"[Reset MIO PB] ","color":"orange","click_event":{"action":"run_command","value":"/execute as @s run function racetimer:circuits/snowy_race/reset_pb"}}]

tellraw @s ["",{"text":"  [Mostra WR] ","color":"light_purple","click_event":{"action":"run_command","value":"/function racetimer:circuits/snowy_race/show_records"}},{"text":"[Mostra miei PB] ","color":"green","click_event":{"action":"run_command","value":"/execute as @s run function racetimer:circuits/snowy_race/show_pb"}}]

tellraw @s {"text":"\n===========================","color":"gold","bold":true}