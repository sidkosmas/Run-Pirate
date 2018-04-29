extends Node

func _ready():
	get_tree().get_root().get_node("/root/PlayerData").current_stage = -1
	
	# Music
	var strt_music = get_tree().get_root().get_node("/root/StartingMusic")
	strt_music.get_node("StartingMusic")
	if !strt_music.is_playing():
		strt_music.play(1.5)