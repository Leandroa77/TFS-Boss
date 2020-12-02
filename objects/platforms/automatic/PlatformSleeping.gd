extends KinematicBody2D

signal changeMusic(value)

export var speed = 50
export var move_direction = Vector2(0,-1)
var can_move = false

func _physics_process(delta):
	if can_move:
		position += move_direction * speed * delta

func set_can_move(boolean):
	print("por x razon se llamo a esto")
	can_move=false

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		print("detecto al player")
		can_move= true
		emit_signal("changeMusic", 2)
	pass # Replace with function body.
