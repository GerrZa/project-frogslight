extends ButtonIndicator

func _ready():
	connect("button_change",self,"on_button_change")

func on_button_change():
	$AudioStreamPlayer.play()
