extends ButtonIndicator

func _ready():
	get_tree().paused = true
	
	for node in $menu.get_children():
		node.controller = self
	
	for node in $option.get_children():
		node.controller = self
