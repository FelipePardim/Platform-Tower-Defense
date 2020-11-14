extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export (PackedScene) var Projectile

func shoot():
	var b = Projectile.instance()
	owner.add_child(b)
	b.transform = $FirePosition.global_transform

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_home"):
		shoot()
