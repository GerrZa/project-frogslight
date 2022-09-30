extends FroggyState

func enter(msg := {}):
	
	get_tree().root.set_disable_input(true)
	
	froggy.animtree.travel("jump_in")
	
	$"%hole_check".get_overlapping_areas()[0].jump_play_anim()
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($"Light2D","texture_scale",0.01,0.15)
	
	yield(get_tree().create_timer(0.13),"timeout")
	
	$Light2D.enabled = false
	
	yield(get_tree().create_timer($"%AnimationPlayer".get_animation('jump_in').length),"timeout")
	
	state_machine.transition_to("jump_out")
