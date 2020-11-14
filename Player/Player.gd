extends KinematicBody2D

# Physics constants
const ACCELERATION = 10
const MAX_SPEED = 10
const FRICTION = 10

var speed: = Vector2(300.0, 1000.0)
var gravity: = 3000.0
var velocity: = Vector2.ZERO

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
		var direction: = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0.0
		)

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
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") -
		 Input.get_action_strength("move_left"), 
		-1.0 if Input. is_action_just_pressed("jump") and is_on_floor() else 1.0
		)
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2
) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	return speed * direction
