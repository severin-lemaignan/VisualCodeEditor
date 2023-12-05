extends "res://nodes/Node.gd"

func _ready():
	SLOTS = [
		[true, Constants.Type.VECTOR, true, Constants.Type.ANY],
	]	
	super()

func on_connected(from_node, from_type, on_port):
	var type = from_type & ~Constants.Type.VECTOR

	set_slot(0, SLOTS[0][0], SLOTS[0][1], Constants.type_color(SLOTS[0][1]), true, type, Constants.type_color(type), Constants.type_icon(SLOTS[0][1]), Constants.type_icon(type))
	
func on_disconnected(from_node, from_type, on_port):
	configure_slots()
	
func add_children():
	pass
