class_name Froggy
extends Area2D

# Always make Froggy unique % in the scene

export var move_time : float

export var max_basic_light : int

var basic_light_left = 0
var extra_light_left = 0

var total_light
var last_total_light

var light_sb_size # light texture standby size
signal light_change(target_size)

var light_array := [false,false,false] # For checking light type and ui animation

export var basic_light_color : Color
export var extra_light_color : Color

onready var animtree = $froggy_spr/AnimationTree.get("parameters/playback")

func _ready():
	basic_light_left = max_basic_light
	
	last_total_light = total_light
	
	self.connect("light_change",self,"on_light_change")

func _physics_process(delta):
	
	total_light = basic_light_left + extra_light_left
	
	var tongue_match = $"%tongue_tip".global_position == global_position
	$"%tongue_tip".visible = not tongue_match
	
	$tongue_line.set_point_position(0,$"%tongue_tip".position + Vector2(8,8))
	
	if last_total_light != total_light:
		if total_light > 0:
			emit_signal("light_change",(total_light * 0.06) + 0.06)
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
		extra_light_left += 4
		for light in range(4):
			light_array.append(true)
		
		get_tree().current_scene.emit_signal("froggy_eat",true)
		
	elif extra_light == false:
		for i in range(3):
			
			if basic_light_left < 3:
				pass
		
		get_tree().current_scene.emit_signal("froggy_eat",false)

func on_light_change(target_size):
	if target_size > 0:
		$Light2D.enabled = true
		
		var tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($Light2D,"texture_scale",target_size,0.15)
	else:
		var tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($Light2D,"texture_scale",0.01,0.15)
		
		yield(get_tree().create_timer(0.13),"timeout")
		
		$Light2D.enabled = false
	
