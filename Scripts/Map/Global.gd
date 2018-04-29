extends Node2D

var save_data = { stages_won = 0, \
island_coins = 0,\
mountain_coins = 0,\
grass_coins = 0}

func _ready():
	# Stage Manage
	get_tree().get_root().get_node("/root/PlayerData").current_stage = -1
	
	# Music
	var strt_music = get_tree().get_root().get_node("/root/StartingMusic")
	strt_music.get_node("StartingMusic")
	if !strt_music.is_playing():
		strt_music.play(1.5)
	
	# Check if there is a saved file
	var file = File.new()
	if not file.file_exists("user://saved_game.sav"):
		# Open a file
		if file.open("user://saved_game.sav", File.WRITE) != 0:
   		print("Error opening file")
		file.store_line(save_data.to_json())
		file.close()
	else:
		# Open existing file
		if file.open("user://saved_game.sav", File.READ) != 0:
			print("Error opening file")
	    	# Get the data
		save_data.parse_json(file.get_line())
		print("Data Read : ", save_data.to_json())
	
	if save_data.stages_won > 0:
		get_node("Map/Right_Level/GrassLock").hide()
		get_node("Map/Down_Level/Down_Tick").show()
	if save_data.stages_won > 1:
		get_node("Map/Left_Level/IslandLock").hide()
		get_node("Map/Right_Level/Right_Tick").show()
	if save_data.stages_won > 2:
		get_node("Map/Left_Level/Left_Tick").show()