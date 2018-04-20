extends KinematicBody2D

const MAX_SPEED = 3000
const GRAVITY = 20000

var velocity = Vector2()
var speed_y = 1000
var can_jump = false
var released = false
var y_direction = 1;

var max_y = -500
var min_y = 5900

var animationPlayer
var movement_remainder
var sprite
var alive

var moving = false

var coins = 0

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	sprite = get_node("Sprite")
	animationPlayer.play("stand")
	alive = true
	set_fixed_process(true)
	set_process_input(true)
	
func _input(event):
	if event.is_action_released("ui_accept"):
		released = true

func _fixed_process(delta):
	if (Input.is_action_pressed("ui_accept")):
		if(can_jump && released):
			y_direction = y_direction * (-1);
			animationPlayer.stop(true)
			if(y_direction == -1):
				animationPlayer.play("flip_up")
			else: animationPlayer.play("flip_down")
			released = false
	
	speed_y += y_direction * (GRAVITY * delta)
	velocity.x = MAX_SPEED * delta
	velocity.y = speed_y * delta
	
	if alive:
		movement_remainder = move(velocity)
	else: movement_remainder = 0
	
	if get_pos().y > min_y || get_pos().y < max_y :
		print("Player out of borders")
		get_node("../Dead").show()
		alive = false
	
	if is_colliding():
		var normal = get_collision_normal()
		var final_movement = normal.slide(movement_remainder)
		speed_y = normal.slide(Vector2(0, speed_y)).y
		if alive:
			move(final_movement)
		can_jump = true
	else:
		can_jump = false
	
	if !moving:
		animationPlayer.play("run")
		moving = true

func mirror_sprite(var b):
	sprite.set_flip_h(b)

func flip_ended():
	moving = false