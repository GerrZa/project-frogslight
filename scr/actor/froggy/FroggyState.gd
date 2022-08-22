class_name FroggyState
extends State

var froggy : Froggy = null

func _ready():
	
	yield(owner,"ready")
	froggy = owner
	assert(froggy != null)
