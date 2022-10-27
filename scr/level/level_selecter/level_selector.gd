extends Node2D

var base_level_preloader = "res://scr/level/in-gamelevel/level"

var menu = load("res://scr/level/mainmenu/menu.tscn")

func _ready():
	get_tree().root.set_disable_input(true)
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().root.set_disable_input(false)

func play_anim(to_change_level):
	$AnimationPlayer.play("circle_close")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(base_level_preloader + String(to_change_level) + ".tscn")

func _unhandled_input(event):
	$actual_level/selector_root.custom_unhandled_input(event)
	
	if Input.is_action_just_pressed("ui_esc"):
		$AnimationPlayer.play("close")
		
		yield($AnimationPlayer,"animation_finished")
		
		get_tree().change_scene_to(menu)
