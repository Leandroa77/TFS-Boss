extends Node

onready var title = $Title
onready var startText = $Start2
onready var exitText = $Exit2
onready var titlePos = $Position2DTitle
onready var startPos = $Position2DStart
onready var exitPos = $Position2DExit
onready var startTimer : Timer = $StartTimer

func _ready():
	OS.window_fullscreen = !OS.window_fullscreen
	Input.action_press("move_right")

func _on_Start_pressed():
	Input.action_press("move_right")
	startTimer.start()

func _on_MoveToScreen_timeout():
	Input.action_release("move_right")

func _on_Exit3_pressed():
	#get_tree().quit()
	pass

func _on_UpTitle_timeout():
	title.get_child(0).interpolate_property(title, "rect_position", title.get_rect().position, titlePos.global_position, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	title.get_child(0).start()

func _on_UpStart_timeout():
	startText.get_child(0).interpolate_property(startText, "rect_position", startText.get_rect().position, startPos.global_position, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	startText.get_child(0).start()

func _on_UpExit_timeout():
	exitText.get_child(0).interpolate_property(exitText, "rect_position", exitText.get_rect().position, exitPos.global_position, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	exitText.get_child(0).start()

func _on_StartTimer_timeout():
	Input.action_release("move_right")
	get_tree().change_scene("res://Levels/Tutorial/Tutorial.tscn")
