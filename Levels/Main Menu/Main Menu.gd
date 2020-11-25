extends Node

func _ready():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Start_pressed():	
	get_tree().change_scene("res://Levels/Tutorial/Tutorial.tscn")
