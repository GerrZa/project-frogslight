extends ButtonClass

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")
var credit_scene = preload("res://scr/ui/credit_name/menu_credit.tscn")

func on_button_clicked():
	$AnimationPlayer.play("selected")
	controller.get_node("click_asp").play()
	
	get_tree().root.set_disable_input(true)
	
	yield($AnimationPlayer,"animation_finished")
	
	var changer_ins = changer.instance()
	$"%CanvasLayer".add_child(changer_ins)
	
	yield(changer_ins,"finish_transition")
	
	get_tree().change_scene_to(credit_scene)
	
