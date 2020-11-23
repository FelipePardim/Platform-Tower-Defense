extends Area2D

export var speed = 12
export var damage = 500

func _ready():
	add_to_group("Projectiles")

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Projectile_body_entered(body):
	# Hitting the enemy and destroy the
	# projectile instance
	queue_free()

