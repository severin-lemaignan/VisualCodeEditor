extends "res://nodes/Node.gd"

@onready var label = $Label

func _ready():
	SLOTS = [
		[true, Constants.Type.ANY, false, 0]
	]
	
	super()

func exec(inputs):
	
	label.text = inputs[0]
	
	return []

func add_children():
	pass
