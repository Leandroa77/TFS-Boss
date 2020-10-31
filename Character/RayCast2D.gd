extends RayCast2D



func _process(delta):
	var mouse_pos := get_global_mouse_position()
	var angle_from_mouse_to_player := mouse_pos.angle_to_point(global_position)
	rotation = (angle_from_mouse_to_player - (PI/2))
