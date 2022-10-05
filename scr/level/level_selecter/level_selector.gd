extends Node2D

var hovering_level = null

var tween_time = 0.3

func _ready():
	hovering_level = $level_trapdoor/door_level_0

func _unhandled_input(event):
	
	if $Timer.is_stopped():
		if Input.is_action_just_pressed("ui_right") and hovering_level.right_neighbor != null:
			hovering_level = hovering_level.right_neighbor
			tween_selector(Vector2(0,32))
			$selector.play_anim(true)
		elif Input.is_action_just_pressed("ui_left") and hovering_level.left_neighbor != null:
			hovering_level = hovering_level.left_neighbor
			tween_selector(Vector2(0,-32))
			$selector.play_anim(false)

func tween_selector(additional_position : Vector2):
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property($selector,"global_position",$selector.global_position + additional_position,tween_time)
	
	$Timer.start(tween_time)
