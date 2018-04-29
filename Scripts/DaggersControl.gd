extends Node2D

var player
var player_hit

func _ready():
	player = get_node("../Player")
	player_hit = false
	set_fixed_process(true)
	hide() # Dagger hide/show control in Camera.gd script
	
func _fixed_process(delta):
	if player_hit:
		print("Player got hit from daggers")
		player.alive = false
		get_node("Dagger").freeze = true
		get_node("Dagger1").freeze = true
		get_node("Dagger2").freeze = true
		get_node("Dagger3").freeze = true
	pass
