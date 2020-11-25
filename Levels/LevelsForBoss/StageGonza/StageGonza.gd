extends Node

onready var enemies = $Enemies
onready var character = $Character
onready var soundPlayer = $SoundPlayer
signal playBackgroundMusic(value)

var actualCheckpoint = Vector2(-7570.123, 4139.863)

func _ready():
	emit_signal("playBackgroundMusic", 1)
	for enemy in enemies.get_children():
		enemy.target = character
