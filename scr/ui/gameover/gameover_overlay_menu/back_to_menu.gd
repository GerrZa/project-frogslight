extends ButtonClass

var reloader = preload("res://scr/ui/gameover/gameover_changer.tscn")

func on_button_clicked():
	get_tree().change_scene("")
