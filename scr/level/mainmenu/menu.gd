extends Node2D

var scene_opener = preload("res://scr/ui/openup_level/openup_level.tscn")
var hold_r_time = 0.0

func _ready():
	Saveload.connect("restore_default",self,"on_restore_def")
	
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

func _process(delta):
	
	if Input.is_key_pressed(82):
		hold_r_time += delta
	else:
		hold_r_time = 0
	
	if hold_r_time >= 2:
		Saveload.default_save()
		
		hold_r_time = 0

func on_restore_def():
	$CanvasLayer/label_zindex/AnimationPlayer.play("restored")
