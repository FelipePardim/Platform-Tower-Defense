extends StaticBody2D

export (PackedScene) var Enemy

onready var spawnpoint = $SpawnPoint
onready var timer = $Timer

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	# Day and night cycle verification
	if timer.time_left <= 0:
		timer.set_wait_time(3)
		print("Spawn Enemy")
		timer.start()
