extends "res://Character/Motion.gd"

signal saliDeAcaLoco()

var speed:float = 1500.0
var velocity:Vector2
var direction:Vector2
onready var lighting: Line2D = get_parent().get_parent().get_node("Line2DLighting")

export(float) var base_max_horizontal_speed = 400.0

var coll:CollisionShape2D
export(float) var air_acceleration = 1000.0
export(float) var air_deceleration = 2000.0
export(float) var air_steering_power = 50.0

export(float) var gravity = 1600.0

var enter_velocity = Vector2()

var max_horizontal_speed = 0.0
var horizontal_speed = 0.0
var horizontal_velocity = Vector2()

var vertical_speed = 0.0
var height = 0.0

var hookPosition:Vector2
var hitted_hook
var animated
var target
var left_shot


func initialize(direction, speed, velocity, hook):
	self.direction = direction
	horizontal_speed = speed
	max_horizontal_speed = speed if speed > 0.0 else base_max_horizontal_speed
	hookPosition = hook.get_global_position()
	hitted_hook = hook
	
	
func exit():
	pass

func handle_input(_event):
	pass

func enter():
	horizontal_velocity = enter_velocity
	vertical_speed = 800.0
	animated = get_parent().get_parent().get_node("BodyPivot/AnimatedSprite3")

func _input(event):
	if event is InputEventMouseButton:
		target = event.global_position
	
func update(delta):
	#owner.itimer.start()
	speed = 1400#1500
	velocity = self.direction * speed
	velocity.y += gravity * delta
	
	
	
	var distance2character = hitted_hook.get_global_position().distance_to(owner.get_global_position());
	if(distance2character<100): 
		owner.itimer.start()
		
	left_shot = get_viewport().size.x / 2 < target.x
	if left_shot:
		animated.flip_h = false
		animated.play("hook")
	else:
		animated.flip_h = true
		animated.play("hook")



	#screen shake
	#shake(duration, frequency, amplitude)
	owner.get_node("Camera2D").shake(0.02, 100, 2)
	var collider_data = owner.move_and_collide(velocity * delta)
	lighting.width = 10
	lighting.visible = true
	if collider_data:
		if !collider_data.collider.is_in_group("hook"):
			lighting.width = 4
			lighting.visible = false
			owner.hitted_hook = false
			lighting.set_default_color(owner.default_aim_color)
			emit_signal("finished", "impulse")

	
	

func _on_Timer_timeout():
	lighting.width = 4
	lighting.visible = false
	owner.hitted_hook = false
	lighting.set_default_color(owner.default_aim_color)
	emit_signal("finished", "impulse") #impulse /move
