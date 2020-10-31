extends RigidBody2D
var dirUp = Vector2.UP
var speed = 300
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.


func activateTrap():
	apply_central_impulse(dirUp * speed)

func _on_Spikes_body_entered(body):
	if body.is_in_group("player"):
		body.die()
