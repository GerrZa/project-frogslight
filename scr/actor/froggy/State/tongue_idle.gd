#TONGUE IDLE
extends FroggyState

func enter(msg := {}):
	
	if msg.has("open_tongue"):
		
		froggy.animtree.travel("tongue_open")
	

func unhandled_input(event):
	
	if froggy.basic_light_left > 0 or froggy.extra_light_left > 0:
		if Input.is_action_just_pressed("ui_right") and $"%r_tong_wall".is_colliding() == false:
			state_machine.transition_to("tongue_move",{"direction" : Vector2.RIGHT})
		elif Input.is_action_just_pressed("ui_left") and $"%l_tong_wall".is_colliding() == false:
			state_machine.transition_to("tongue_move",{"direction" : Vector2.LEFT})
		elif Input.is_action_just_pressed("ui_down") and $"%b_tong_wall".is_colliding() == false:
			state_machine.transition_to("tongue_move",{"direction" : Vector2.DOWN})
		elif Input.is_action_just_pressed("ui_up") and $"%f_tong_wall".is_colliding() == false:
			state_machine.transition_to("tongue_move",{"direction" : Vector2.UP})
	
	if Input.is_action_just_pressed("ui_tongue"):
		state_machine.transition_to("pullback")

