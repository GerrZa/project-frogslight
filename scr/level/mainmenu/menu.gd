extends Node2D

var scene_opener = preload("res://scr/ui/openup_level/openup_level.tscn")

func _ready():
	if Global.first_start == true:
		get_tree().root.set_disable_input(true)
		
		$AnimationPlayer.play("rising_intro")
		$"%AnimationPlayer".play("riseup")
		
		yield($"%AnimationPlayer","animation_finished")
		
		get_tree().root.set_disable_input(false)
		
		Global.first_start = false
	else:
		
		$AnimationPlayer.play("default_pos")
		$"%AnimationPlayer".play("default_pos")
		$"%CanvasLayer".add_child(scene_opener.instance())
