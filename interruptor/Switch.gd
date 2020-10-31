extends Area2D

signal activar_plataforma
# Declare member variables here. Examples:
# var a = 2
var active = false
signal desactivar_plataforma


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func activate():
	if active == false:
		active = true
		$Sprite2.z_index = 0
		$Sprite.z_index = -1
		emit_signal("activar_plataforma")
	else:
		active = false
		$Sprite.z_index = 0
		$Sprite2.z_index = -1
		emit_signal("desactivar_plataforma")
