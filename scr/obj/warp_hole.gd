tool
extends Area2D

var open_sfx = preload("res://asset/fx/sound_fx/obj_sfx/sfx_opendoor_v1.wav")
var close_sfx = preload("res://asset/fx/sound_fx/obj_sfx/sfx_closedoor_v1.wav")

export var target_hole = NodePath()
onready var target_pos = get_node(target_hole).global_position

var idle_hole_frame = [0,15,30]

export(int,0,2) var hole_type

func _process(delta):
	if $Sprite/AnimationPlayer.is_playing() == false:
		$Sprite.frame = idle_hole_frame[hole_type]

func get_target_pos():
	
	return target_pos

func jump_play_anim():
	
	play_anim()
	get_node(target_hole).play_anim()

func play_anim():
	$Sprite/AnimationPlayer.play("open_hole" + String(hole_type))

func play_sfx(sound : String):
	
	match sound:
		"open":
			$AudioStreamPlayer.stream = open_sfx
			$AudioStreamPlayer.play()
		"close":
			$AudioStreamPlayer.stream = close_sfx
			$AudioStreamPlayer.play()
	
