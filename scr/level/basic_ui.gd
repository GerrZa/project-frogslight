extends Control

var current_light := 0

func _ready():
	get_tree().current_scene.connect("tongue",self,"tongue_icon")
	get_tree().current_scene.connect("froggy_eat",self,"appear_light_icon")
	get_tree().current_scene.connect("froggy_move",self,"decrease_icon")
	get_tree().current_scene.connect("light_replaced",self,"replace_light")
	
	appear_light_icon(false)

func tongue_icon(tongue_active):
	if tongue_active:
		$li_tongue/AnimationPlayer.play("open")
	else:
		$li_tongue/AnimationPlayer.play("close")

func appear_light_icon(is_extra_light):
	
	var added_index := 0
	
	if is_extra_light:
		for i in range(4):
			added_index = i + 1
			get_node("li_frame/li_icon" + String(current_light + i + 1) + "/AnimationPlayer").play("extra")
			
		current_light += added_index
	else:
		for i in range(3):
			if current_light < 3:
				print("add")
				current_light += 1
				get_node("li_frame/li_icon" + String(current_light) + "/AnimationPlayer").play("basic")
		
		current_light += added_index
	

func decrease_icon():
	
	get_node("li_frame/li_icon" + String(current_light) + "/AnimationPlayer").play("del")
	current_light -= 1
	

func replace_light():
	for i in range(3):
		get_node("li_frame/li_icon" + String(i+1_)).frame = 3

func _physics_process(delta):
	print(current_light)
