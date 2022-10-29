extends CanvasLayer

var band_bass_db = [
	0,0,-32,-60,-60,-60
]

func _ready():
	set_band_db(true)
	
	get_tree().current_scene.is_paused = true
	
	get_tree().paused = true

func set_band_db(is_effect_on:bool):
	
	match is_effect_on:
		true:
			var effect = AudioServer.get_bus_effect(1,0)
			var band_count = effect.get_band_count()
			
			for i in band_count:
				effect.set_band_gain_db(i,band_bass_db[i])
			
		false:
			var effect = AudioServer.get_bus_effect(1,0)
			var band_count = effect.get_band_count()
			
			for i in band_count:
				effect.set_band_gain_db(i,0)
