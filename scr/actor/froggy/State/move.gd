extends FroggyState

var move_direction

func enter(msg := {}):
	
	if msg.has("direction"):
		move_direction = msg["direction"]
		
		var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(froggy,"global_position",froggy.global_position + (move_direction * 16),froggy.move_time)
		
		yield(tween,"finished")
		
		state_machine.transition_to("idle")
