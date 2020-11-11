extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var next_scene : PackedScene
export var current_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Character.set_timer(20)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
