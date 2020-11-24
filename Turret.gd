extends Node2D

signal playerDetected
signal playerEscaped

onready var timer_shooting_cooldown :Timer = $TimerShootingCD
var target

onready var bullet_scene = preload("res://obstacles/guns/turret/Bullet.tscn")
onready var bullet_start_position:Position2D = $Position2DStartOfProyectile

func shoot():
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.global_position = bullet_start_position.global_position
	bullet.set_target(target)



func _on_Area2DDetection_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("playerDetected")
		$Sprite.set_modulate(Color(1.2,1.2,1.2,1))
		target = body
		shoot()
		timer_shooting_cooldown.start()
	pass # Replace with function body.


func _on_Area2DDetection_body_exited(body):
	if body.is_in_group("player"):
		emit_signal("playerEscaped")
		$Sprite.set_modulate(Color(1,1,1,1))
		target = null
		timer_shooting_cooldown.stop()
	pass # Replace with function body.


func _on_TimerShootingCD_timeout():
	shoot()
	pass # Replace with function body.
