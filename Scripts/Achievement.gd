extends Node2D

var save_data = { stages_won = 0, \
island_coins = 0,\
mountain_coins = 0,\
grass_coins = 0}

func _ready():
	var file = File.new()
	# Open existing file
	if not file.file_exists("user://saved_game.sav"):
		# Open a file
		if file.open("user://saved_game.sav", File.WRITE) != 0:
   		print("Error opening file")
		file.store_line(save_data.to_json())
		file.close()
	
	if file.open("user://saved_game.sav", File.READ) != 0:
		print("Error opening file")
	save_data.parse_json(file.get_line())
	if save_data.mountain_coins == 1: 
		get_node("StageOne/Coin1").show()
	if save_data.mountain_coins == 2: 
		get_node("StageOne/Coin1").show()
		get_node("StageOne/Coin2").show()
	if save_data.mountain_coins == 3: 
		get_node("StageOne/Coin1").show()
		get_node("StageOne/Coin2").show()
		get_node("StageOne/Coin3").show()
	
	if save_data.grass_coins == 1: 
		get_node("StageTwo/Coin1").show()
	if save_data.grass_coins == 2: 
		get_node("StageTwo/Coin1").show()
		get_node("StageTwo/Coin2").show()
	if save_data.grass_coins == 3: 
		get_node("StageTwo/Coin1").show()
		get_node("StageTwo/Coin2").show()
		get_node("StageTwo/Coin3").show()
	
	if save_data.island_coins == 1: 
		get_node("StageThree/Coin1").show()
	if save_data.island_coins == 2: 
		get_node("StageThree/Coin1").show()
		get_node("StageThree/Coin2").show()
	if save_data.island_coins == 3: 
		get_node("StageThree/Coin1").show()
		get_node("StageThree/Coin2").show()
		get_node("StageThree/Coin3").show()
	
	pass
