extends "res://Character/Motion.gd"

export(float) var base_max_horizontal_speed = 400.0

var coll:CollisionShape2D
export(float) var air_acceleration = 1000.0
export(float) var air_deceleration = 2000.0
export(float) var air_steering_power = 50.0

export(float) var gravity = 1400.0

var enter_velocity = Vector2()

var max_horizontal_speed = 0.0
var horizontal_speed = 0.0
var horizontal_velocity = Vector2()

var vertical_speed = 0.0
var height = 0.0

var velocity:Vector2

var animated
var initial_dir  
var hook_position
var velocity_impulse
var can_move: bool = false  #true
var initial_vertical_speed:float 
var can_impulse = true
var was_moved = false

func initialize(speed, velocity, hook_position):
	horizontal_speed = speed.x
	max_horizontal_speed = speed.x if speed.x > 0.0 else base_max_horizontal_speed
	enter_velocity = velocity
	initial_dir = speed
	self.hook_position = hook_position 
	velocity_impulse = velocity
	if (hook_position.y > owner.get_global_position().y):
		vertical_speed = 100.0 #/  600.0 / que tan fuerte es el impulso post rayo
	else:
		vertical_speed = -100.0 # -40000 
	
	can_move = false  #true
	
	$TimerNoInput.start()
		
func enter():
	var input_direction = get_input_direction()

	horizontal_velocity = enter_velocity if input_direction else Vector2()
	can_impulse = true
	was_moved = false
	animated = get_parent().get_parent().get_node("BodyPivot/AnimatedSprite3")

func update(delta):
	owner.move_and_slide(Vector2.DOWN, Vector2(0, -1))
	if (owner.is_on_floor()):
		emit_signal("finished", "move")
	var input_direction = get_input_direction()
	var is_moved = get_input_direction().x < 0 or get_input_direction().x > 0 

	if can_move and (is_moved or was_moved):	
		var speed = 300
		velocity = get_input_direction() * speed
		velocity.y -= gravity * delta

	
		owner.move_and_slide(velocity, Vector2(0, -1), 5, 2)
		jump_height(delta)
		can_impulse =false
		was_moved = true
	if can_impulse:
		impulse(delta)

	animated.play("on_air")
	owner.move_and_slide(Vector2.DOWN, Vector2(0, -1))
	if (owner.is_on_floor()):
		print("esta en floor")
		emit_signal("finished", "move")

func move_horizontally(delta, direction):
	if direction:
		horizontal_speed += air_acceleration * delta
	else:
		horizontal_speed -= air_deceleration * delta
	horizontal_speed = clamp(horizontal_speed, 0, max_horizontal_speed)

	var target_velocity = horizontal_speed * direction.normalized()
	var steering_velocity = (target_velocity - horizontal_velocity).normalized() * air_steering_power
	horizontal_velocity += steering_velocity
	owner.move_and_slide(horizontal_velocity)

func impulse(delta):
	
	vertical_speed -= gravity * delta
	var min_right = abs(initial_dir.x * 200)
	var min_left = - abs(initial_dir.x * 200)
	if (hook_position.x < owner.get_global_position().x ): 
		velocity_impulse = Vector2(max(min_right,(velocity_impulse.x + abs(initial_dir.x))  * 0.9 ), min(500, vertical_speed * -1)) #min(500, vertical_speed * -1))
	else:
		velocity_impulse = Vector2(min(min_left,(velocity_impulse.x - abs(initial_dir.x))  * 0.9) , min(500, vertical_speed * -1))
	owner.move_and_slide(velocity_impulse)
	
func jump_height(delta):
	vertical_speed -= gravity * delta
	velocity = Vector2(0, min(500, vertical_speed * -1))
	owner.move_and_slide(velocity, Vector2(0, -1))
	



func _on_TimerNoInput_timeout():
	can_move = true
	pass 
