extends ButtonIndicator

func _ready():
	
	indicator_tween_time = 0.05
	
	yield($"%eyereveal_anim","animation_finished")
	
	get_tree().root.set_disable_input(false)
	
	selector = get_node(indicator_nodepath)
	button = get_node(start_button)


