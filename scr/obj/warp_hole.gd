extends Area2D

export var target_hole = NodePath()
onready var target_pos = get_node(target_hole).global_position

func get_target_pos():
	
	return target_pos

func jump_play_anim():
	
	play_anim()
	get_node(target_hole).play_anim()

func play_anim():
	$Sprite/AnimationPlayer.play("activate")
