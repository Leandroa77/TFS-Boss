extends KinematicBody2D
#mask 2
#layer 2


export var speed = 0.5
export var move_direction = Vector2.DOWN

func _physics_process(delta):
	position += (move_direction * speed * delta)
	rotate(0.1)


func _on_Hook_area_entered(area):
	#aca se produciria el efecto
	pass 
