extends Node

onready var enemies = $Enemies
onready var character = $Character
onready var soundPlayer = $SoundPlayer
signal playBackgroundMusic(value)

var players = 0

var actualCheckpoint = Vector2(-7570.123, 4139.863)

func _ready():
	emit_signal("playBackgroundMusic", 1)
	for enemy in enemies.get_children():
		enemy.target = character

func _process(delta):
	var cantidadDuplicados = get_tree().get_nodes_in_group("player").size()
	print(cantidadDuplicados)
	if(cantidadDuplicados > 1):
		while(cantidadDuplicados != 1):
			get_tree().get_nodes_in_group("player")[0].queue_free()
			cantidadDuplicados -= 1

func _on_Checkpoint2_setCheckpoint(value):
	actualCheckpoint = value

func _on_Checkpoint3_setCheckpoint(value):
	actualCheckpoint = value

func _on_Checkpoint4_setCheckpoint(value):
	actualCheckpoint = value
