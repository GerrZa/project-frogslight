extends Node2D

var stopping_thanks = false
var is_stopped = false

var menu_scene = preload("res://scr/level/mainmenu/menu.tscn")

func _ready():
	Global.first_start = true
	
	get_tree().root.set_disable_input(false)

func _process(delta):
	
	if stopping_thanks == false:
		$text_holder.position.y -= 50 * delta
	
	if $text_holder.position.y <= -122 and is_stopped == false:
		stopping_thanks = true
		
		yield(get_tree().create_timer(2),"timeout")
		
		stopping_thanks = false
		is_stopped = true
		
func _input(event):
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().change_scene_to(menu_scene)

func _on_VisibilityNotifier2D_screen_entered():
	get_tree().change_scene_to(menu_scene)
