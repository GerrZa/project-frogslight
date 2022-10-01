extends Node2D

var screen_size = Vector2(ProjectSettings.get("display/window/size/width"),ProjectSettings.get("display/window/size/height"))

var firefly_particle = preload("res://scr/tool/fireflies_particle/fireflies/fly_particle.tscn")

var time_range = Vector2(2,4)

func _ready():
	
	spawn_start_amount()
	$Timer.start(rand_range(time_range.x,time_range.y))
	

func spawn_start_amount():
	
	var amount = rand_range(5,8)
	amount = round(amount)
	
	for i in range(amount):
		var particle = firefly_particle.instance()
		
		add_child(particle)
		particle.position = Vector2(rand_range(0,screen_size.x),rand_range(0,screen_size.y))
	

func _on_Timer_timeout():
	var particle = firefly_particle.instance()
	
	add_child(particle)
	particle.position = Vector2(rand_range(0,screen_size.x),rand_range(0,screen_size.y))
	
	$Timer.start(rand_range(time_range.x,time_range.y))
