extends Node2D

export var color:Color
export var punto:Vector2
signal playFx(value)

func _ready():
	$Particles2D.get("process_material").color = color

func _on_Area2D_body_entered(body):
	emit_signal("playFx", 6)
	body.global_position = punto
