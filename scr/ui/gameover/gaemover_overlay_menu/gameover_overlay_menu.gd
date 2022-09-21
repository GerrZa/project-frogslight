extends Control

func _input(event):
	if event.is_action_pressed("ui_up") or event.is_action("ui_down"):
		
			$button/retry_button.grab_focus()
