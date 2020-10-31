extends "res://Character/Motion.gd"

var speed = 0.0
var velocity = Vector2()

func isOnFloor():
	pass

func handle_input(event):
	if event.is_action_pressed("jump") and isOnFloor():
		emit_signal("finished", "jump")
	return .handle_input(event)

