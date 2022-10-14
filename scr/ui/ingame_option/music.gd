#music
extends ButtonClass


func _ready():
	$status.playing = true

func on_button_clicked():
	Global.setting["music"] = !Global.setting["music"]

func _process(delta):
	match Global.setting["music"]:
		true:
			$status.animation = "on"
		false:
			$status.animation = "off"
