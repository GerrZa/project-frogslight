#PULL BACK
extends FroggyState

var tween_time_divider = 300

func enter(msg := {}):
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($"%tongue_tip","position",Vector2.ZERO,
		$"%tongue_tip".global_position.distance_to(froggy.global_position)/tween_time_divider)
	
	yield(tween,"finished")
	
	if $"%consume_hitbox".get_overlapping_areas().empty() == false:
		state_machine.transition_to("eat")
	else:
		state_machine.transition_to("idle",{"pullback" : true})

func physics_update(delta):
	
	if $"%tongue_tip".get_overlapping_areas().empty() == false:
		$"%tongue_tip".get_overlapping_areas()[0].global_position = $"%tongue_tip".global_position
