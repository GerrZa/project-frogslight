extends Area2D

var fire = load("res://scr/obj/fire.tscn")

func _ready():
	
	get_tree().current_scene.connect("froggy_move",self,"on_froggy_move")
	
	$Sprite.playing = true

func tween_move(is_up : bool):
	
	if is_up:
		var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		new_tween.tween_property(self,"global_position",self.global_position + Vector2(0,-16),0.2)
	else:
		var new_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		new_tween.tween_property(self,"global_position",self.global_position + Vector2(-16,0),0.2)

func on_froggy_move():
	
	if $wall_check_left.is_colliding() == false and $fire_check_left.is_colliding() == false:
		var fire1 = fire.instance()
		add_child(fire1)
		fire1.global_position = self.global_position
		fire1.tween_move(false)

	if (($wall_check_right.is_colliding() and $wall_check_up.is_colliding() == false
		and $fire_check_up.is_colliding() == false) or $wall_check_left.is_colliding()):
			var fire2 = fire.instance()
			add_child(fire2)
			fire2.global_position = self.global_position
			fire2.tween_move(true)
			
			print(($wall_check_right.is_colliding() and $wall_check_up.is_colliding() == false
				and $fire_check_up.is_colliding() == false))
			print($wall_check_left.is_colliding())
			print(".")
			print($wall_check_left.is_colliding() == false and $fire_check_left.is_colliding() == false)
