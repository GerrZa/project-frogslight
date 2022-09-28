#EAT
extends FroggyState

export var eat_anim_duration : float

func enter(msg := {}):
	
	if msg.has("close_ui"):
		get_tree().current_scene.emit_signal("tongue",false)
	
	froggy.animtree.travel("eat")
	$"%consume_hitbox".get_overlapping_areas()[0].get_eaten()
	
	yield(get_tree().create_timer(eat_anim_duration),"timeout")
	
	state_machine.transition_to("idle")
	
