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


func initialize(direction, speed, velocity, hookPosition):
	self.direction = direction
	horizontal_speed = speed
	max_horizontal_speed = speed if speed > 0.0 else base_max_horizontal_speed
	self.hookPosition = hookPosition
	
func exit():
	pass

func handle_input(_event):
	pass

func enter():
	horizontal_velocity = enter_velocity
	vertical_speed = 800.0

func update(delta):
	var distanciaEntrePersonajeYHook = owner.body.get_global_position() - self.hookPosition
	var distancia2 = Vector2(abs(distanciaEntrePersonajeYHook.x), abs(distanciaEntrePersonajeYHook.y))
	var reached_hook = distancia2.x < 35 and distancia2.y < 35
	if reached_hook:
		owner.itimer.start()
	speed = 1500
	velocity = self.direction * speed
	velocity.y += gravity * delta
	#screen shake
	#shake(duration, frequency, amplitude)
	owner.get_node("Camera2D").shake(0.02, 100, 2)
	velocity = owner.move_and_slide(velocity)
	lighting.width = 10
	lighting.visible = true
	

func _on_Timer_timeout():
	lighting.width = 4
	lighting.visible = false
	owner.hitted_hook = false
	lighting.set_default_color(owner.default_aim_color)
	emit_signal("finished", "impulse") #impulse /move
