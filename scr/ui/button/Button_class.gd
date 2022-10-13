class_name ButtonClass
extends AnimatedSprite

export var right_neighbor = NodePath()
export var left_neighbor = NodePath()
export var up_neighbor = NodePath()
export var down_neighbor = NodePath()

onready var right_button = null
onready var left_button = null
onready var up_button = null
onready var down_button = null

var controller = null

func _ready():
	playing = true
	
	right_button = get_node_or_null(right_neighbor)
	left_button = get_node_or_null(left_neighbor)
	up_button = get_node_or_null(up_neighbor)
	down_button = get_node_or_null(down_neighbor)

func on_button_clicked():
	pass
