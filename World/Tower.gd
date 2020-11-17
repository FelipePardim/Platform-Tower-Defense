extends StaticBody2D

export (PackedScene) var Bullet
onready var firePosition = $FirePosition
onready var timer = $Timer
onready var animationPlayer = $AnimationPlayer

var enemies = []

func shoot():
	animationPlayer.play("Fire")
	var b = Bullet.instance()
	self.add_child(b)
	b.transform = $FirePosition.transform

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_home"):
		shoot()
		
	if enemies:
		var target = enemies.pop_front()
		var angle = get_angle_to(target.global_position)
		#firePosition.rotation_degrees = ( - angle)
		shoot()
	
func _on_Range_body_entered(body):
	if body.is_in_group("Enemies"):
		enemies.append(body.get_parent())

func _on_Range_body_exited(body):
	if body.is_in_group("Enemies"):
		enemies.erase(body.get_parent())
