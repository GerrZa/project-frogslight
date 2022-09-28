tool
extends Area2D

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
	
	yield($Sprite/AnimationPlayer,"animation_finished")
	
	$CollisionShape2D.disabled = true


func _on_warp_hole_area_exited(area):
	if area is Froggy:
		
		$CollisionShape2D.disabled = false
