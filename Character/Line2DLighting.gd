extends Line2D

func cast_to_target(target_position):
	print("dentro del lighting")
	print(target_position)
	set_point_position(1, transform.xform_inv(target_position))

func _ready():
	pass
