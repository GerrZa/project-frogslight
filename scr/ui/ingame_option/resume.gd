extends ButtonClass


func on_button_clicked():
	get_tree().paused = false
	
	yield(get_tree().create_timer(0.0001),"timeout")
	
	get_tree().current_scene.is_paused = false
	owner.queue_free()
