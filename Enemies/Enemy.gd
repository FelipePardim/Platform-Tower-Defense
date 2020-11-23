extends KinematicBody2D

export (int) var detection_range = 200
export (int) var GRAVITY = 2000
export (int) var MOVE_SPEED = -20

#Moving variable
var velocity = Vector2.ZERO
#Enemy stats
onready var enemyStats = $Stats

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	add_to_group("Enemies")
	velocity.y += GRAVITY * delta
	velocity.x = MOVE_SPEED # Enemy moving velocity
	velocity = move_and_slide(velocity, Vector2.UP)
			
			
func _on_HurtBox_area_entered(area):
	if area.is_in_group("Projectiles"):
		if enemyStats.health > 0:
			enemyStats.health -= area.damage
		else:
			queue_free()
