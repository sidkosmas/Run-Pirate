extends Sprite

var daggerControl
var animationPlayer
var camera2d
var freeze

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	camera2d = get_node("../../Camera2D")
	daggerControl = get_node("../")
	animationPlayer.set_speed(2.0)
	animationPlayer.play("spinning")
	get_node("Area2D").connect("body_enter",self,"_on_Area2D_body_enter")
	set_fixed_process(true)
	freeze = false

func _fixed_process(delta):
	
	if !freeze:
		set_pos(Vector2(round(camera2d.get_pos().x - 4200), get_pos().y - 35))
	
		if get_pos().y < -682:
			set_pos(Vector2(round(camera2d.get_pos().x - 4200), 8173))
	else:
		animationPlayer.stop()
		
func _on_Area2D_body_enter(body):
	if body.get_name() == "Player":
		daggerControl.player_hit = true
		print("Player Hit")