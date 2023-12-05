extends GraphNode

var SLOTS = [
	[true, Constants.Type.ANY, false, Constants.Type.ANY],
	[false, Constants.Type.ANY, true, Constants.Type.VECTOR | Constants.Type.ANY],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	add_children()
	configure_slots()

func add_children():
	var label : Label = Label.new()
	label.text = "Slot 1"
	add_child(label,true)
	
	var label2 : Label = Label.new()
	label2.text = "Slot 2"
	add_child(label2,true)

func on_connected(from_node, from_type, on_port):
	pass
	
func on_disconnected(from_node, from_type, on_port):
	pass
	
func configure_slots():
	var idx = 0
	for slot in SLOTS:
		set_slot(idx,slot[0], slot[1], Constants.type_color(slot[1]),slot[2], slot[3], Constants.type_color(slot[3]),Constants.type_icon(slot[1]), Constants.type_icon(slot[3]))
		idx += 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
