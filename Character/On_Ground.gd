extends "res://Character/Motion.gd"

var speed = 0.0
var velocity = Vector2()
var jump_was_pressed = false
var coyote_jump = false

func active_coyote_time():
	if owner.is_on_floor():
		coyote_jump = true
	elif !owner.is_on_floor() && coyote_jump == true:
		coyote_time()
		
func handle_input(event):
	if event.is_action_pressed("jump"):
		if coyote_jump == true:
			emit_signal("finished", "jump")
	return .handle_input(event)

func coyote_time():
	yield(get_tree().create_timer(0.075),"timeout")
	coyote_jump = false

