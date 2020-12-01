extends Node2D

export var time_shooting: = 1.0
export var time_cooldown: = 1.0
export var time_first_shoot: = 0.0
export var laser_size: = 0 
export var raycast_size := 3
onready var raycast2d := $RayCast2D
onready var line2d := $Line2D
onready var timer_cooldown := $TimerCooldown
onready var timer_shooting := $TimerShooting
onready var timer_first_shoot := $TimerFirstShoot



export var speed:= 50000
var is_shooting = false

func _process(delta):
	check_for_hits()
	if is_shooting and raycast2d.is_colliding():
		$clipart2761458.set_modulate(Color(1.25,1,1,1))
		make_beam()
	else:
		$clipart2761458.set_modulate(Color(1,1,1,1))

func _physics_process(delta):
	pass
	
	
	
func shoot():
	is_shooting = true
		#aca se puede agregar efectos visuales como particulas o etc. 
	pass

func set_laser_raycast_width_size(aSize):
	$RayCast2D.scale.x = aSize
	$RayCast2D.scale.y = aSize

func make_beam():
	line2d.points[1] = global_transform.xform_inv(raycast2d.get_collision_point())

func check_for_hits():
	#rompe cuando el personaje muere muy rapido (?
	# attempt to call function "is in group" in base null instance on a null instance
	#wtf... raro. es por que es muy rapido??
	raycast2d.force_raycast_update()
	var col = raycast2d.get_collider()
	if col != null: 
		if col.is_in_group("player") and line2d.points[1] != line2d.points[0]:
			raycast2d.get_collider().got_hit()

func _ready():
	#configurar el audio.
	$AudioStreamPlayer2D.set_volume_db(-20)
	line2d.width = laser_size
	line2d.points[0] = $BeamStart.position
	line2d.points[1] = $BeamStart.position
	shoot()
	
	timer_shooting.set_wait_time(time_shooting)
	timer_cooldown.set_wait_time(time_cooldown)
	
	#para setear los lasers en diferente tiempo
	timer_first_shoot.set_wait_time(time_first_shoot)
	
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
