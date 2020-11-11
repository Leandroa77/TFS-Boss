extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func hitted():
	$Explosion.detonate_explosion()
	$Sprite.visible = false
	$CollisionShape2D.disabled = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
