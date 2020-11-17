extends StaticBody2D

export (PackedScene) var Bullet
onready var firePosition = $FirePosition
onready var timer = $Timer
onready var animationPlayer = $AnimationPlayer

enum {
	SHOOTING
	IDLE
}

var enemies = []
var state = IDLE

func shoot():
	var b = Bullet.instance()
	#var target = enemies[0]
	self.add_child(b)
	b.transform = $FirePosition.transform
	#b.position.move_toward(enemies[0].position, 8)
	#b.position = lerp($FirePosition.position, target.position, 10)

func _physics_process(delta):
	firePosition.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_home"):
		state = SHOOTING
		shoot()
		
	if state == SHOOTING:
		animationPlayer.play("Fire")
	elif state == IDLE:
		animationPlayer.play("Idle")
	
func _on_Range_body_entered(body):
	if body.is_in_group("Enemies"):
		enemies.append(body.get_parent())
		shoot()

func _on_Range_body_exited(body):
	if body.is_in_group("Enemies"):
		enemies.erase(body.get_parent())
		
func fire_animation_finished():
	state = IDLE
