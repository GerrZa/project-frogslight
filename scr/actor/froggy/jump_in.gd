extends FroggyState

func enter(msg := {}):
	
	get_tree().root.set_disable_input(true)
	
	froggy.animtree.travel("jump_in")
	
	$"%hole_check".get_overlapping_areas()[0].jump_play_anim()
	
	yield(get_tree().create_timer($"%AnimationPlayer".get_animation('jump_in').length),"timeout")
	
	state_machine.transition_to("jump_out")
