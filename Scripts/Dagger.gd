extends KinematicBody2D


const MAX_SPEED = 300
const GRAVITY = 20000

var velocity = Vector2()
var speed_y = 1000
var y_direction = 1;
var x_direction = 1;

var movement_remainder
var animationPlayer
var sprite
var timer_state = true
var moving = false

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("spinning")
	set_fixed_process(true)

func _fixed_process(delta):
	
	#speed_y += y_direction * (GRAVITY * delta)
	velocity.x = (x_direction * MAX_SPEED) * delta
	#velocity.y = speed_y * delta	
	movement_remainder = move(velocity)
	
	if is_colliding():
		pass
