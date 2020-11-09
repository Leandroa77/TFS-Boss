extends "res://Character/On_Ground.gd"

export(float) var gravity = 800.0
var animated

func enter():
	animated = get_parent().get_parent().get_node("BodyPivot/AnimatedSprite")

func handle_input(event):
	return .handle_input(event)

func update(_delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
	velocity.y += gravity * _delta
	#parche para evitar que caiga rapido
	velocity.y = min(500.0, velocity.y * gravity * _delta)
	
	var snap = Vector2.DOWN * 32
	velocity = owner.move_and_slide_with_snap(velocity, snap, Vector2.UP, false)
	
	active_coyote_time()
	animated.play("idle")

func isOnFloor():
	return owner.is_on_floor()
