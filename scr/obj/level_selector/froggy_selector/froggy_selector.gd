extends Node2D

func play_anim(is_right : bool):
	if is_right:
		$selector/AnimationPlayer.play("#move_left")
	else:
		$selector/AnimationPlayer.play("#move_left")
	

func get_in_hole():
	$selector/AnimationPlayer.play("jump_in")
