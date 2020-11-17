extends "res://Character/On_Ground.gd"

export(float) var max_walk_speed = 450
export(float) var max_run_speed = 700
var gravity = 20000.0 #3000.0
var coll:CollisionShape2D
var animated

func enter():
	speed = 0.0
	velocity = Vector2()
	animated = get_parent().get_parent().get_node("BodyPivot/AnimatedSprite3")
	var input_direction = get_input_direction()

func handle_input(event):
	return .handle_input(event)

func update(_delta):
	var input_direction = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")

	speed = max_walk_speed

	velocity = input_direction * speed
	velocity.y += gravity * _delta

	velocity = owner.move_and_slide(velocity, Vector2(0, -1), 5, 2)
	if(owner.is_on_floor()): 
		owner.clear_hits()
	active_coyote_time()
	
	if input_direction.x > 0:
		animated.play("walk")
		animated.flip_h = false
	if input_direction.x < 0:
		animated.flip_h = true
		animated.play("walk")



