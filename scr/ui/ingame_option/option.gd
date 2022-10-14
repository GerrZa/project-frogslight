extends ButtonClass


func on_button_clicked():
	
	$"%menu".visible = false
	$"%option".visible = true
	
	controller.change_button($"%sfx")

