extends Area2D

func _ready():
	$firefly_sprite/AnimationPlayer.play("idle")

func get_eaten():
	
	$firefly_sprite/AnimationPlayer.play("eaten")
	
	yield($firefly_sprite/AnimationPlayer,"animation_finished")
	
	$"%froggy".add_light(false)
	queue_free()
