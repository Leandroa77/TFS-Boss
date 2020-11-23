extends Path2D

export var speed = 50
onready var follow = $PathFollow2D

func _process(delta):
	follow.offset += speed * delta
