class_name Froggy
extends Area2D

# Always make Froggy unique % in the scene

export var move_time : float

export var start_light : int

var total_light : int
var last_total_light

var light_sb_size # light texture standby size
signal light_change(target_size)
var light_target_size

var light_array := [] # For checking light type and ui animation

export var basic_light_color : Color
export var extra_light_color : Color

onready var fsm = null

onready var animtree = $froggy_spr/AnimationTree.get("parameters/playback")

onready var burn_zone = !$"%burn_zone".get_overlapping_areas().empty()

func _ready():
	
	fsm = $fsm
	
	for i in range(start_light):
		if i < 3 :light_array.append(false)
		else: light_array.append(true)
	
	total_light = start_light
	
	self.connect("light_change",self,"on_light_change")

func _physics_process(delta):
	
	print($fsm.state)
	
	var tongue_match = $"%tongue_tip".global_position == global_position
	$"%tongue_tip".visible = not tongue_match
	
	$tongue_line.set_point_position(0,$"%tongue_tip".position + Vector2(8,8))
	
	if last_total_light != total_light:
		if total_light > 0:
			emit_signal("light_change",(clamp(total_light,0,6) * 0.06) + 0.06)
		elif total_light == 0:
			emit_signal("light_change",0)
		last_total_light = total_light
	
	if light_array.size() - 1 >= 0:
		if light_array[light_array.size() - 1] == false:
			$Light2D.color = basic_light_color
		else:
			$Light2D.color = extra_light_color

func add_light(extra_light:bool):
	
	if extra_light == true:
		for i in range(4):
			if total_light < 6:
				total_light += 1
				light_array.append(true)
		
		get_tree().current_scene.emit_signal("froggy_eat",true)
		
	elif extra_light == false:
		
		if range(light_array.size()).has(0):
			if light_array[0] == true:
				get_tree().current_scene.emit_signal("light_replaced",1)
		if range(light_array.size()).has(1):
			if light_array[1] == true:
				get_tree().current_scene.emit_signal("light_replaced",2)
		if range(light_array.size()).has(2):
			if light_array[2] == true:
				get_tree().current_scene.emit_signal("light_replaced",3)
		
		for i in range(3):
			
			if total_light < 3:
				light_array.append(false)
				total_light += 1
		
		for i in range(3):
			if light_array.size() - 1 >= i:
				light_array[i] = false
			else:
				light_array.append(false)
		
		
		get_tree().current_scene.emit_signal("froggy_eat",false)

func on_light_change(target_size):
	light_target_size = target_size
	if target_size > 0:
		$Light2D.enabled = true
		
		var tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($"%Light2D","texture_scale",light_target_size,0.15)
		
	else:
		var tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($Light2D,"texture_scale",0.01,0.15)
		
		yield(tween,"finished")
		
		$Light2D.enabled = false
	
