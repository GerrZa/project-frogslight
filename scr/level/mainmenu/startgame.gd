extends ButtonClass

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")

func on_button_clicked():
	$AnimationPlayer.play("selected")
	
	yield($AnimationPlayer,"animation_finished")
	
	var changer_ins = changer.instance()
	$"%CanvasLayer".add_child(changer_ins)
	
	yield(changer_ins,"finish_transition")
	
	get_tree().change_scene("res://scr/level/in-gamelevel/level1.tscn")
	
