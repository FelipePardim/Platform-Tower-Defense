extends StaticBody2D

onready var castleStats = $Stats

func _ready():
	add_to_group("Towers")

func _on_HurtBox_area_entered(area):
	if area.is_in_group("EnemyHitBox"):
		castleStats.health -= area.damage
		if castleStats.health <= 0:
			queue_free()
			# Game over sequence
			# play demolition animation and sound
		else:
			pass
			# play hit animation and sound
