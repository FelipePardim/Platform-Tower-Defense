extends StaticBody2D

export var spawnCoolDown = 3
export (PackedScene) var Enemy
export (PackedScene) var Vulture
export (PackedScene) var Hyena
export (PackedScene) var Snake
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
			var randValue = rand_range(0, 10)
			if randValue < 3:
				var b = Hyena.instance()
				owner.add_child(b)
				b.transform = $SpawnPoint.global_transform
			elif randValue < 7:
				var b = Snake.instance()
				owner.add_child(b)
				b.transform = $SpawnPoint.global_transform
			else:
				var b = Vulture.instance()
				owner.add_child(b)
				b.transform = $SpawnPoint.global_transform
			#var b = Enemy.instance()
			
			timer.start()
