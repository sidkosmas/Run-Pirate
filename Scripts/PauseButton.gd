extends Area2D

var collected_node
var animationPlayer
var timer
var sprite
var pause_sprite
var player

func _ready():
	player = get_node("../Player")
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
		player.pause_button = true
		animationPlayer.play("button_press")
		timer.start()
		pass
	
	if event.is_action_released("ui_accept"):
		player.pause_button = false
	

func _fixed_process(delta):
	
	set_pos(Vector2(round(collected_node.get_pos().x - 1850), round(collected_node.get_pos().y)))

func _on_Timer_timeout():
	sprite.set_texture(pause_sprite)
	player.pause_game = not player.pause_game
	if !player.pause_game:
		player.animationPlayer.play("run")
	pass # replace with function body
