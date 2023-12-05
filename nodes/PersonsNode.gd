extends "res://nodes/Node.gd"

func _ready():
	SLOTS = [
		[false, Constants.Type.ANY, true, Constants.Type.VECTOR | Constants.Type.PERSON],
		[false, Constants.Type.ANY, true, Constants.Type.VECTOR | Constants.Type.PERSON],
		[false, Constants.Type.ANY, true, Constants.Type.VECTOR | Constants.Type.PERSON],
		[false, Constants.Type.ANY, true, Constants.Type.VECTOR | Constants.Type.PERSON],
		[false, Constants.Type.ANY, true, Constants.Type.PERSON],
	]
	
	super()


func add_children():
	pass
