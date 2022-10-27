extends ButtonClass

func on_button_clicked():
	$AnimationPlayer.play("selected")
	controller.get_node("click_asp").play()
	
	get_tree().root.set_disable_input(true)
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().quit()
