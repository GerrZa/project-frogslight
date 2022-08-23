extends FroggyState

var move_direction = Vector2.ZERO
func enter(msg:={}):
	
	if msg.has("direction"):
		move_direction = msg["direction"]
		
		var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		new_tween.tween_property(froggy)
