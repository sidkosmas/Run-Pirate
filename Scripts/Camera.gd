var player
var daggers
var away_from_player = 0

func _ready():
	player = get_node("../Player")
	daggers = get_node("../Daggers")
	var pos = player.get_pos()
	pos = Vector2(round(pos.x), round(pos.y))
	set_pos(pos)
	set_fixed_process(true)
	
	var strt_music = get_tree().get_root().get_node("/root/StartingMusic")
	strt_music.get_node("StartingMusic")
	strt_music.stop()
	
func _fixed_process(delta):
	set_pos(Vector2(round(player.get_pos().x + away_from_player), round(get_pos().y)))
	if !player.pause_game:
		if !player.player_stuck:		
			if away_from_player != 0:
				away_from_player -= 30
		else: 
			if away_from_player != 4110:
				away_from_player += 30
	
		if away_from_player > 2000:
			daggers.show()
		elif away_from_player < 1800:	
			daggers.hide()
		
		#print(away_from_player)