extends Node

func play_sfx(sound):
	$global_sfx_player.stream = sound
	$global_sfx_player.play()
