extends FroggyState

func enter(msg := {}):
	
	froggy.animtree.travel("jump_out")
	
	var target_hole = $"%hole_check".get_overlapping_areas()[0]
	var warp_hole = target_hole.get_target_pos()
	
	froggy.global_position = warp_hole
	
	yield(get_tree().create_timer($"%AnimationPlayer".get_animation("jump_out").length),"timeout")
	
	get_tree().root.set_disable_input(false)
	
	$"%hole_check".get_child(0).disabled = true

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
	
	if Input.is_action_just_pressed("ui_tongue"):
		state_machine.transition_to("tongue_idle",{"open_tongue" : true})
	
