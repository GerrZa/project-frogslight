extends Node

onready var player = $global_music_player
onready var tween = $Tween

var resume_db = -7

var main_ost = preload("res://asset/ost/main_mixed_v1.wav")

func _ready():
	$global_music_player.playing = false
	player.stream = main_ost

func resume_music():
	tween.stop_all()
	tween.interpolate_property(player,"volume_db",player.volume_db,-7,1.2)
	tween.start()

func pause_music():
	tween.stop_all()
	tween.interpolate_property(player,"volume_db",player.volume_db,-80,0.3)
	tween.start()
