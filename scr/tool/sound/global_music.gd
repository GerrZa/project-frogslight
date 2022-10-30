extends Node

onready var player = $global_music_player
var main_ost = preload("res://asset/ost/main_mixed_v1.wav")

func _ready():
	$global_music_player.playing = false
	player.stream = main_ost

func play_music(sound):
	$global_music_player.stream = sound
	$global_music_player.play()
