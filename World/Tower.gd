extends StaticBody2D

export (PackedScene) var Bullet
onready var firePosition = $FirePosition
onready var timer = $Timer
onready var animationPlayer = $AnimationPlayer
onready var towerStats = $Stats
onready var MAX_RANGE = 280 # Max tower range

enum {
	SHOOTING
	IDLE
}

var enemies = []
var state = IDLE

func _ready():
	towerStats.health = 10

func shoot():
	if enemies.size() != 0:
		var b = Bullet.instance()
		b.position = firePosition.position
		var targets = enemies
		var closest_target
		var closest_target_distance = 999
		# Prioritazing target by distance
		for i in range(0, targets.size()):
			if targets[i] != null:
				var target_distance = b.get_global_position().distance_to(targets[i].get_global_position())
				if target_distance < closest_target_distance and target_distance < MAX_RANGE:
					closest_target = targets[i]
					closest_target_distance = target_distance
		# Shooting mechanic and animation
		if closest_target != null and enemies.size() >= 2:
			self.add_child(b)
			state = SHOOTING
			# Getting the angle to the closest target and shooting
			b.rotation = b.get_angle_to(closest_target.position)

func _physics_process(_delta):
	# Aiming with mouse
	#firePosition.look_at(get_global_mouse_position())
		
	if state == SHOOTING:
		animationPlayer.play("Fire")
	elif state == IDLE:
		animationPlayer.play("Idle")
	
func _on_Range_body_entered(body):
	if body.is_in_group("Enemies"):
		enemies.append(body)

func _on_Range_body_exited(body):
	if body.is_in_group("Enemies"):
		enemies.erase(body.get_parent())
		
func fire_animation_finished():
	state = IDLE


func _on_Timer_timeout():
	shoot()
	timer.start(1)
