extends StaticBody2D

export (PackedScene) var bowTower

func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	if area.is_in_group("PlayerConstructionHitBox"):
		var tower = bowTower.instance()
		owner.add_child(tower)
		tower.global_position = $Position2D.global_position
		queue_free()
	
