extends Sprite

var animationPlayer
var sfx

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("shine")
	sfx = get_node("../../SFX")
	pass

func _on_Area2D_body_enter( body ):
	get_node("../../Player").coins += 1
	sfx.play("Coin Pickup")
	queue_free()
	pass # replace with function body
