extends KinematicBody2D

# Physics variables (constants)
export (int) var SPEED = 200
export (int) var JUMP_SPEED = -500
export (int) var GRAVITY = 2000

#Moving variable
var velocity = Vector2.ZERO

# Defining the initial player state
var state = MOVE

# Player states
enum {
	MOVE,
	BUILD,
	RUN,
	DEAD
}

# Function to handle the physics
func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		BUILD:
			build_state(delta)
		RUN:
			pass
		DEAD:
			pass
	get_input()

# Side move mechanic
func move_state(delta):
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)

# Build mechanic
func build_state(delta):
	velocity = Vector2.ZERO
	print("BUILDING")
	# Building animation has finished
	# to pass to the move state
	state = MOVE

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
		state = MOVE
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		state = MOVE
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_SPEED
	if Input.is_action_pressed("ui_accept"):
		if is_on_floor():
			state = BUILD
