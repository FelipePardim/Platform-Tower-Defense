extends Node2D

onready var animationPlayer = $AnimationPlayer
# Game root scene
onready var game = get_tree().get_root().get_node("Game")
# Player node
onready var player = game.get_node("Player")
# Castle node
onready var castle = game.get_node("Castle")

func _ready():
	animationPlayer.play("Day cycle")

func change_enemy_spawn():
	game.enemySpawn = !game.enemySpawn
	
func pay_income():
	# Function to give player the money he can earn
	# everyday on 6:00 after the enemy wave
	player.playerStats.coin += ( game.income * castle.castleStats.level )
	print(player.playerStats.coin)
