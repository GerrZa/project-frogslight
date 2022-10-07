#TONGUE MOVE
extends FroggyState

var tongue_move_sfx = preload("res://asset/fx/sound_fx/froggy_sfx/sfx_tonguemove_v5.wav")

var move_direction = Vector2.ZERO
func enter(msg:={}):
	
	if msg.has("direction"):
		#Store the direction to the variable to make it easier to call
		move_direction = msg["direction"]
		
		#If extra light still left, decrease the extra light first
		froggy.total_light -= 1
		
		#Tween the tongue in the calculated position
		var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		new_tween.tween_property($"%tongue_tip","global_position",$"%tongue_tip".global_position + (move_direction * 16),froggy.move_time)
		
		get_tree().current_scene.emit_signal("froggy_move")
		froggy.light_array.remove(froggy.light_array.size() - 1)
		
		$"%AudioStreamPlayer".stream = tongue_move_sfx
		$"%AudioStreamPlayer".play()
		
		yield(new_tween,"finished")
		
		state_machine.transition_to("tongue_idle")
