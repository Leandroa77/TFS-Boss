extends Area2D

export var speed = 0.5
export var distance = 50.0
export var move_direction = Vector2.DOWN
var time_init = 0.0
var origin = Vector2(0,0)

func _ready():
	time_init = 0.0
	origin = position

func _physics_process(delta):
	time_init = time_init + delta
	var position_move = sin (time_init * speed * PI)
	var offset = position_move * distance * move_direction
	position = origin + offset
	rotate(1)


func _on_Saw_body_entered(body):
	if body.is_in_group("player"):
		body.got_hit()
	pass # Replace with function body.
