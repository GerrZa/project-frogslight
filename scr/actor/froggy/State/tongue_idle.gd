extends FroggyState

func unhandled_input(event):
	
	if Input.is_action_just_pressed("ui_right") and $"%r_wall".is_colliding() == false:
		state_machine.transition_to("tongue_move",{"direction" : Vector2.RIGHT})
	elif Input.is_action_just_pressed("ui_left") and $"%l_wall".is_colliding() == false:
		state_machine.transition_to("tongue_move",{"direction" : Vector2.LEFT})
	elif Input.is_action_just_pressed("ui_down") and $"%b_wall".is_colliding() == false:
		state_machine.transition_to("tongue_move",{"direction" : Vector2.DOWN})
	elif Input.is_action_just_pressed("ui_up") and $"%f_wall".is_colliding() == false:
		state_machine.transition_to("tongue_move",{"direction" : Vector2.UP})
	

