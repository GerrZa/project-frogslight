extends ButtonClass

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")

func on_button_clicked():
	
	FlamePlayer.stop_play()
	
	var changer_ins = changer.instance()
	
	controller.add_child(changer_ins)
	
	yield(changer_ins,"finish_transition")
	
	get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")
