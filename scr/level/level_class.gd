class_name Level
extends Node2D

var level_opener = preload("res://scr/ui/openup_level/openup_level.tscn")

var froggy_tex = preload("res://asset/actor/froggy/spr_froggy_v1.png")
export var froggy_spr_hframe : int = 40

var gameover_spr_f : SpriteFrames = preload("res://scr/ui/gameover/gameover_spr_frame.tres")
var nolight_mat = preload("res://scr/ui/nolight_fx.tres")
var normal_gameover_sfx = preload("res://asset/fx/sound_fx/sfx_gameover_v1.wav")

var burned_spr_f : SpriteFrames = preload("res://scr/ui/gameover/burned_gameover_spr_frame.tres")

var flame = preload("res://scr/obj/fire.tscn")
export var flame_exist : bool = false
var flame_start_pos = Vector2(279,192)
var flame_spawned = false

var overlay_menu = preload("res://scr/ui/gameover/gameover_overlay_menu/gameover_overlay_menu.tscn")

var winning = false #is winning animation playing
var win_overlay = preload("res://scr/ui/win_overlay/win_overlay.tscn")

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


func _process(delta):
	if get_node_or_null("fireflies_grouper") != null:
		if get_node("fireflies_grouper").get_children().empty() and winning == false:
			win()

func normal_gameover(frog_global_pos,frog_offset):
	
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
	ap.volume_db = -3.45
	ap.bus = "Sfx"
	ap.stream = normal_gameover_sfx
	ap.play()
	
	yield(get_tree().create_timer(0.8),"timeout")
	
	var canvas_layer = CanvasLayer.new()
	var overlay_ins = overlay_menu.instance()
	
	add_child(canvas_layer)
	canvas_layer.add_child(overlay_ins)
	
	

func burned_gameover():
	
	yield(get_tree().create_timer(1),"timeout")
	
	for node in get_children():
		node.queue_free() 
	
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
	
	add_child(win_overlay_ins)
	
	Global.level_unlocked[level_number]



