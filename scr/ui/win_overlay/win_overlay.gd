extends CanvasLayer

func _ready():
	
	get_tree().root.set_disable_input(true)
	
	for node in get_children():
		if node is AnimatedSprite:
			node.playing = true
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().change_scene("res://scr/level/in-gamelevel/level" + String(Global.current_level + 1) + ".tscn")
