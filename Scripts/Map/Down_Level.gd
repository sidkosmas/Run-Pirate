extends Area2D

var sprite

func _ready():
	sprite = get_node("Down_Tick")

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Down Level")
		pass