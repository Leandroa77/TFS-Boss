extends Node2D

var partes
var directions = [Vector2(-0.209069, -0.977901), Vector2(0.314179, -0.949364), Vector2(-0.915833, -0.401559), Vector2(0.707106, -0.707108), Vector2(-0.648037, -0.761609), Vector2(0.942496, -0.334219)]

func _ready():
	var index = 0
	partes = get_children()
	for parte in partes:
		parte.apply_central_impulse(directions[index] * 300)
		index +=1
