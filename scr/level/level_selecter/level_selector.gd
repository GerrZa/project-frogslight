extends Node2D

var base_level_preloader = "res://scr/level/in-gamelevel/level"

func play_anim(to_change_level):
	$AnimationPlayer.play("circle_close")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(base_level_preloader + String(to_change_level) + ".tscn")

func _unhandled_input(event):
	$actual_level/selector_root.custom_unhandled_input(event)