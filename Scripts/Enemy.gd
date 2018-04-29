extends KinematicBody2D

export var y_direction = 1;
export var x_direction = -1;
export var attack_direction = 1;

const MAX_SPEED = 3000
const GRAVITY = 20000
var speed_y = 1000
var velocity = Vector2()


var movement_remainder
var movement_activated = false
var throw_projectile = false

var samplePlayer
var animationPlayer
var sprite
var timer
var player
var one_time_timer = true

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	player = get_node("../../Player")
	timer = get_node("Timer")
	samplePlayer = get_node("../../SFX")
	sprite = get_node("Sprite")
	animationPlayer.play("run")
	set_fixed_process(true)

func _fixed_process(delta):

	# Physics	
	#print("Player ", player.get_pos().x, ", Enemy ", get_pos().x)
	if (get_pos().x - player.get_pos().x) < 4890:
		movement_activated = true
		if one_time_timer:
			timer.start()
			one_time_timer = false
	
	if (player.get_pos().x - get_pos().x) > 4890:
		queue_free()
	
	if movement_activated:
		speed_y += y_direction * (GRAVITY * delta)
		velocity.x = (x_direction * MAX_SPEED) * delta
		velocity.y = speed_y * delta	
		movement_remainder = move(velocity)
	
		if get_pos().y < -506 or get_pos().y > 5816:
			print("Enemy out of Y-Axis area")
			queue_free()
	
		if is_colliding():
			var normal = get_collision_normal()
			var final_movement = normal.slide(movement_remainder)
			speed_y = normal.slide(Vector2(0, speed_y)).y
			move(final_movement)
	
	# Physics - END

func _on_Timer_timeout():
	throw_projectile = true
	var woosh = samplePlayer.play("Woosh 1", false)
	pass # replace with function body

func mirror_sprite(var b):
	sprite.set_flip_h(b)