#SFX
extends ButtonClass

func _ready():
	match Global.setting["sfx"]:
		true:
			$sfx_spr.frame = 0
		false:
			$sfx_spr.frame = 1

func _process(delta):
	if $"%button_indicator".button == self:
		$"%button_indicator".selector.flip_h = false

func on_button_clicked():
	$blinker2/AnimationPlayer.play("blink")

func switch():
	$AudioStreamPlayer.play()
	
	Global.setting["sfx"] = !Global.setting["sfx"]
	
	match Global.setting["sfx"]:
		true:
			$sfx_spr.frame = 0
		false:
			$sfx_spr.frame = 1
	
