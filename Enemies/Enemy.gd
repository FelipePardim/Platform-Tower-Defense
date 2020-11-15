extends KinematicBody2D

export (int) var detection_range = 200
export (int) var GRAVITY = 2000
export (int) var MOVE_SPEED = -20

#Moving variable
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	add_to_group("Enemies")
	velocity.y += GRAVITY * delta
	velocity.x = MOVE_SPEED # Enemy moving velocity
	velocity = move_and_slide(velocity, Vector2.UP)
