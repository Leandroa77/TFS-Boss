extends "res://Character/State.gd"
#extends Node2D


onready var enemy_position
onready var enemy
onready var lighting = owner.get_node("Line2DLighting")
onready var camera = owner.get_node("Camera2D")
onready var timer = $Timer

#func initialize(enemy):
func initialize(enem):
	self.enemy_position = enem.get_global_position()
	self.enemy = enem 
	timer.start()

func update(delta):
	#screen shake
	#shake(duration, frequency, amplitude)
	camera.shake(0.1, 100, 3)
	#lighting.cast_to_target(enemy.get_global_position()) 
	lighting.set_default_color(ColorN("red",1))
	lighting.width = 15
	lighting.visible = true
	

func _on_Timer_timeout():
	lighting.width = 4
	lighting.visible = false
	lighting.set_default_color(owner.default_aim_color)
	enemy.hitted()
	#shake(duration, frequency, amplitude)
	owner.get_node("Camera2D").shake(0.4, 100, 10)
	emit_signal("finished", "jump")#
	pass # Replace with function body.
