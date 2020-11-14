extends KinematicBody2D

export (int) var speed = 150
export (int) var jump_speed = -500
export (int) var gravity = 2000

onready var animationTree = $AnimationTree
onready var animationPlayer = $AnimationPlayer
onready var animationState = animationTree.get("parameters/playback")

var velocity = Vector2.ZERO
var direction = Vector2.RIGHT

export (float, 0, 1.0) var friction = 1.0
export (float, 0, 1.0) var acceleration = 0.3

func _ready():
	animationTree.active = true

func get_input():
	animationTree.set("parameters/Walk/blend_position", direction)
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
		animationState.travel("Walk")
	if Input.is_action_pressed("ui_left"):
		dir -= 1
		animationState.travel("Walk")
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			jump_state()
	if dir != 0:
		# Function to move the player
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		animationState.travel("Idle")

func _physics_process(delta):
	get_input()
	# Gravity pushing the player
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	direction = velocity
	
func jump_animation_has_finished():
	pass

func jump_state():
	animationState.travel("Jump")
	velocity.y = jump_speed
	velocity.x = 0
