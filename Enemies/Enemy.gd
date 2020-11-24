extends KinematicBody2D

#export (int) var enemyDamage = 1
export (int) var GRAVITY = 2000
export (int) var MOVE_SPEED = -20

#Moving variable
var velocity = Vector2.ZERO
#Enemy stats
onready var enemyStats = $Stats
onready var timer = $Timer
onready var hitbox = $HitBox/HitBoxShape

func _ready():
	add_to_group("Enemies")

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = MOVE_SPEED # Enemy moving velocity
	velocity = move_and_slide(velocity, Vector2.UP)
			
			
func _on_HurtBox_area_entered(area):
	if area.is_in_group("Projectiles"):
		if enemyStats.health > 0:
			enemyStats.health -= area.damage
		else:
			queue_free()


func _on_Timer_timeout():
	hitbox.disabled = !hitbox.disabled
	timer.start(1)
