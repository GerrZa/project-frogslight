extends Node

var current_level = 0

var fullscreen_cd = 0.3
var can_fullscreen = true

var level_unlocked = [ #current level count : 24
	1,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
]

var default_level_unlocked  = [ #current level count : 24
	1,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
]

var setting = {
	"fullscreen" : false,
	"sfx" : true,
	"music" : true
	}

var first_start = true

func _ready():
	Saveload.load_game()
	
	pause_mode = PAUSE_MODE_PROCESS

func _process(delta):
	AudioServer.set_bus_mute(2,!setting["sfx"])
	AudioServer.set_bus_mute(1,!setting["music"])
	
	
	if Input.is_action_pressed("ui_fullscreen") and can_fullscreen:
		
		OS.window_fullscreen = !OS.window_fullscreen
		OS.window_borderless = !OS.window_borderless
		
		if OS.window_fullscreen == false:
			OS.window_size = Vector2(1194,672)
		
		
		can_fullscreen = false
		
		yield(get_tree().create_timer(fullscreen_cd),"timeout")
		
		can_fullscreen = true
	
	print(ProjectSettings.get("display/window/size/width"))
	print(ProjectSettings.get("display/window/size/height"))

func global_save():
	var save_dic = {
		"setting" : setting,
		"level_unlock" : level_unlocked
	}
	
	return save_dic

func global_load(load_dic):
	setting = load_dic["setting"]
	level_unlocked = load_dic["level_unlock"]
	
	if level_unlocked.size() != default_level_unlocked.size():
		level_unlocked = default_level_unlocked
		
		print("data version not match, loaded to default data.")
