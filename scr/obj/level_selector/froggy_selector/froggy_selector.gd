extends Sprite

func play_anim(is_right : bool):
	if is_right:
		$AnimationPlayer.play("move_right")
	else:
		$AnimationPlayer.play("move_left")

func get_in_hole():
	$AnimationPlayer.play("jump_in")
