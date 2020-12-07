extends Area2D

export var speed = 900
export var damage = 200

func _ready():
	add_to_group("Projectiles")

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Projectile_body_entered(body):
	# Hitting the enemy and destroy the
	# projectile instance
	queue_free()

