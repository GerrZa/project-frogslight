extends FroggyState


func enter(msg := {}):
	get_tree().current_scene.burned_gameover()
