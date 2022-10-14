extends ButtonClass


func on_button_clicked():
	
	$"%menu".visible = true
	$"%option".visible = false
	
	controller.change_button($"%resume")
	
