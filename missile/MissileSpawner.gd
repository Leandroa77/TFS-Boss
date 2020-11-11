extends Node2D


onready var Missile = preload ("res://missile/Missile.tscn")
 #Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target: Character 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var misil = Missile.instance()
	if target == null:
		misil.queue_free()
	else:
		misil.target = target
		add_child(misil)
