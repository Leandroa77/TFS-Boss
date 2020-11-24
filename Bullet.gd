extends KinematicBody2D

export var speed:float = 400.0
onready var animated_sprite_explosion: AnimatedSprite = $AnimatedSprite
var target
var target_position 
var dir = null
var is_shooting 
var hitted_player = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	is_shooting = true
	pass # Replace with function body.


func _physics_process(delta):
	if (dir != null and is_shooting):
		
		var normalized_dir = dir.normalized()  * speed
		move_and_slide(normalized_dir) 
	if (hitted_something() and is_shooting):
		is_shooting = false
		detonate()
		if hitted_player:
			target.got_hit()
		

func hitted_something():
	var slide_count = get_slide_count()
	if slide_count and is_shooting:
		var collision = get_slide_collision(slide_count - 1)
		var collider = collision.collider
		hitted_player = collider.is_in_group("player")	
	return slide_count > 0
	
		
func detonate():
	$CollisionShape2D.queue_free()
	$"pixel yellow circle".visible = false
	animated_sprite_explosion.visible = true
	animated_sprite_explosion.play("explosion")
	
	

func set_target(target):
	self.target = target
	setDir()
	
func setDir():	
	dir = (target.global_position - global_position )



func _on_AnimatedSprite_animation_finished():
	queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
