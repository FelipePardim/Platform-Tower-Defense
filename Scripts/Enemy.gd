extends KinematicBody2D

export (int) var GRAVITY = 2000
export (int) var MOVE_SPEED = -20

# Enemy coin give to player when enemy dies
export (int) var enemyBounty = 2

#Moving variable
var velocity = Vector2.ZERO
#Enemy stats
onready var enemyStats = $Stats
onready var timer = $Timer
onready var hitbox = $HitBox/HitBoxShape
onready var animatedSprite = $AnimatedSprite
# Game root scene
onready var game = get_tree().get_root().get_node("Game")
# Player node
onready var player = game.get_node("Player")

func _ready():
	animatedSprite.play("default")

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = MOVE_SPEED # Enemy moving velocity
	velocity = move_and_slide(velocity, Vector2.UP)
			
			
func _on_HurtBox_area_entered(area):
	if area.is_in_group("Projectiles"):
		if area.is_in_group("Ice"):
			if MOVE_SPEED >= -10:
				MOVE_SPEED = -10
			else:
				MOVE_SPEED += 10
			enemyStats.health -= area.damage
		if enemyStats.health > 0:
			enemyStats.health -= area.damage
		if enemyStats.health <= 0:
			player.playerStats.coin += enemyBounty
			queue_free()


func _on_Timer_timeout():
	hitbox.disabled = !hitbox.disabled
	timer.start(1)
