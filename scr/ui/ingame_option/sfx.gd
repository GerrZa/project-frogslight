#sfx
extends ButtonClass


func _ready():
	$status.playing = true

func on_button_clicked():
	Global.setting["sfx"] = !Global.setting["sfx"]

func _process(delta):
	match Global.setting["sfx"]:
		true:
			$status.animation = "on"
		false:
			$status.animation = "off"
