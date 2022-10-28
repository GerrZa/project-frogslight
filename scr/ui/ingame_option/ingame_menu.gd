extends ButtonIndicator

var clicked_sfx = preload("res://asset/fx/sound_fx/menu_sfx/ingame/sfx_ingameclicked_v3.wav")

func _ready():
	connect("button_clicked",self,"on_button_clicked")
	connect("button_change",self,"on_button_changed")
	
	set_process_unhandled_input(false)
	
	get_tree().paused = true
	
	for node in $menu.get_children():
		node.controller = self
	
	for node in $option.get_children():
		node.controller = self
	
	yield(get_tree().create_timer(0,01),"timeout")
	
	set_process_unhandled_input(true)

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_esc"):
		
		get_tree().paused = false
		
		owner.set_band_db(false)
		
		yield(get_tree().create_timer(0.0001),"timeout")
		
		
		get_tree().current_scene.is_paused = false
		owner.queue_free()

func on_button_clicked():
	GlobalSfx.play_sfx(clicked_sfx)

func on_button_changed():
	$AudioStreamPlayer.play()
