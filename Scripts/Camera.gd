export var target = "../Player"

onready var target_node = get_node(target)
func _ready():
	var pos = target_node.get_pos()
	pos = Vector2(round(pos.x), round(pos.y))
	set_pos(pos)
	set_fixed_process(true)
	
func _fixed_process(delta):
	set_pos(Vector2(round(target_node.get_pos().x), round(get_pos().y)))