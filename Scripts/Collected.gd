extends Node2D

var camera2d
var player

func _ready():
	camera2d = get_node("../Camera2D")
	player = get_node("../Player")
	set_fixed_process(true)	
	get_node("CoinOne").hide()
	get_node("CoinTwo").hide()
	get_node("CoinThree").hide()
	pass

func _fixed_process(delta):			
	if player.coins == 1:
		get_node("CoinOne").show()
	elif player.coins == 2:
		get_node("CoinTwo").show()
	elif player.coins == 3:
		get_node("CoinThree").show()
	
	set_pos(Vector2(round(player.get_pos().x) - 3000, round(camera2d.get_pos().y) - 2300))
	pass
	