extends Node

onready var enemy = $EnemyFloor
onready var character = $Character

func _ready():
	enemy.target = character
