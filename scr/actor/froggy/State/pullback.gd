#PULL BACK
extends FroggyState

var tween_time_divider = 1000

func enter(msg := {}):
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($"%tongue_tip","position",Vector2.ZERO,
		$"%tongue_tip".global_position.distance_to(froggy.global_position)/tween_time_divider)
	
	print($"%tongue_tip".global_position.distance_to(froggy.global_position)/tween_time_divider)
	
	yield(tween,"finished")
	
	state_machine.transition_to("idle",{"pullback" : true})
