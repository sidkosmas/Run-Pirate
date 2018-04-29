extends Node2D

var player

func _ready():
	get_node("Area2D").connect("body_enter", self, "_on_Area2D_body_enter")	
	player = get_node("../../Player")
	pass

func _on_Area2D_body_enter(body):
	if body.get_name() == "Player":
		player.stage_won = true		
		print("Stage Won")

