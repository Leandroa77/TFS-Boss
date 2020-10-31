extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _physics_process(delta):
	#se puede tener el crosshair titileando o el estatico
	#$SpriteCrosshair.set_global_position(get_global_mouse_position())
	$AnimatedSprite.set_global_position(get_global_mouse_position())
