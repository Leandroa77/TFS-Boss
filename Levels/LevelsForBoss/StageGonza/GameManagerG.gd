extends Node

onready var restart_UI_template = preload("res://UI/Restart_UI/Restart_UI.tscn")
onready var character_template = preload("res://Character/Character.tscn")

func _on_Character_die(cameraDir):
	var restart_UI:Node2D = restart_UI_template.instance()
	restart_UI.global_position = cameraDir
	restart_UI.get_child(3).connect("timeOutRestart", self, "_on_Restart_UI_timeOutRestart")
	get_parent().add_child(restart_UI)

func _on_Restart_UI_timeOutRestart():
	var newCharacter = character_template.instance()
	newCharacter.global_position = get_parent().actualCheckpoint
	newCharacter.connect("die", self,"_on_Character_die")
	newCharacter.connect("sound", get_parent().soundPlayer, "_on_Character_sound")
	get_parent().add_child(newCharacter)
	#get_tree().change_scene("res://Levels/Level_1/Level1.tscn")
