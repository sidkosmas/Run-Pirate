extends Area2D

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Dead : Stage Select Button")
		get_tree().change_scene("res://Scenes/Map.tscn")
		pass