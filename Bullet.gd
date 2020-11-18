extends KinematicBody2D

export var speed:float = 25000.0
onready var animated_sprite_explosion: AnimatedSprite = $AnimatedSprite
var target
var target_position 
var dir 
var is_shooting 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	is_shooting = true
	pass # Replace with function body.


func _physics_process(delta):
	if (dir != null and is_shooting):
		
		#dir = target_position - position
		dir = move_and_slide(dir.normalized() * delta * speed ) 
	if (hitted_something()):
		is_shooting = false
		detonate()

func hitted_something():
	return get_slide_count() > 0
		
func detonate():
	$"pixel yellow circle".visible = false
	animated_sprite_explosion.visible = true
	animated_sprite_explosion.play("explosion")
	

func set_target(target):
	self.target = target
	dir = ( position - target.global_position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	queue_free()
	pass # Replace with function body.
