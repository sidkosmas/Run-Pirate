extends Area2D

var sprite
var locked

func _ready():
	sprite = get_node("Left_Tick")
	locked = get_node("IslandLock")

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		if locked.is_hidden():
			print("Left Level")
			get_tree().change_scene("res://Scenes/TheIsland.tscn")		
		pass