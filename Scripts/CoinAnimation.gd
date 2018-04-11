extends Sprite

var animationPlayer

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("shine")
	pass

func _on_Area2D_body_enter( body ):
	get_node("../../Player").coins += 1
	queue_free()
	pass # replace with function body
