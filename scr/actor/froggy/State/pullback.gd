#PULL BACK
extends FroggyState

var tween_time_divider = 300

var sfx_pulltongue = preload("res://asset/fx/sound_fx/froggy_sfx/sfx_pulltongue_v2.wav")

var triggered_fly = []

func enter(msg := {}):
	
	triggered_fly = $"%tongue_tip".get_overlapping_areas()
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($"%tongue_tip","position",Vector2.ZERO,
		$"%tongue_tip".global_position.distance_to(froggy.global_position)/tween_time_divider)
	
	$"%AudioStreamPlayer".stream = sfx_pulltongue
	$"%AudioStreamPlayer".play()
	
	
	yield(tween,"finished")
	
	if $"%consume_hitbox".get_overlapping_areas().empty() == false:
		state_machine.transition_to("eat",{"close_ui" : true})
	else:
		state_machine.transition_to("idle",{"pullback" : true})

func physics_update(delta):
	for fly in triggered_fly:
		fly.global_position = $"%tongue_tip".global_position
	
