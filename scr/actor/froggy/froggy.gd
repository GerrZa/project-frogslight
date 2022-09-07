class_name Froggy
extends Area2D

export var move_time : float

export var max_basic_light : int
export var max_extra_light : int

var basic_light_left = 0
var extra_light_left = 0

onready var animtree = $froggy_spr/AnimationTree.get("parameters/playback")

func _ready():
	basic_light_left = max_basic_light

func _physics_process(delta):
	print($fsm.state.name)
	
	$Label.text = String(basic_light_left + extra_light_left)
	
	var tongue_match = $"%tongue_tip".global_position == global_position
	
	$"%tongue_tip".visible = not tongue_match
	
	$tongue_line.set_point_position(0,$"%tongue_tip".position + Vector2(8,8))
	
	if basic_light_left + extra_light_left > 1:
		$froggy_spr/Light2D.texture_scale = 0.1 + (((basic_light_left + extra_light_left)-1) * 0.1)
	elif basic_light_left + extra_light_left == 1:
		$froggy_spr/Light2D.texture_scale = 0.1
	else:
		$froggy_spr/Light2D.texture_scale = 0

func add_light(extra_light:bool):
	
	if extra_light:
		extra_light_left += 4
	elif extra_light == false:
		basic_light_left += 3
