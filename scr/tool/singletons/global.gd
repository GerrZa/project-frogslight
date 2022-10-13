extends Node

var current_level = 0

var level_unlocked = [ #current level count : 20
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
]

var default_level_unlocked  = [ #current level count : 20
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
]

var setting = {
	"fullscreen" : false,
	"sfx" : true,
	"music" : true
	}

var first_start = true

func _process(delta):
	AudioServer.set_bus_mute(2,!setting["sfx"])
	AudioServer.set_bus_mute(1,!setting["music"])
	
