extends StaticBody2D

#mask 2
#layer 2


func glow_on():
	$Light2D.set_process(true)
	$Light2D.visible = true
	
func glow_off():
	$Light2D.visible = false
	$Light2D.set_process(false)




