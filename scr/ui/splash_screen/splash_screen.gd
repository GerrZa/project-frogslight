extends Node2D

func _ready():
	$trizg_logo.visible = false
	
	yield(get_tree().create_timer(0.3),"timeout")
	
	$trizg_logo.visible = true
	$AnimationPlayer.play("riseup_trizg")
	
	yield($AnimationPlayer,"animation_finished")
	
	$trizg_logo.frame = 0
	$trizg_logo.play("default")
	
	yield($trizg_logo,"animation_finished")
	
	$AnimationPlayer.play("default")
	
	yield($AnimationPlayer,"animation_finished")
	
	$trizg_logo/godot_logo.frame = 0
	$trizg_logo/godot_logo.play("default")
	
	yield($trizg_logo/godot_logo,"animation_finished")
	
	$AnimationPlayer.play("wipe_godot_out")
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")

func _input(event):
	if event.is_action_pressed("skip_splash"):
		get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")
	
