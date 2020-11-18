extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	#get_tree().change_scene("res://Levels/Level_1/Level1.tscn")
	get_tree().change_scene("res://Levels/LevelsForBoss/Stage 1/Stage1.tscn")
