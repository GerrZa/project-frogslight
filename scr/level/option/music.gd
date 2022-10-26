#Music
extends ButtonClass

func _ready():
	match Global.setting["music"]:
		true:
			$music_spr.frame = 0
		false:
			$music_spr.frame = 1

func _process(delta):
	if $"%button_indicator".button == self:
		$"%button_indicator".selector.flip_h = true

func on_button_clicked():
	$blinker/AnimationPlayer.play("blink")

func switch():
	$AudioStreamPlayer.play()
	
	Global.setting["music"] = !Global.setting["music"]
	
	match Global.setting["music"]:
		true:
			$music_spr.frame = 0
		false:
			$music_spr.frame = 1
	
