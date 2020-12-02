extends Node

func _input(event):
	if event.is_action_pressed("level1"):
		get_tree().change_scene("res://Levels/LevelsForBoss/Stage 1/Stage1.tscn")
	if event.is_action_pressed("level2"):
		get_tree().change_scene("res://Levels/LevelsForBoss/Stage 2/Stage2.tscn")
	if event.is_action_pressed("level3"):
		get_tree().change_scene("res://Levels/LevelsForBoss/StageGonza/StageGonza.tscn")
	if event.is_action_pressed("level4"):
		get_tree().change_scene("res://Levels/LevelsForBoss/Stage mov hook/StageMovHookSimple.tscn")
	if event.is_action_pressed("level5"):
		get_tree().change_scene("res://Levels/LevelsForBoss/Stage Acido/Stage4.tscn")
