extends StaticBody2D

export var spawnCoolDown = 3
export (PackedScene) var Enemy
# Game root scene
onready var game = get_tree().get_root().get_node("Game")
onready var spawnpoint = $SpawnPoint
onready var timer = $Timer

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	# Day and night cycle verification
	if game.enemySpawn == true:
		if timer.time_left <= 0:
			timer.set_wait_time(spawnCoolDown)
			var b = Enemy.instance()
			owner.add_child(b)
			b.transform = $SpawnPoint.global_transform
			timer.start()
