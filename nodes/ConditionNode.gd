extends "res://nodes/Node.gd"

@onready var Options = $OptionButton

func _ready():
	SLOTS = [
		[true, Constants.Type.ANY, false, 0],
		[false, 0, true, Constants.Type.BOOL],
		[true, Constants.Type.ANY, false, 0],
	]
	
	super()


func add_children():
	pass
