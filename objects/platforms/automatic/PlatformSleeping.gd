extends KinematicBody2D

export var speed = 0.5
export var move_direction = Vector2.DOWN
var can_move = false


func _physics_process(delta):
	if can_move:
		position += move_direction * speed * delta


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		can_move= true
	pass # Replace with function body.
