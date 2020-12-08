extends StaticBody2D

onready var castleStats = $Stats
const demolitionSound = preload("res://Music & Sound/CastleDemolition.tscn")

func _ready():
	add_to_group("Towers")

func _on_HurtBox_area_entered(area):
	if area.is_in_group("EnemyHitBox"):
		castleStats.health -= area.damage
		if castleStats.health <= 0:
			# Game over sequence
			var castleDemolition = demolitionSound.instance()
			get_parent().add_child(castleDemolition)
			queue_free()
			# play demolition animation and sound
		else:
			pass
			# play hit animation and sound
