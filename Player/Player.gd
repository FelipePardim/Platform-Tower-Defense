extends KinematicBody2D

# Physics variables (constants)
export (int) var SPEED = 200
export (int) var JUMP_SPEED = -800
export (int) var GRAVITY = 2000

#Moving variable
var velocity = Vector2.ZERO

# Defining the initial player state
var state = MOVE

# Player states
enum {
	MOVE,
	JUMP,
	BUILD,
	RUN,
	DEAD
}

# Function to handle the physics
func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		JUMP:
			pass
		BUILD:
			pass
		RUN:
			pass
		DEAD:
			pass

# Side move mechanic
func move_state(delta):
	get_input()
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_SPEED

# Jump mechanic
func jump_state(delta):
	pass

# Build mechanic
func build_state(delta):
	pass

# Run (sprint) mechanic
func run_state(delta):
	pass

# DEAD mechanic
func dead_state(delta):
	pass
	
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
