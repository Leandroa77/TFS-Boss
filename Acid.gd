extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity :float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += (Vector2(0, -1)) * velocity * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Acid_body_entered(body):
	if body.is_in_group("player"):
		body.got_hit()
	pass # Replace with function body.
