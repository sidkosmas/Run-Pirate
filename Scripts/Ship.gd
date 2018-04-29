extends Node2D

export var level = 0
var player
var timer
var save_data = { stages_won = level + 1, \
island_coins = 0,\
mountain_coins = 0,\
grass_coins = 0}

func _ready():
	get_node("Area2D").connect("body_enter", self, "_on_Area2D_body_enter")	
	player = get_node("../../Player")
	timer = get_node("../Timer")
	save_data.stages_won = level + 1
	pass

func _on_Area2D_body_enter(body):
	if body.get_name() == "Player":
		player.arived_at_ship = true
		player.hide()
		timer.start()
		print("Into the ship!!!")
		
		var file = File.new()
		if not file.file_exists("user://saved_game.sav"):
		# Open a file
			if file.open("user://saved_game.sav", File.WRITE) != 0:
   			print("Error opening file")
			file.store_line(save_data.to_json())
			file.close()
		else:
			var read_file = { stages_won = level + 1, \
island_coins = 0,\
mountain_coins = 0,\
grass_coins = 0}
			if file.open("user://saved_game.sav", File.READ) != 0:
				print("Error opening file")
	    		# Get the data
			read_file.parse_json(file.get_line())
			file.close()
			
			if level == 0: read_file.mountain_coins = player.coins
			elif level == 1: read_file.grass_coins = player.coins
			elif level == 2: read_file.island_coins = player.coins
			if read_file.stages_won == level:
				read_file.stages_won = save_data.stages_won
			if file.open("user://saved_game.sav", File.WRITE) != 0:
   				print("Error opening file")
			file.store_line(read_file.to_json())
			file.close()
			
func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Map.tscn")
	pass # replace with function body
