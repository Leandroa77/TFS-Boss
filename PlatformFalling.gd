extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	fade_in()
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$TimerFade.start()
		$TimerQueueOut.start()
	pass # Replace with function body.

func fade_in():
	$PlatformCen.visible = true
	$PlatformCen/PlatformDer.visible = true
	$PlatformCen/PlatformIzq.visible = true

func fade_out():
	$PlatformCen.visible = false
	$PlatformCen/PlatformDer.visible = false
	$PlatformCen/PlatformIzq.visible = false

func _on_TimerFade_timeout():
	fade_out()
	pass # Replace with function body.


func _on_TimerQueueOut_timeout():
	queue_free()
	pass # Replace with function body.
