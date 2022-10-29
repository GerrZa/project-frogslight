extends ButtonClass

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")

func on_button_clicked():
	
	var changer_ins = changer.instance()
	
	owner.add_child(changer_ins)
	
	yield(changer_ins,"finish_transition")
	
	FlamePlayer.stop_play()
	
	get_tree().paused = false
	get_tree().reload_current_scene()
