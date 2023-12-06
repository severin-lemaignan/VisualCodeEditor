extends "res://nodes/Node.gd"

func _ready():
	SLOTS = [
		[false, 0, true, Constants.Type.ANY],
	]
	
	update_content_type($LineEdit.text)
	super()

func exec(inputs):
	
	var text = $LineEdit.text
	
	if text.length() == 0:
		return [null]
	if text.is_valid_float():
		return [text.to_float()]
	
	return [text]

func update_content_type(text:String):
	if text.length() == 0:
		if SLOTS[0][3] != Constants.Type.ANY:
			SLOTS = [
				[false, 0, true, Constants.Type.ANY],
			]
			configure_slots()
		return
		
	if text.is_valid_float():
		if SLOTS[0][3]!= Constants.Type.NUMERICAL:
			SLOTS = [
				[false, 0, true, Constants.Type.NUMERICAL],
			]
			configure_slots()
		return
	
	if SLOTS[0][3] != Constants.Type.STRING:
		SLOTS = [
			[false, 0, true, Constants.Type.STRING],
		]
		configure_slots()
		return
	

func add_children():
	pass
