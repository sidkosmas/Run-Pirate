extends Node2D

var parent
var area2d
var player

func _ready():
	parent = get_node("../")
	area2d = get_node("Area2D")
	player = get_node("../../../Player")
	area2d.connect("body_enter", self, "_on_Area2D_body_enter")
	hide()
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var current_pos = get_pos()
	
	if parent.throw_projectile:
		show()
		set_pos(Vector2(\
round(current_pos.x + (parent.attack_direction * (4000 * delta))), \
round(current_pos.y)))
	pass
	
func _on_Area2D_body_enter(body):
	if body.get_name() == "Player":
		print("Player Hit")
		player.alive = false
		get_node("../../../SFX").play("Player Hit")
		parent.queue_free()
