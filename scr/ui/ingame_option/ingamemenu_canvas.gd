extends CanvasLayer



func _ready():
	get_tree().current_scene.is_paused = true
	
	get_tree().paused = true
