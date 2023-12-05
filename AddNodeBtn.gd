extends Control

@export var node_name : String;

signal add_node(name:String)

func insert_node():
	add_node.emit(node_name)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Label.text = node_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
