class_name Froggy
extends Area2D

export var move_time : float

export var max_basic_light : int
export var max_extra_light : int

var basic_light_left = max_basic_light
var extra_light_left = 0

func _physics_process(delta):
	$Label.text = String(basic_light_left + extra_light_left)
