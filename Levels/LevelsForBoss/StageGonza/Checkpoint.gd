extends Node2D

signal setCheckpoint(value)

func _on_Area2D_body_entered(body):
	emit_signal("setCheckpoint", global_position)
	queue_free()
