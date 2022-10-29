extends CanvasLayer

func _ready():
	
	get_tree().root.set_disable_input(true)
	
	
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().reload_current_scene()
