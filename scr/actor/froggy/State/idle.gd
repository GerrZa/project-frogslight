#IDLE STATE
extends FroggyState

signal enter_fin

func enter(msg := {}):
	
	if msg.has("pullback"):
		
		froggy.animtree.travel("idle")
		get_tree().current_scene.emit_signal("tongue",false)
	else:
		froggy.animtree.travel("idle")
	
	if $"%hole_check".get_overlapping_areas().empty() == false:
		state_machine.transition_to("jump_in")
	elif $"%burn_zone".get_overlapping_areas().empty() == false:
		state_machine.transition_to("burned")

func unhandled_input(event):
	
	if froggy.total_light > 0:
		if Input.is_action_just_pressed("ui_right") and $"%r_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.RIGHT})
		elif Input.is_action_just_pressed("ui_left") and $"%l_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.LEFT})
		elif Input.is_action_just_pressed("ui_down") and $"%b_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.DOWN})
		elif Input.is_action_just_pressed("ui_up") and $"%f_wall".is_colliding() == false:
			state_machine.transition_to("move",{"direction" : Vector2.UP})
	elif (froggy.total_light >= 0 and (Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left")
		or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"))):
			get_tree().current_scene.normal_gameover(froggy.get_node("froggy_spr").global_position, froggy.get_node("froggy_spr").offset)
	
	if Input.is_action_just_pressed("ui_tongue") and get_tree().current_scene.is_paused == false:
		state_machine.transition_to("tongue_idle",{"open_tongue" : true})
	
