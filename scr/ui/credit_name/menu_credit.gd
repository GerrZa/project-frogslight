extends Node2D

var menu = load("res://scr/level/mainmenu/menu.tscn")

func _input(event):
	if Input.is_action_just_pressed("ui_esc"):
		quit_menu()

func quit_menu():
	get_tree().change_scene_to(menu)
