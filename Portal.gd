extends Area2D

export(int) var id = 0

signal sound(value)

var lock_portal = false
var can_be_used = true

# Funciona, pero no tan bien como deberia con el impulso.

func do_lock():
	lock_portal = true
	yield(get_tree().create_timer(0.3),"timeout")
	lock_portal = false

func is_being_used():
	can_be_used = false
	$TimerCD.start()
	
#func can_be_used():
#	return can_be_used

func _on_Portal_body_entered(body):
	if body.is_in_group("player"):
		if can_be_used:
			for portal in get_tree().get_nodes_in_group("portal"):
				if portal.can_be_used:
					if(portal.id == self.id and portal != self):
						emit_signal("sound", 6)
						portal.is_being_used()
						body.position = portal.position
	pass # Replace with function body.


func _on_TimerCD_timeout():
	can_be_used = true
	pass # Replace with function body.
