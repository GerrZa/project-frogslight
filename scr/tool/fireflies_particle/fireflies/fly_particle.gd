extends Node2D

var direction = Vector2.ZERO
var speed

var speed_range = Vector2(1,3)
var time_range = Vector2(8,30)

func _ready():
	$Timer.connect("timeout",self,"queue_free")
	$Timer.start(rand_range(time_range.x,time_range.y))
	
	randomize()
	speed = rand_range(speed_range.x,speed_range.x)
	
	direction = Vector2(rand_range(-1,1),rand_range(-1,1))
	direction = direction.normalized()
	
	var type
	var type_list = [0,1]
	
	type_list.shuffle()
	type = type_list[0]
	
	match type:
		0:
			$normal.visible = true
			$extra.visible = false
		1:
			$normal.visible = false
			$extra.visible = true

func _physics_process(delta):
	global_position += direction * speed * delta
