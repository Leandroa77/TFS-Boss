extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func detonate_explosion():
	$AnimatedSprite.set_process(true)
	$AnimatedSprite.visible = true
	$CollisionShape2D.disabled = false
	$AnimatedSprite.play()
	pass

func _on_Explosion_body_entered(body):
	if $AnimatedSprite.is_playing() and body.is_in_group("player"):
		body.die()


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.set_process(false)
	$AnimatedSprite.visible = false
	$CollisionShape2D.disabled = true
	pass # Replace with function body.
