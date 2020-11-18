extends Node

func _ready():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Start_pressed():
	MusicController.play_music()
	
	get_tree().change_scene("res://Levels/LevelsForBoss/Stage 1/Stage1.tscn")
