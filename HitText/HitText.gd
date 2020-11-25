extends Label

onready var TweenNode = $Tween
var value = 1
var baseSize = 16
var size = 16

func incrementHit(value, pos):
	match value:
		1:
			text = "1 Hit"
			changeFontSize(16)
			changeColor(Color.white)
			changeModuleColor(Color(1, 1, 1, 1))
			MoveLeft(pos)
		2:
			text = "2 Hits"
			changeFontSize(20)
		3:
			text = "3 Hits"
			power()
			changeFontSize(25)
		_:
			MoveRight(pos)

func toChange(value, pos):
	match value:
		0:
			MoveRight(pos)
		1:
			text = "1 Hit"
			size = baseSize
			changeColor(Color.white)
			changeModuleColor(Color(1, 1, 1, 1))
			changeFontSize(size)
			MoveLeft(pos)
		_:
			text = str(value) + " Hits"
			size += 3
			changeFontSize(min(size, 25))
			if(value == 3):
				power()

func MoveLeft(pos):
	TweenNode.interpolate_property(self, "rect_position", get_rect().position, pos, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	TweenNode.start()

func MoveRight(pos):
	TweenNode.interpolate_property(self, "rect_position", get_rect().position, pos, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	TweenNode.start()

func power():
	changeModuleColor(Color(1.3, 1.3, 1.3, 1))
	changeColor(Color.red)

func changeFontSize(value):
	get("custom_fonts/font").set("size", value)

func changeColor(color):
	set("custom_colors/font_color", color)

func changeModuleColor(color):
	set("modulate", color)

func _on_Character_hit(value, pos):
	toChange(value, pos)
