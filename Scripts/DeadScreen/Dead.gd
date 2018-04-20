extends Node2D

var camera2d

func _ready():
	camera2d = get_node("../Camera2D")
	set_fixed_process(true)	
	pass

func _fixed_process(delta):			
	set_pos(Vector2(round(camera2d.get_pos().x), round(camera2d.get_pos().y)))
	pass