extends StaticBody2D

signal detonate(value)

func hitted():
	$Explosion.detonate_explosion()
	$Sprite.visible = false
	emit_signal("detonate", 1)
	$CollisionShape2D.disabled = true
	$Timer.start()

func _ready():
	$Explosion.disable_damage()

func _on_Timer_timeout():
	queue_free()
