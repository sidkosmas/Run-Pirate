extends Area2D

var collected_node
var animationPlayer
var timer
var sprite
var pause_sprite

func _ready():
	pause_sprite = preload("res://Sprites/Buttons/unpressed/yellow/pause.png")
	collected_node = get_node("../Collected")
	timer = get_node("Timer")
	animationPlayer = get_node("AnimationPlayer")
	sprite = get_node("PauseButton")
	set_fixed_process(true)
	pass

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Pause")
		animationPlayer.play("button_press")
		timer.start()
		pass

func _fixed_process(delta):
	
	set_pos(Vector2(round(collected_node.get_pos().x - 1850), round(collected_node.get_pos().y)))

func _on_Timer_timeout():
	get_tree().set_pause(true)
	sprite.set_texture(pause_sprite)
	pass # replace with function body
