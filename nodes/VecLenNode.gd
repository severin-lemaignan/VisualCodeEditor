extends "res://nodes/Node.gd"

func _ready():
	SLOTS = [
		[true, Constants.Type.VECTOR, true, Constants.Type.ANY],
	]	
	super()

func on_connected(from_node, from_type, on_port):
	var type = from_type & 0b01111111
	
	set_slot_type_right(0, type)
	set_slot_color_right(0, Constants.type_color(type))

func on_disconnected(from_node, from_type, on_port):
	
	set_slot_type_right(0, Constants.Type.ANY)
	set_slot_color_right(0, Constants.type_color(Constants.Type.ANY))
	
	
func add_children():
	pass
