extends FroggyState

func enter(msg := {}):
	
	if msg.has("pullback"):
		
		pass #Put pull back animation yield here
	else:
		froggy.animtree.travel("idle")
	

func unhandled_input(event):
	
	if froggy.basic_light_left > 0 or froggy.extra_light_left > 0:
		if Input.is_action_just_pressed("ui_right") and $"%r_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.RIGHT})
		elif Input.is_action_just_pressed("ui_left") and $"%l_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.LEFT})
		elif Input.is_action_just_pressed("ui_down") and $"%b_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.DOWN})
		elif Input.is_action_just_pressed("ui_up") and $"%f_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.UP})
	else:
		pass
	
	if Input.is_action_just_pressed("ui_tongue"):
		state_machine.transition_to("tongue_idle",{"open_tongue" : true})
	
