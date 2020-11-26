extends StaticBody2D

signal detonate(value)

func hitted():
	emit_signal("detonate", 7)
	$Explosion.detonate_explosion()
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	$Timer.start()

func _ready():
	$Explosion.disable_damage()

func _on_Timer_timeout():
	queue_free()
