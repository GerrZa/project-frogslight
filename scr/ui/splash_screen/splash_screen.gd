extends Node2D

var menu = preload("res://scr/level/mainmenu/menu.tscn")

var long_whoosh_sfx = preload("res://asset/fx/sound_fx/menu_sfx/sfx_longwhoosh_v1.wav")
var short_whoosh_sfx = preload("res://asset/fx/sound_fx/menu_sfx/sfx_shortwhoosh_v1.wav")

signal start

func _ready():
	$audio_controller.play("start")
	
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
	
	get_tree().change_scene_to(menu)

func _input(event):
	if event.is_action_pressed("skip_splash"):
		play_whoosh(false)
		get_tree().change_scene_to(menu)
	if event.is_action_pressed("ui_tongue"):
		emit_signal("start")
	

func play_whoosh(long_whoosh : bool):
	
	match long_whoosh:
		true:
			GlobalSfx.play_sfx(long_whoosh_sfx)
		false:
			GlobalSfx.play_sfx(short_whoosh_sfx)
	
