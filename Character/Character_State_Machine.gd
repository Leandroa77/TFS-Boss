extends "res://Character/State_Machine.gd"

func _ready():
	owner = get_parent()
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump,
		"lighting": $Lighting,
		"impulse": $Impulse
	}
	
	for state in states_map.values():
		state.owner = owner

func _change_state(state_name):
	if not _active:
		return
	if state_name == "jump":
		states_stack.push_front(states_map[state_name])
	if state_name == "jump" and current_state == $Move:
		$Jump.initialize($Move.speed, $Move.velocity)
	if state_name == "impulse"  and current_state == $Lighting:
		
		$Impulse.initialize(current_state.direction , current_state.velocity, current_state.hookPosition)	
		
	._change_state(state_name)
	print("se paso a...")
	print(state_name)
		
		#$Impulse.initialize(current_state.direction, current_state.speed, current_state.velocity,current_state.hookPosition)._change_state(state_name)
#direction, speed, velocity, 

func _unhandled_input(event):
	## el lighting deberia interrumpir estados
	if Input.is_action_just_pressed("lighting"):# or Input.is_pressed"lighting") :
		current_state.owner.shoot_lighting()
	current_state.handle_input(event)

func changeToLighting(attraction_direction, hookPosition):
	$Lighting.initialize(attraction_direction, $Move.speed, $Move.velocity, hookPosition)
	._change_state("lighting")
