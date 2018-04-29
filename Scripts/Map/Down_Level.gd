extends Area2D

var sprite

func _ready():
	sprite = get_node("Down_Tick")

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Down Level")
		get_tree().get_root().get_node("/root/PlayerData").current_stage = 0
		get_tree().change_scene("res://Scenes/TheMountain.tscn")