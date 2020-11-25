extends Node

onready var enemies = $Enemies
onready var character = $Character
signal playBackgroundMusic(value)

func _ready():
	emit_signal("playBackgroundMusic", 1)
	for enemy in enemies.get_children():
		enemy.target = character
