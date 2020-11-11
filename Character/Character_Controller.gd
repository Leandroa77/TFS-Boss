extends KinematicBody2D

class_name Character
onready var timer:=$LevelTimer
onready var raycast2d:= $RayCast2DLighting
onready var aim:= $Line2DAim
onready var body:= $BodyPivot
onready var csm:= $Character_State_Machine
onready var itimer:= $ImpulseTimer

var last_hook_hitted = null
var hitted_hook = false
var default_aim_color = null

signal direction_changed(new_direction)

signal die(pos)

var look_direction = Vector2.RIGHT setget set_look_direction

func _ready():
	aim.visible = false
	default_aim_color = aim.get_default_color()
	
func set_timer(seconds):
	timer.value = seconds

func _process(delta):
	raycast2d.global_position = body.get_global_position()
	aim.points[0] = body.position
	
func _physics_process(delta):
	if raycast2d.is_colliding():
		aim.set_point_position(1, transform.xform_inv(raycast2d.get_collision_point()))
		if raycast2d.get_collider().is_in_group("hook"):
			last_hook_hitted = raycast2d.get_collider()
		if hitted_hook:
			aim.set_point_position(1, transform.xform_inv(last_hook_hitted.get_global_position()))
			aim.set_default_color(ColorN("darkturquoise",1))
		else:
			aim.set_default_color(default_aim_color)

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)

func shoot_lighting():
	if raycast2d.is_colliding():
		if raycast2d.get_collider().is_in_group("hook"): 
			hitted_hook = true
			var attraction_direction = (raycast2d.get_collider().get_global_position() - body.get_global_position()).normalized()
			var hookPosition = raycast2d.get_collider().get_global_position()
			csm.changeToLighting(attraction_direction, hookPosition)
	
		if !raycast2d.get_collider().is_in_group("hook"):
			missed_shoot_start()
	pass

func missed_shoot_start():
	aim.visible = true
	$ShootTimer.start()

func die():
	$Camera2D.clear_current()
	emit_signal("die", self.position)
	queue_free()

func _on_LevelTimer_timeOut():
	die()

func _on_ShootTimer_timeout():
	aim.visible = false
	pass 
