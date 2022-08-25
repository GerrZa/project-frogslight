class_name Froggy
extends Area2D

export var move_time : float

export var max_basic_light : int
export var max_extra_light : int

var basic_light_left = 0
var extra_light_left = 0

func _ready():
	basic_light_left = max_basic_light

func _physics_process(delta):
	print($fsm.state.name)
	
	$Label.text = String(basic_light_left + extra_light_left)
	
	var tongue_match = $"%tongue_tip".global_position == global_position
	
	$"%tongue_tip".visible = not tongue_match
	
	$tongue_line.set_point_position(1,$"%tongue_tip".position + Vector2(8,8))
	
	
