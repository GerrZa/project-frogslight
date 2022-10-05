extends Area2D

var left_neighbor = null
var right_neighbor = null

var level_indicator : int

func _ready():
	
	print($ray_left.get_collider()[0])
	
	left_neighbor = $ray_left.get_collider()
	right_neighbor = $ray_right.get_collider()
	
	var door_name_spilt = name.rsplit("_",true)
	
	$level_number.frame = int(door_name_spilt[2])
	
