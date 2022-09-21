extends Button

var previous_focus = false # last state of is focus (true/false)

func _process(delta):
	
	print(has_focus())
	print("...")
	
	if has_focus() == true and previous_focus == false:
		tween_button(false)
		previous_focus = true
	elif has_focus() == false and previous_focus == true:
		tween_button(true)
		previous_focus = false

func tween_button(tween_back : bool):
	var sprite = get_node("button_pos_achor/button_sprite")
	var anchor = get_node("button_pos_achor")
	
	if tween_back:
		var rotate_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		var position_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		rotate_tween.tween_property(sprite,"rotation_degrees",-6,0.35)
		position_tween.tween_property(anchor,"position",anchor.position + Vector2(0,-3),0.35)
	else:
		var rotate_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		var position_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		rotate_tween.tween_property(sprite,"rotation_degrees",0,0.35)
		position_tween.tween_property(anchor,"position",anchor.position + Vector2(0,3),0.35)
	
