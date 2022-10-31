extends Node2D

var hovering_level = null

var tween_time = 0.2
var enable_unhandled = false

signal change_hovering

func _ready():
	connect("change_hovering",self,"on_hovering_change")
	
	get_tree().root.set_disable_input(false)
	
	hovering_level = $levelselector_bg/trapdoor/trapdoor_level_0
	
	for node in $levelselector_bg/trapdoor.get_children():
		node.selector = $levelselector_bg/selector_root

func _process(delta):
	$CanvasLayer/levelselector_border/level_status_ui.frame = hovering_level.level_status_ui_frame

func custom_unhandled_input(event):
	
	if $Timer.is_stopped():
		if Input.is_action_just_pressed("ui_right") and hovering_level.right_neighbor != null:
			hovering_level = hovering_level.right_neighbor
			tween_selector()
			$levelselector_bg/selector_root.play_anim(true)
			$AudioStreamPlayer.play()
		elif Input.is_action_just_pressed("ui_left") and hovering_level.left_neighbor != null:
			hovering_level = hovering_level.left_neighbor
			tween_selector()
			$levelselector_bg/selector_root.play_anim(false)
			$AudioStreamPlayer.play()
	
	if Input.is_action_just_pressed("ui_tongue"):
		hovering_level.choose_level()
		get_tree().root.set_disable_input(true)

func tween_selector():
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property($levelselector_bg/selector_root,"global_position",hovering_level.global_position,tween_time)
	
	$Timer.start(tween_time)

func on_hovering_change():
	pass
