extends Node2D

signal finish_transition

func _ready():
	
	get_tree().root.set_disable_input(true)
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().root.set_disable_input(false)
	emit_signal("finish_transition")
