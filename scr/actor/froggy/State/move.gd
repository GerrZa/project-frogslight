#MOVE STATE
extends FroggyState

var move_direction

var move_particle = preload("res://scr/actor/froggy/dust_paricle/dust_particle.tscn")
var move_sfx = preload("res://asset/fx/sound_fx/froggy_sfx/sfx_froggymove_v3.wav")

func enter(msg := {}):
	
	if msg.has("direction"):
		move_direction = msg["direction"]
		
		var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(froggy,"global_position",froggy.global_position + (move_direction * 16),froggy.move_time)
		
		froggy.total_light -= 1
		
		var particle_dir = ""
		
		match move_direction:
			Vector2.RIGHT: 
				froggy.animtree.travel("move_right")
				particle_dir = "right"
			Vector2.LEFT: 
				froggy.animtree.travel("move_left")
				particle_dir = "left"
			Vector2.UP: 
				froggy.animtree.travel("move_up")
				particle_dir = "up"
			Vector2.DOWN: 
				froggy.animtree.travel("move_down")
				particle_dir = "down"
		
		get_tree().current_scene.emit_signal("froggy_move")
		froggy.light_array.remove(froggy.light_array.size() - 1)
		
		var dust = move_particle.instance()
		
		get_tree().current_scene.add_child(dust)
		dust.global_position = froggy.global_position
		dust.play(particle_dir)
		
		$"%AudioStreamPlayer".stream = move_sfx
		$"%AudioStreamPlayer".play()
		
		yield(tween,"finished")
		
		$"%hole_check".get_child(0).disabled = false
		if $"%hole_check".get_overlapping_areas().empty() == false:
			state_machine.transition_to("jump_in")
		elif $"%consume_hitbox".get_overlapping_areas().empty() == true and $"%burn_zone".get_overlapping_areas().empty() == true:
			state_machine.transition_to("idle")
		elif $"%consume_hitbox".get_overlapping_areas().empty() == false and $"%burn_zone".get_overlapping_areas().empty() == false:
			state_machine.transition_to("burned")
		elif $"%burn_zone".get_overlapping_areas().empty() == false and $"%consume_hitbox".get_overlapping_areas().empty() == true:
			state_machine.transition_to("burned")
		elif $"%burn_zone".get_overlapping_areas().empty() == true and $"%consume_hitbox".get_overlapping_areas().empty() == false:
			state_machine.transition_to("eat")
