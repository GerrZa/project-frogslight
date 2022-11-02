class_name Level
extends Node2D

var level_opener = preload("res://scr/ui/openup_level/openup_level.tscn")

var froggy_tex = preload("res://asset/actor/froggy/spr_froggy_v1.png")
export var froggy_spr_hframe : int = 40

var gameover_spr_f : SpriteFrames = preload("res://scr/ui/gameover/gameover_spr_frame.tres")
var nolight_mat = preload("res://scr/ui/nolight_fx.tres")
var normal_gameover_sfx = preload("res://asset/fx/sound_fx/gameover/sfx_gameover_v2.wav")

var burned_spr_f : SpriteFrames = preload("res://scr/ui/gameover/burned_gameover_spr_frame.tres")
var burned_sfx = preload("res://asset/fx/sound_fx/gameover/sfx_gameover_microwave.wav")
var burned_riser = preload("res://asset/fx/sound_fx/gameover/sfx_burned_riser_v1.wav")

var flame = preload("res://scr/obj/fire.tscn")
export var flame_exist : bool = false
var flame_start_pos = Vector2(279,192)
var flame_spawned = false

var overlay_menu = preload("res://scr/ui/gameover/gameover_overlay_menu/gameover_overlay_menu.tscn")

var winning = false #is winning animation playing
var win_overlay = preload("res://scr/ui/win_overlay/win_overlay.tscn")
var win_sfx = preload("res://asset/fx/sound_fx/win/win_sfx.wav")

var ingame_menu = preload("res://scr/ui/ingame_option/ingame_option.tscn")
var is_paused = false

var changer = preload("res://scr/tool/scene_changer/scene_changer.tscn")

signal tongue(is_active)
signal froggy_eat(is_extra)
signal froggy_move
signal light_replaced(index)

signal test_froggy_move

export var level_number : int

func _ready():
	connect("froggy_move",self,"on_froggy_move")
	
	Global.current_level = level_number
	
	add_child(level_opener.instance())
	
	Global.level_unlocked[level_number] = 1
	Saveload.save_game()
	
	GlobalMusic.resume_music()

func _input(event):
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().current_scene.add_child(ingame_menu.instance())
	
	if Input.is_action_just_pressed("ui_retry"):
		
		var changer_ins = changer.instance()
		
		var ui_layer = get_node_or_null("CanvasLayer")
		
		if ui_layer != null:
			ui_layer.add_child(changer_ins)
		
		yield(changer_ins,"finish_transition")
		
		FlamePlayer.stop_play()
		
		get_tree().reload_current_scene()

	

func _process(delta):
	if get_node_or_null("fireflies_grouper") != null and $"%froggy".burn_zone == false:
		if get_node("fireflies_grouper").get_children().empty() and winning == false:
			win()

func normal_gameover(frog_global_pos,frog_offset):
	
	GlobalMusic.pause_music()
	
	FlamePlayer.stop_play()
	
	for node in get_tree().current_scene.get_children():
		if node.name != "gameover_bg_zindex" and node.get_class() != "CanvasModulate" :
			node.queue_free()
	
	var frog_spr = Sprite.new()
	
	add_child(frog_spr)
	frog_spr.centered = false
	frog_spr.offset = frog_offset
	frog_spr.global_position = frog_global_pos
	frog_spr.texture = froggy_tex
	frog_spr.hframes = froggy_spr_hframe
	frog_spr.frame = 0
	frog_spr.z_index = 100
	
	var gameover_sprite = AnimatedSprite.new()
	
	add_child(gameover_sprite)
	gameover_sprite.global_position = Vector2.ZERO
	gameover_sprite.frames = gameover_spr_f
	gameover_sprite.centered = false
	gameover_sprite.playing = true
	gameover_sprite.z_index = 50
	gameover_sprite.material = nolight_mat
	
	var ap = AudioStreamPlayer.new()
	add_child(ap)
	ap.volume_db = -5.45
	ap.bus = "Sfx"
	ap.stream = normal_gameover_sfx
	ap.play()
	
	yield(get_tree().create_timer(0.8),"timeout")
	
	var canvas_layer = CanvasLayer.new()
	var overlay_ins = overlay_menu.instance()
	
	add_child(canvas_layer)
	canvas_layer.add_child(overlay_ins)
	
	

func burned_gameover():
	
	GlobalMusic.pause_music()
	
	var win_overlay = get_node_or_null("win_overlay")
	if win_overlay != null:
		win_overlay.queue_free()
	
	
	var ap = AudioStreamPlayer.new()
	add_child(ap)
	ap.volume_db = -1.45
	ap.bus = "Sfx"
	ap.stream = burned_riser
	ap.play()
	
	
	yield(get_tree().create_timer(1),"timeout")
	
	for node in get_children():
		node.queue_free() 
	
	var burned_ap = AudioStreamPlayer.new()
	add_child(burned_ap)
	burned_ap.volume_db = -1.45
	burned_ap.bus = "Sfx"
	burned_ap.stream = burned_sfx
	burned_ap.play()
	
	var gameover_sprite = AnimatedSprite.new()
	
	add_child(gameover_sprite)
	gameover_sprite.global_position = Vector2.ZERO
	gameover_sprite.frames = burned_spr_f
	gameover_sprite.centered = false
	gameover_sprite.playing = true
	gameover_sprite.z_index = 50
	
	yield(get_tree().create_timer(0.8),"timeout")
	
	var canvas_layer = CanvasLayer.new()
	var overlay_ins = overlay_menu.instance()
	
	add_child(canvas_layer)
	canvas_layer.add_child(overlay_ins)
	

func on_froggy_move():
	if flame_exist == true and flame_spawned == false:
		
		flame_spawned = true
		
		var flame_ins = flame.instance()
		
		add_child(flame_ins)
		flame_ins.global_position = flame_start_pos
		flame_ins.start_flame_tween()
		

func win():
	
	winning = true
	
	var win_overlay_ins = win_overlay.instance()
	GlobalSfx.play_sfx(win_sfx)
	
	add_child(win_overlay_ins)



