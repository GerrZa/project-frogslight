extends Node

var save_path = "user://date.frog"

signal restore_default

func _ready():
	load_game()

func save_game():
	var file = File.new()
	var error = file.open(save_path,File.WRITE)
	if error == OK:
		file.store_var(Global.global_save())
		file.close()
	else:
		return

func load_game():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path,File.READ)
		if error == OK:
			var player_dat = file.get_var()
			file.close()
			
			Global.global_load(player_dat)
	else:
		Global.level_unlocked = Global.default_level_unlocked

func default_save():
	var def_dat = {
		"setting" : Global.setting,
		"level_unlock" : Global.default_level_unlocked
	}
	
	var file = File.new()
	var error = file.open(save_path,File.WRITE)
	if error == OK:
		file.store_var(def_dat)
		file.close()
		
		Global.global_load(def_dat)
		
		emit_signal("restore_default")
