extends KinematicBody2D

# Physics variables (constants)
export (int) var SPEED = 200
export (int) var JUMP_SPEED = -500
export (int) var GRAVITY = 2000

#Moving variable
var velocity = Vector2.ZERO

# Defining the initial player state
var state = MOVE

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Player states
enum {
	MOVE,
	BUILD,
	IDLE,
	DEAD
}

# Function to handle the physics
func _physics_process(delta):
	get_input()
	match state:
		MOVE:
			move_state(delta)
		BUILD:
			build_state(delta)
		IDLE:
			idle_state(delta)
		DEAD:
			pass

# Side move mechanic
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationTree.set("parameters/Death/blend_position", input_vector)
		animationTree.set("parameters/Jump/blend_position", input_vector)
		animationTree.set("parameters/Build/blend_position", input_vector)
		animationState.travel("Walk")
		
		velocity.y += GRAVITY * delta
		print(input_vector)
		velocity = move_and_slide(velocity, Vector2.UP)
	else:
		animationState.travel("Idle")
		velocity.y += GRAVITY * delta
		velocity = move_and_slide(velocity, Vector2.UP)

# Build mechanic
func build_state(delta):
	velocity = Vector2.ZERO
	print("BUILDING")
	animationState.travel("Build")
	# Building animation has finished
	# to pass to the move state
	#state = MOVE

# Run (sprint) mechanic
func idle_state(delta):
	#animationState.travel("Idle")
	velocity.y += GRAVITY * delta
	animationPlayer.play("idle left")

# DEAD mechanic
func dead_state(delta):
	pass
	
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
		state = MOVE
		animationPlayer.play("walk right")
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		state = MOVE
		animationPlayer.play("walk left")
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_SPEED
			animationPlayer.play("jump right")
	if Input.is_action_pressed("ui_accept"):
		if is_on_floor():
			state = BUILD
			animationPlayer.play("build right")
	else:
		state = IDLE

func move():
	velocity = move_and_slide(velocity)
