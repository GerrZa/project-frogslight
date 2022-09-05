extends FroggyState

var move_direction

func enter(msg := {}):
	
	if msg.has("direction"):
		move_direction = msg["direction"]
		
		var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(froggy,"global_position",froggy.global_position + (move_direction * 16),froggy.move_time)
		
		if froggy.extra_light_left > 0:
			froggy.extra_light_left -= 1
		else:
			froggy.basic_light_left -= 1
		
		match move_direction:
			Vector2.RIGHT: froggy.animtree.travel("move_right")
			Vector2.LEFT: froggy.animtree.travel("move_left")
			Vector2.UP: froggy.animtree.travel("move_up")
			Vector2.DOWN: froggy.animtree.travel("move_down")
		
		yield(tween,"finished")
		
		state_machine.transition_to("idle")
