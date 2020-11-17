extends Node2D

onready var animatedSprite : AnimatedSprite = $AnimatedSprite


func _ready():
	animatedSprite.play("default")
	pass 


