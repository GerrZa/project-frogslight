extends ButtonClass

func on_button_clicked():
	$AnimationPlayer.play("selected")
	controller.get_node("click_asp").play()
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().quit()
