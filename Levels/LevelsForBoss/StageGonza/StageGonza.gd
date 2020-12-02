extends Node

signal playBackgroundMusic(value)

onready var wall_template = preload("res://objects/ParedMadera/ParedMadera.tscn")
onready var character_template = preload("res://Character/Character.tscn")
onready var restart_UI_template = preload("res://UI/Restart_UI/Restart_UI.tscn")
onready var pause_template = preload("res://Pause/Pause.tscn")

onready var player_spawn_position = $SpawnPosition
onready var enemies = $Enemies
onready var character = $Character
onready var soundPlayer = $SoundPlayer
onready var walls = $Paredes
onready var wallsPositions = [Vector2(-2180.46, -284.927), Vector2(-2179.27, 67.078), Vector2(-3300.04, 1986.87)]
onready var enemy_template = preload("res://Enemies/enemy ground/Enemy.tscn")
var ya_se_llamo_restart_ui = false
var all_enemies_pos: Array 

func _ready():
	emit_signal("playBackgroundMusic", 3)
	
	get_all_enemies_positions()
	spawn_player()
	set_target_all_enemies()

func respawnWalls():
	var index = 1
	for wall in walls.get_children():
		wall.queue_free()
	for pos in wallsPositions:
		var newWall = wall_template.instance()
		newWall.global_position = pos
		var st = "_on_ParedMadera" + str(index) + "_detonate"
		index += 1
		newWall.connect("detonate", soundPlayer, st);
		walls.add_child(newWall)

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
		
		destroy_all_enemies()
		respawnWalls()
		var pause = pause_template.instance()
		var new_player:Character = character_template.instance()
		
		new_player.global_position = player_spawn_position.global_position
		new_player.connect("die", self,"_on_Character_die")
		new_player.connect("sound", soundPlayer,"_on_Character_sound")
		new_player.add_child(pause)
		character = new_player
		add_child(new_player)

		reset_enemies()
		for enemy in enemies.get_children():
			enemy.set_target(new_player)
			#enemy.connect("sound_missile", soundPlayer,"_on_EnemyFloor_sound_missile")
		ya_se_llamo_restart_ui = true

func _on_Checkpoint2_setCheckpoint(value):
	player_spawn_position.global_position = value

func _on_Checkpoint3_setCheckpoint(value):
	player_spawn_position.global_position = value

func _on_Checkpoint4_setCheckpoint(value):
	player_spawn_position.global_position = value
	

func get_all_enemies_positions():
	for enemy in get_tree().get_nodes_in_group("enemyfloor"):
		all_enemies_pos.append(enemy.global_position)
		

func destroy_all_enemies():
	for enemy in get_tree().get_nodes_in_group("enemyfloor"):
		enemy.queue_free()
		

func reset_enemies():
	for enemy_pos in all_enemies_pos:
		var new_enemy = enemy_template.instance()
		new_enemy.global_position = enemy_pos 
		new_enemy.set_target(character)
		call_deferred("add_child", new_enemy)
	pass
	
func set_target_all_enemies():
	for enemy in get_tree().get_nodes_in_group("enemyfloor"):
		enemy.set_target(character)
	
