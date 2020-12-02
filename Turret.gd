extends Area2D

signal playerDetected
signal playerEscaped

onready var timer_shooting_cooldown :Timer = $TimerShootingCD
var target
var can_shoot = false
var can_shoot_cd = true

onready var bullet_scene = preload("res://obstacles/guns/turret/Bullet.tscn")
onready var bullet_start_position:Position2D = $Position2DStartOfProyectile

func shoot():
	if can_shoot():
		var bullet = bullet_scene.instance()
	#get_parent().add_child(bullet)
		bullet.global_position = bullet_start_position.global_position
		bullet.set_target(target)
	
	#call_deferred("add_child", bullet)
	#add_child(bullet)
		get_parent().get_parent().call_deferred("add_child", bullet)
		can_shoot_cd = false
		$TimerCD.start()
	#call_deferred("add_child", bullet)
	#add_child(bullet)
	
func can_shoot():
	return can_shoot and can_shoot_cd
	
#get_parent().call_deferred("add_child", bullet)
#	call_deferred("add_child", bullet)
#
func _on_Area2DDetection_body_entered(body):
	
	if body.is_in_group("player"):
		target = body
		try_to_shoot()
		timer_shooting_cooldown.start()
	pass # Replace with function body.

func _physics_process(delta):
	if can_shoot:
		try_to_shoot()

func try_to_shoot():
	can_shoot = true
	var space_state = get_world_2d().direct_space_state
	
	var result = space_state.intersect_ray(global_position, target.global_position,
					[self], collision_mask)#, collision_mask
	
	if result:
		if result.collider.is_in_group("player"):
			emit_signal("playerDetected")
			$Sprite.set_modulate(Color(1.2,1.2,1.2,1))
			shoot()
		else:
			#print("eaeaea")
			$Sprite.set_modulate(Color(1,1,1,1))
			emit_signal("playerEscaped")
			timer_shooting_cooldown.stop()
	
	

func _on_Area2DDetection_body_exited(body):
	if body.is_in_group("player"):
		emit_signal("playerEscaped")
		$Sprite.set_modulate(Color(1,1,1,1))
		target = null
		can_shoot = false
		timer_shooting_cooldown.stop()


func _on_TimerShootingCD_timeout():
	if target == null:
		emit_signal("playerEscaped")
		$Sprite.set_modulate(Color(1,1,1,1))
		can_shoot = false
		timer_shooting_cooldown.stop()
		emit_signal("playerEscaped")
	else:
		try_to_shoot()


func _on_Turret_body_entered(body):
	if body.is_in_group("player"):
		body.got_hit()
	pass # Replace with function body.


func _on_TimerCD_timeout():
	can_shoot_cd = true
	pass # Replace with function body.
