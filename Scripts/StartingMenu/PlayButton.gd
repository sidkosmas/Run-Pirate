extends Area2D

var timer
var animationPlayer

func _ready():
	timer = get_node("Timer")
	animationPlayer = get_node("AnimationPlayer")

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Play")
		animationPlayer.play("button_press")
		timer.start()
		pass

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Map.tscn")
	pass # replace with function body
