extends ButtonClass

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")

func on_button_clicked():
	get_tree().root.set_disable_input(true)
	
	var changer_ins = changer.instance()
	
	owner.add_child(changer_ins)
	
	yield(changer_ins,"finish_transition")
	
	FlamePlayer.stop_play()
	
	owner.set_band_db(false)
	
	get_tree().paused = false
	get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")
