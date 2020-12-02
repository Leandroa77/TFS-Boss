extends Node2D

signal bajarTexto()
signal borrarTexto()

export var textoToShow = ""
onready var text = $Text
onready var position2D = $Position2D
var tween

func _ready():
	tween = text.get_child(0)
	text.text = textoToShow

func _on_Timer_timeout():
	emit_signal("bajarTexto")
	
func _on_ProcessTimer_timeout():
	emit_signal("borrarTexto")

