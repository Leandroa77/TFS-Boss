extends Node2D

export var laser_size: = 0 
export var raycast_size := 3
onready var raycast2d := $RayCast2D
onready var line2d := $Line2D


export var speed = 0.5
export var distance = 50.0
export var move_direction = Vector2.DOWN
var time_init = 0.0
var origin = Vector2(0,0)





func _physics_process(delta):
	check_for_hits()
	if raycast2d.is_colliding():
		
		
		make_beam()
		
	##borrar
	time_init = time_init + delta
	var position_move = sin (time_init * speed * PI)
	var offset = position_move * distance * move_direction
	position = origin + offset
	rotate(0.001)
	pass
	

func set_laser_raycast_width_size(aSize):
	$RayCast2D.scale.x = aSize
	$RayCast2D.scale.y = aSize

func make_beam():
	line2d.points[1] = global_transform.xform_inv(raycast2d.get_collision_point())
	

func check_for_hits():
	raycast2d.force_raycast_update()
	var col = raycast2d.get_collider()
	if col != null: 
		if col.is_in_group("player") and line2d.points[1] != line2d.points[0]:
			raycast2d.get_collider().got_hit()

func _ready():
	#configurar el audio con señales (?.
	$AudioStreamPlayer2D.set_volume_db(-20)
	line2d.width = 15
	line2d.points[0] = $BeamStart.position
	line2d.points[1] = $BeamStart.position
	
	##borrar
	#time_init = 0.0
	#origin = position
	pass 

