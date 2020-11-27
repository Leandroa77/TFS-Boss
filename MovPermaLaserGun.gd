extends KinematicBody2D

export var speed = 0.5
export var distance = 50.0
export var move_direction = Vector2.DOWN
var time_init = 0.0
var origin = Vector2(0,0)
var player_detected = false

func _ready():
	time_init = 0.0
	origin = position

func _physics_process(delta):
	if !player_detected:
		time_init = time_init + delta
		var position_move = sin (time_init * speed * PI)
		var offset = position_move * distance * move_direction
		position = origin + offset


func _on_Turret_playerDetected():
	player_detected = true
	pass # Replace with function body.


func _on_Turret_playerEscaped():
	player_detected = false
	pass # Replace with function body.
