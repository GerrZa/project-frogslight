class_name Level
extends Node2D

var froggy_tex = preload("res://asset/actor/froggy/spr_froggy_v1.png")
export var froggy_spr_hframe : float

var gameover_spr_f : SpriteFrames = preload("res://scr/ui/gameover/gameover_spr_frame.tres")
var nolight_mat = preload("res://scr/ui/nolight_fx.tres")

var flame = preload("res://scr/obj/fire.tscn")
export var flame_exist : bool = false
var flame_start_pos = Vector2(279,192)
var flame_spawned = false

signal tongue(is_active)
signal froggy_eat(is_extra)
signal froggy_move
signal light_replaced(index)

signal test_froggy_move

func _ready():
	connect("froggy_move",self,"on_froggy_move")

func normal_gameover(frog_global_pos,frog_offset):
	
	for node in get_tree().current_scene.get_children():
		if node.name != "colorrect_zindex" and node.get_class() != "CanvasModulate" :
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
	
	var canvas_modulate = CanvasModulate.new()
	

func burned_gameover():
	
	yield(get_tree().create_timer(2.75),"timeout")
	
	for node in get_children():
		node.queue_free() 
	
	

func on_froggy_move():
	if flame_exist == true and flame_spawned == false:
		
		flame_spawned = true
		
		var flame_ins = flame.instance()
		
		add_child(flame_ins)
		flame_ins.global_position = flame_start_pos
		flame_ins.start_flame_tween()
		
		print("flame_added")






