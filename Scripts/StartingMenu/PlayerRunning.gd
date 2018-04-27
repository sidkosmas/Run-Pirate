extends KinematicBody2D

const MAX_SPEED = 300
const GRAVITY = 20000

var velocity = Vector2()
var speed_y = 1000
var y_direction = 1;
var x_direction = 1;

var animationPlayer
var movement_remainder
var sprite
var timer_state = true
var moving = false

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	sprite = get_node("Sprite")
	animationPlayer.play("stand")
	set_fixed_process(true)

func _fixed_process(delta):
	
	speed_y += y_direction * (GRAVITY * delta)
	velocity.x = (x_direction * MAX_SPEED) * delta
	velocity.y = speed_y * delta	
	movement_remainder = move(velocity)
	
	if get_pos().x > 2200 || get_pos().x < 890:
		print("Player out of the screen")
		if timer_state:
			x_direction *= -1
			y_direction *= -1
		timer_state = false
		get_node("Timer").start()
	
	if x_direction == -1:
		sprite.set_flip_h(true)
	else:
		sprite.set_flip_h(false)
	
	if is_colliding():
		var normal = get_collision_normal()
		var final_movement = normal.slide(movement_remainder)
		speed_y = normal.slide(Vector2(0, speed_y)).y
		move(final_movement)
	
	if !moving:
		animationPlayer.play("run")
		moving = true

func _on_Timer_timeout():
	timer_state = true
	pass # replace with function body
