extends Node2D

signal finish_transition

func _ready():
	
	$AnimationPlayer.play("startup")
	
	yield($AnimationPlayer,"animation_finished")
	
	emit_signal("finish_transition")
