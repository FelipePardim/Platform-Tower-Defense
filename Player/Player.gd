extends KinematicBody2D

enum {
	MOVE
	BUILD
}

export (int) var speed = 150
export (int) var jump_speed = -500
export (int) var gravity = 2000

onready var animationTree = $AnimationTree
onready var animationPlayer = $AnimationPlayer
onready var animationState = animationTree.get("parameters/playback")
onready var constructionBox = $ConstructionHitbox

var velocity = Vector2.ZERO
var direction = Vector2.RIGHT
var state = MOVE

export (float, 0, 1.0) var friction = 0.3
export (float, 0, 1.0) var acceleration = 0.3

func _ready():
	animationTree.active = true

func get_input():
	var input_vector = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if input_vector != 0:
		# Function to move the player
		animationTree.set("parameters/Walk/blend_position", direction)
		animationState.travel("Walk")
		velocity.x = lerp(velocity.x, input_vector * speed, acceleration)
		if input_vector == 1:
			direction = Vector2.RIGHT
			constructionBox.set_scale(Vector2.RIGHT)
		else:
			direction = Vector2.LEFT
			constructionBox.set_scale(Vector2.LEFT)
	else:
		# Function to leave the player in idle
		animationTree.set("parameters/Idle/blend_position", direction)
		velocity.x = lerp(velocity.x, 0, friction)
		animationState.travel("Idle")
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			# Function to player jump
			animationTree.set("parameters/Jump/blend_position", direction)
			velocity.y = jump_speed
			animationState.travel("Jump")
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			state = BUILD

func _physics_process(delta):
	match state:
		BUILD:
		 build()
		MOVE:
			get_input()
			# Gravity pushing the player
			velocity.y += gravity * delta
			velocity = move_and_slide(velocity, Vector2.UP)
			
func build():
	velocity = Vector2.ZERO
	animationTree.set("parameters/Build/blend_position", direction)
	velocity.x = lerp(velocity.x, 0, friction)
	animationState.travel("Build")

func build_animation_finished():
	state = MOVE
