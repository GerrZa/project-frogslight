extends Area2D

var fire = load("res://scr/obj/fire.tscn")

func _ready():
	
	get_tree().current_scene.connect("froggy_move",self,"on_froggy_move")
	
	$flame_anchor/Sprite.playing = true

func tween_move(is_up : bool):
	
	if is_up:
		var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		new_tween.tween_property(self,"global_position",self.global_position + Vector2(0,-16),0.2)
	else:
		var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		new_tween.tween_property(self,"global_position",self.global_position + Vector2(-16,0),0.2)

func on_froggy_move():
	
	#Spawn fire left
	if $wall_check_left.is_colliding() == false and $fire_check_left.is_colliding() == false:
		var fire1 = fire.instance()
		add_child(fire1)
		fire1.global_position = self.global_position
		fire1.tween_move(false)
	
	#Spawn fire up
	if (($wall_check_right.is_colliding() == true and $wall_check_up.is_colliding() == false
		and $fire_check_up.is_colliding() == false)):
			var fire2 = fire.instance()
			add_child(fire2)
			fire2.global_position = self.global_position
			fire2.tween_move(true)
	

func start_flame_tween():
	
	$flame_anchor.scale = Vector2.ZERO
	
	var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	new_tween.tween_property($flame_anchor,"scale",Vector2(1,1),0.2)
	
	FlamePlayer.start_play()
	
	$Light2D/AnimationPlayer.play("start")
	yield($Light2D/AnimationPlayer,"animation_finished")
	$Light2D/AnimationPlayer.play("normal")
	
