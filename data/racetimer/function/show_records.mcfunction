# Mostra menu per scegliere quale record visualizzare
tellraw @p ["",{"text":"=== RACING TIMER RECORDS ===","color":"gold","bold":true}]
tellraw @p ["",{"text":"[Snowy Race]","color":"aqua","clickEvent":{"action":"run_command","value":"/function racetimer:circuits/snowy_race/show_records"},"hoverEvent":{"action":"show_text","value":"Clicca per vedere i record"}}]
tellraw @p ["",{"text":"[Deserto]","color":"yellow","clickEvent":{"action":"run_command","value":"/function racetimer:circuits/deserto/show_records"},"hoverEvent":{"action":"show_text","value":"Clicca per vedere i record"}}]
tellraw @p ["",{"text":"[Savana]","color":"green","clickEvent":{"action":"run_command","value":"/function racetimer:circuits/savana/show_records"},"hoverEvent":{"action":"show_text","value":"Clicca per vedere i record"}}]
