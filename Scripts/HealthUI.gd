extends Control

var hearts = 10 setget set_hearts
var max_hearts = 10 setget set_max_hearts

onready var heartFull = $HeartFull
onready var heartEmpty = $HeartEmpty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartFull != null:
		heartFull.rect_size.x = hearts * 2 #Hearts sprite size

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartEmpty != null:
		heartEmpty.rect_size.x = max_hearts * 15 #Hearts sprite size
	
func _ready():
	pass
	
