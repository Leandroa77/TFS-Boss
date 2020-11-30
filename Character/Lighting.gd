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
	
	
func update(delta):
	#owner.itimer.start()
	speed = 1500
	velocity = self.direction * speed
	velocity.y += gravity * delta
	#screen shake
	#shake(duration, frequency, amplitude)
	owner.get_node("Camera2D").shake(0.02, 100, 2)
	velocity = owner.move_and_slide(velocity)
	#var slide_count = owner.get_slide_count()
	
	# var slide_count = get_slide_count()
	# if slide_count:
	#    var collision = get_slide_collision(slide_count - 1)
	#    var collider = collision.collider
	
	var distance2character = hitted_hook.get_global_position().distance_to(owner.get_global_position());
	if(distance2character<100): 
		owner.itimer.start()
		
	var slide_count = owner.get_slide_count()
	if slide_count:
		var collision = owner.get_slide_collision(slide_count - 1)
		var collider = collision.collider
		if !collider.is_in_group("hook"):
			emit_signal("finished", "impulse")

	lighting.width = 10
	lighting.visible = true
	animated.play("hook")
	

func _on_Timer_timeout():
	lighting.width = 4
	lighting.visible = false
	owner.hitted_hook = false
	lighting.set_default_color(owner.default_aim_color)
	emit_signal("finished", "impulse") #impulse /move
