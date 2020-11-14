extends KinematicBody2D

# Physics constants
const ACCELERATION = 10
const MAX_SPEED = 10
const FRICTION = 10

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
			pass
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
	pass

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
