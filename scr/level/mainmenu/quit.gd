extends ButtonClass

func on_button_clicked():
	$AnimationPlayer.play("selected")
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().quit()
