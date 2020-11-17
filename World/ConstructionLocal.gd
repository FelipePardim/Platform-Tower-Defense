extends StaticBody2D

export (PackedScene) var Tower

func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	if area.is_in_group("PlayerConstructionHitBox"):
		var tower = Tower.instance()
		owner.add_child(tower)
		tower.global_position = global_position
		#queue_free()
	
