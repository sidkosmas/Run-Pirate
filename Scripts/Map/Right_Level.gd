extends Area2D

var sprite
var locked

func _ready():
	sprite = get_node("Right_Tick")
	locked = get_node("GrassLock")
	
func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		if locked.is_hidden():
			print("Right Level")
			get_tree().change_scene("res://Scenes/TheGrass.tscn")
			pass