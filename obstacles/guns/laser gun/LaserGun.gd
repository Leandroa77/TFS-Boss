extends Node2D

export var time_shooting: = 1.0
export var time_cooldown: = 1.0
export var laser_size: = 0 
export var raycast_size := 3
onready var raycast2d := $RayCast2D
onready var line2d := $Line2D
onready var timer_cooldown := $TimerCooldown
onready var timer_shooting := $TimerShooting



export var speed:= 50000
var is_shooting = false

func _physics_process(delta):
	check_for_hits()
	if is_shooting and raycast2d.is_colliding():
		make_beam()
	
	
func shoot():
	is_shooting = true
		#aca se puede agregar efectos visuales como particulas o etc. 
	pass

func set_laser_raycast_width_size(aSize):
	$RayCast2D.scale.x = aSize
	$RayCast2D.scale.y = aSize

func make_beam():
	line2d.points[1] = transform.xform_inv(raycast2d.get_collision_point())

func check_for_hits():
	if raycast2d.is_colliding() and raycast2d.get_collider().is_in_group("player") and raycast2d.get_collider() != null and line2d.points[1] != line2d.points[0]:
		raycast2d.get_collider().die()

func _ready():
	#configurar el audio. en un volumen tan negativo no se escucha
	$AudioStreamPlayer2D.set_volume_db(-200000)
	line2d.width = laser_size
	line2d.points[0] = $BeamStart.position
	line2d.points[1] = $BeamStart.position
	shoot()
	
	timer_shooting.set_wait_time(time_shooting)
	timer_cooldown.set_wait_time(time_cooldown)
	timer_shooting.start()
	set_laser_raycast_width_size(raycast_size)
	pass 


func _on_TimerShooting_timeout():
	line2d.points[1] = line2d.points[0]
	is_shooting = false
	timer_cooldown.start()
	$AudioStreamPlayer2D.stop()
	

func _on_TimerCooldown_timeout():
	shoot()
	$AudioStreamPlayer2D.play()
	timer_shooting.start()


func _on_TimerFirstShoot_timeout():
	shoot()
	$AudioStreamPlayer2D.play()
