extends Area2D

var animationPlayer
var timer

func _ready():
	animationPlayer = get_node("Sprite/AnimationPlayer")
	timer = get_node("Timer")

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Play")
		animationPlayer.play("press_button")
		timer.start()
		pass

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/StartingMenu.tscn")
	pass # replace with function body
