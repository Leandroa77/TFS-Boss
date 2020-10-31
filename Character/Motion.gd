extends "res://Character/State.gd"

#func handle_input(event):
	#no estariamos necesitando esto de momento :p
#	if event.is_action_pressed("simulate_damage"):
#		emit_signal("finished", "stagger")
	
func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	return input_direction
