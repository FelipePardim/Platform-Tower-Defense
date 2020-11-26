extends Node

export(int) var max_health = 1 setget set_max_health
export(int) var max_mana = 0 setget set_max_mana
export(int) var max_coin = 0 setget set_max_coin
var health = max_health setget set_health
var mana = max_mana setget set_mana
var coin = max_coin setget set_coin

signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		
func set_max_mana(value):
	max_mana = value
	self.mana = min(mana, max_mana)
	emit_signal("max_mana_changed", max_mana)

func set_mana(value):
	mana = value
	emit_signal("mana_changed", mana)
	if mana <= 0:
		emit_signal("no_mana")
	
func set_max_coin(value):
	max_coin = value
	self.coin = min(coin, max_coin)
	emit_signal("max_coin_changed", max_coin)

func set_coin(value):
	coin = value
	emit_signal("coin_changed", coin)
	if coin <= 0:
		emit_signal("no_coin")

func _ready():
	self.health = max_health
	self.mana = max_mana
	self.coin = max_coin
