extends Sprite

var player
var animationPlayer

func _ready():
	player = get_node("../../Player")
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("shake_bottle")
	get_node("Area2D").connect("body_enter",self,"_on_Area2D_body_enter")
	pass

func _on_Area2D_body_enter(body):
	if body.get_name() == "Player":
		player.bottle_number += 1
		hide()
		queue_free()