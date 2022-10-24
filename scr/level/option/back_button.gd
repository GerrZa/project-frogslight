#Back button
extends ButtonClass

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")

func _init():
	visible = false

func _ready():
	
	yield($"%eyereveal_anim","animation_finished")
	
	visible = true

func on_button_clicked():
	Saveload.save_game()
	
	var changer_ins = changer.instance()
	$"%CanvasLayer".add_child(changer_ins)
	
	yield(changer_ins,"finish_transition")
	
	get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")
	

func _process(delta):
	if controller.button == self:
		controller.selector.animation = "back_arrow"
		controller.selector.offset = Vector2.ZERO
		playing = true
	else:
		controller.selector.animation = "default"
		controller.selector.offset = Vector2(-3,-3)
		playing = false
		frame = 0
