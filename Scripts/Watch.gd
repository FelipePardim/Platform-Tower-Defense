extends Node2D

onready var animationPlayer = $AnimationPlayer
# Game root scene
onready var game = get_tree().get_root().get_node("Game")

func _ready():
	animationPlayer.play("Day cycle")

func change_enemy_spawn():
	game.enemySpawn = !game.enemySpawn
