extends Node

onready var player_spawn_position : Position2D = $PlayerRespawn
onready var enemies = $Enemies
onready var character = $Character
onready var soundPlayer = $SoundPlayer

onready var restart_UI_template = preload("res://UI/Restart_UI/Restart_UI.tscn")
onready var character_template = preload("res://Character/Character.tscn")

signal playBackgroundMusic(value)

var players = 0
var ya_se_llamo_restart_ui = false

#var actualCheckpoint = Vector2(-7570.123, 4139.863)

func _on_Character_die(cameraDir):
	var restart_UI:Node2D = restart_UI_template.instance()
	restart_UI.global_position = cameraDir
	restart_UI.get_child(3).connect("timeOutRestart", self, "_on_Restart_UI_timeOutRestart")
	get_parent().add_child(restart_UI)
	ya_se_llamo_restart_ui = false

func _on_Restart_UI_timeOutRestart():
	respawn_player()

func spawn_player():
	character.global_position = player_spawn_position.global_position

func respawn_player():
	if !ya_se_llamo_restart_ui:
		var new_player:Character = character_template.instance()
		
		new_player.global_position = player_spawn_position.global_position
		new_player.connect("die", self,"_on_Character_die")
		new_player.connect("sound", soundPlayer,"_on_Character_sound")
		add_child(new_player)
		if is_instance_valid($EnemyFloor):
			$EnemyFloor.set_target(new_player)
			$EnemyFloor.connect("sound_missile", soundPlayer,"_on_EnemyFloor_sound_missile")
		ya_se_llamo_restart_ui = true

func set_ya_se_llamo_restart_ui(boolean):
	ya_se_llamo_restart_ui = boolean

func _ready():
	emit_signal("playBackgroundMusic", 1)
	spawn_player()
	for enemy in enemies.get_children():
		enemy.target = character

func _on_Checkpoint2_setCheckpoint(value):
	player_spawn_position.global_position = value

func _on_Checkpoint3_setCheckpoint(value):
	player_spawn_position.global_position = value

func _on_Checkpoint4_setCheckpoint(value):
	player_spawn_position.global_position = value
