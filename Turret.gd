extends Area2D

signal playerDetected
signal playerEscaped

onready var timer_shooting_cooldown :Timer = $TimerShootingCD
var target
var can_shoot = false

onready var bullet_scene = preload("res://obstacles/guns/turret/Bullet.tscn")
onready var bullet_start_position:Position2D = $Position2DStartOfProyectile

func shoot():
	var bullet = bullet_scene.instance()
	#get_parent().add_child(bullet)
	bullet.global_position = bullet_start_position.global_position
	bullet.set_target(target)
	
	#call_deferred("add_child", bullet)
	#add_child(bullet)
	get_parent().get_parent().call_deferred("add_child", bullet)
	
	can_shoot = false
	#call_deferred("add_child", bullet)
	#add_child(bullet)
	

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
	#en proceso
	#shoot()
	can_shoot = true
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, target.position,
					[self])#, collision_mask
	print("esta intentando disparar")
	print (result.values())
	if result:
		
		#hit_pos = result.position
		#if result.collider.name == 'Character':
		if result.collider.is_in_group("player"):
			emit_signal("playerDetected")
			$Sprite.set_modulate(Color(1.2,1.2,1.2,1))
			print("el colider es un player")
			#$Sprite.self_modulate.r = 1.0
			#rotation = (target.position - position).angle()
			#if can_shoot:
			#shoot(target.position)
			shoot()
		else:
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
	pass # Replace with function body.


func _on_TimerShootingCD_timeout():
	try_to_shoot()
	pass # Replace with function body.


func _on_Turret_body_entered(body):
	if body.is_in_group("player"):
		body.got_hit()
	pass # Replace with function body.
