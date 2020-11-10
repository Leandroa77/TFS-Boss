extends Label

onready var TweenNode = $Tween
var value = 1

func _ready():
	set_process(true)

func _process(delta):
	
	if Input.is_action_just_pressed("test_izq"):
		incrementHit(value)
		value += 1
	
	if(value > 4):
		value = 1

func changeColorRed():
	set("custom_colors/font_color", Color(1,0,0))

func changeColorWhite():
	set("custom_colors/font_color", Color(1,1,1))

func incrementHit(value):
	match value:
		1:
			text = "1 Hit"
			get("custom_fonts/font").set("size", 16)
			MoveLeft()
		2:
			text = "2 Hits"
			get("custom_fonts/font").set("size", 20)
		3:
			#Aca va el sonido
			text = "3 Hits"
			changeColorRed()
			get("custom_fonts/font").set("size", 25)
		_:
			MoveRight()
			changeColorWhite()

func MoveLeft():
	var newPos = Vector2(get_rect().position.x - 500, get_rect().position.y)
	TweenNode.interpolate_property(self, "rect_position", get_rect().position, newPos, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	TweenNode.start()

func MoveRight():
	var newPos = Vector2(get_rect().position.x + 500, get_rect().position.y)
	TweenNode.interpolate_property(self, "rect_position", get_rect().position, newPos, 1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
	TweenNode.start()
