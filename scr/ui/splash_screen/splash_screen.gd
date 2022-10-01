extends Node2D

func _ready():
	$trizg_logo.visible = false
	
	yield(get_tree().create_timer(0.5),"timeout")
	
	$trizg_logo.visible = true
	$trizg_logo.frame = 0
	$trizg_logo.playing = true
	
	yield(get_tree().create_timer(4.1),"timeout")
	
	$AnimationPlayer.play("default")
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")

func _input(event):
	if event.is_action_pressed("skip_splash"):
		get_tree().change_scene("res://scr/level/mainmenu/menu.tscn")
	
