extends CanvasLayer

var credit_scene = preload("res://scr/ui/credit_name/credit_scene.tscn")

func _ready():
	
	get_tree().root.set_disable_input(true)
	
	for node in get_children():
		if node is AnimatedSprite:
			node.playing = true
	
	yield($AnimationPlayer,"animation_finished")
	if Global.current_level == 23:
		get_tree().change_scene_to(credit_scene)
	else:
		get_tree().change_scene("res://scr/level/in-gamelevel/level" + String(Global.current_level + 1) + ".tscn")

func stop_flame_sfx():
	FlamePlayer.stop_play()
