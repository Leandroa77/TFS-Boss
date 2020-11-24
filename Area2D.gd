extends Area2D



func _physics_process(delta):
	rotate(1)

func _ready():
	pass # Replace with function body.



func _on_Saw_body_entered(body):
	if body.is_in_group("player"):
		body.got_hit()
	pass # Replace with function body.

