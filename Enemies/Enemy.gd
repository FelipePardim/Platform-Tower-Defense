extends KinematicBody2D

export var detection_range = 200
export (int) var GRAVITY = 2000

#Moving variable
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x -= 1
	velocity = move_and_slide(velocity, Vector2.UP)	
