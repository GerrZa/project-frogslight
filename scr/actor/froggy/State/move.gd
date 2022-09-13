#MOVE STATE
extends FroggyState

var move_direction

func enter(msg := {}):
	
	if msg.has("direction"):
		move_direction = msg["direction"]
		
		var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(froggy,"global_position",froggy.global_position + (move_direction * 16),froggy.move_time)
		
		froggy.total_light -= 1
		
		match move_direction:
			Vector2.RIGHT: froggy.animtree.travel("move_right")
			Vector2.LEFT: froggy.animtree.travel("move_left")
			Vector2.UP: froggy.animtree.travel("move_up")
			Vector2.DOWN: froggy.animtree.travel("move_down")
		
		get_tree().current_scene.emit_signal("froggy_move")
		froggy.light_array.remove(froggy.light_array.size() - 1)
		
		yield(tween,"finished")
		
		if $"%consume_hitbox".get_overlapping_areas().empty() == true:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("eat")
