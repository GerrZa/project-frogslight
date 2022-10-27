extends Area2D

var left_neighbor = null
var right_neighbor = null

var selector = null

var level_status_ui_frame = 0

var open_sfx = preload("res://asset/fx/sound_fx/obj_sfx/sfx_opendoor_v1.wav")
var close_sfx = preload("res://asset/fx/sound_fx/obj_sfx/sfx_closedoor_v1.wav")

var locked_sfx = preload("res://asset/fx/sound_fx/menu_sfx/sfx_not_unlocked.wav")

func _process(delta):
	
	if$right_ray.is_colliding():
		right_neighbor = $right_ray.get_collider()
	else: right_neighbor = null
	if$left_ray.is_colliding():
		left_neighbor = $left_ray.get_collider()
	else: left_neighbor = null
	
	var splited_name = name.rsplit("_",true)
	var level_number = int(splited_name[2])
	
	$number_indicator.frame = level_number
	
	match Global.level_unlocked[level_number]:
		0:
			$status_icon.visible = true
			$trapdoor_sprite.modulate = Color(0.2,0.2,0.2,1)
			level_status_ui_frame = 1
		1:
			$status_icon.visible = false
			$trapdoor_sprite.modulate = Color(1,1,1,1)
			level_status_ui_frame = 0
	

func choose_level():
	
	var splited_name = name.rsplit("_",true)
	var level_number = int(splited_name[2])
	
	if Global.level_unlocked[level_number] == 1:
		get_tree().current_scene.play_anim(level_number)
		$trapdoor_sprite/AnimationPlayer.play("activate_hole")
		selector.get_in_hole()
		$number_indicator/AnimationPlayer.play("selected")
		get_tree().root.set_disable_input(false)
	else:
		$AudioStreamPlayer.stream = locked_sfx
		$AudioStreamPlayer.play()

func play_sfx(sound_name : String):
	
	match sound_name:
		"open":
			$AudioStreamPlayer.stream = open_sfx
			$AudioStreamPlayer.play()
		"close":
			$AudioStreamPlayer.stream = close_sfx
			$AudioStreamPlayer.play()
	
