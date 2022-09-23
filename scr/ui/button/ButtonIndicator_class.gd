#Require a Indicator sprite and ButtonClass node(s)
class_name ButtonIndicator
extends Control

export var start_button = NodePath()

onready var button = null

export var indicator_nodepath = NodePath()
onready var selector : Object = null

signal button_change

func _ready():
	
	selector = get_node(indicator_nodepath)
	button = get_node(start_button)
	
	selector.playing = true

func _input(event):
	
	if Input.is_action_just_pressed("ui_right"):
		change_button(button.right_button)
	elif Input.is_action_just_pressed("ui_left"):
		change_button(button.left_button)
	elif Input.is_action_just_pressed("ui_up"):
		change_button(button.up_button)
	elif Input.is_action_just_pressed("ui_down"):
		change_button(button.down_button)
	
	if Input.is_action_just_pressed("ui_tongue"):
		button.on_button_clicked()
	

func change_button(new_button):
	
	if button != null:
		
		button = new_button
		
		var new_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		new_tween.tween_property(selector,"position",button.position,0.1)
		
		emit_signal("button_change")
