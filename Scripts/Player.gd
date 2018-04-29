extends KinematicBody2D

# Physics
const MAX_SPEED = 3000
const GRAVITY = 20000
const SPEED_BONUS = 350
var velocity = Vector2()
var speed_y = 1000
var y_direction = 1;
var movement_remainder

# Player Y-Axis limits
var max_y = -500
var min_y = 6500

# Player Child Nodes
var animationPlayer
var sprite

# Player Status
var alive = true
var can_jump = false
var released = false
var moving = false
var timer_pass = true

var pause_game = false
var pause_button = false

# Variables that check if the player is stucked.
var last_x_pos
var last_y_pos
var counter = 0

var player_stuck = false

# The number of coins the player has collected
# The total speed from the bottles
var coins = 0
var bottle_number = 0

# Stage Won
var stage_won = false
var arived_at_ship = false


func _ready():
	animationPlayer = get_node("AnimationPlayer")
	sprite = get_node("Sprite")
	
	alive = true
	last_x_pos = get_pos().x
	last_y_pos = get_pos().y
			
	set_fixed_process(true)
	set_process_input(true)
	
func _input(event):
	if event.is_action_released("ui_accept"):
		released = true

func _fixed_process(delta):	
	if alive and !pause_game:
		if (Input.is_action_pressed("ui_accept")):
			if(can_jump && released && !stage_won && !pause_button):
				animationPlayer.stop(true)
				y_direction = y_direction * (-1);
				if(y_direction == -1):
					animationPlayer.play("flip_up")
				else: animationPlayer.play("flip_down")
				released = false
#--- When you reach the ship. (The player slowly is approaching the ship. When he gets there he stops moving.)
		if stage_won:
			speed_y += GRAVITY * delta
			velocity.x = (MAX_SPEED * delta) / 1.75
			if arived_at_ship:
				movement_remainder = move(Vector2(0,0))
				animationPlayer.stop(true)
			else:
				movement_remainder = move(velocity)
#--- End
		else:
#--- Running Physics
			speed_y += y_direction * (GRAVITY * delta)
			velocity.x = ((SPEED_BONUS * bottle_number) + MAX_SPEED) * delta
			velocity.y = speed_y * delta
			movement_remainder = move(velocity)
#--- End

#--- Camera controls player_stuck variable
			if last_x_pos == get_pos().x:
				player_stuck = true
			else: player_stuck = false
				last_x_pos = get_pos().x
#--- End

#--- Player can jump only if he lands
			if round(last_y_pos) == round(get_pos().y):
				counter += 1
			else: counter = 0
				last_y_pos = get_pos().y
			if counter < 3 : can_jump = false
			else: can_jump = true
#--- End

#--- Y-Axis Borders
		if get_pos().y > min_y || get_pos().y < max_y :
			print("Player out of borders")
			alive = false
#--- End

#--- Friction Handlers
		if is_colliding():
			var normal = get_collision_normal()
			var final_movement = normal.slide(movement_remainder)
			speed_y = normal.slide(Vector2(0, speed_y)).y
			move(final_movement)
#--- End

#--- Play running animation
		if !moving:
			animationPlayer.play("run")
			moving = true
#--- End

## if dead
	else: 
		movement_remainder = move(Vector2(0,0))
		animationPlayer.stop(true)
		if !alive:
			get_node("../Dead").show()
		#if pause button is pressed
		else:
			get_node("../PauseMenu").show()
	
	# Hide pause menu
	if !pause_game: get_node("../PauseMenu").hide()

#--- Horizontal Axis Flip (Functions Called by AnimationPlayer
func mirror_sprite(var b):
	sprite.set_flip_h(b)

func flip_ended():
	moving = false
#--- End
func _on_Timer_timeout():
	timer_pass = true
	pass # replace with function body
