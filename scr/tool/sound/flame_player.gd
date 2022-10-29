extends Node

onready var tween = $Tween

func start_play():
#	$AnimationPlayer.play("start_play")
	
	tween.stop_all()
	tween.interpolate_property($flame_player,"volume_db",$flame_player.volume_db,-30,0.3)
	tween.start()

func stop_play():
#	$AnimationPlayer.play("stop_play")
	
	tween.stop_all()
	tween.interpolate_property($flame_player,"volume_db",$flame_player.volume_db,-80,0.3)
	tween.start()
