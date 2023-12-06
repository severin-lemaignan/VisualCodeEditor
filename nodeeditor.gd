extends Control

@onready var NodesLibrary = $NodesLibrary
@onready var Graph = $"VBoxContainer/Panels/GraphEdit"
@onready var BtnContainer = $VBoxContainer/Panels/BtnContainer

var filename : String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	NodesLibrary.hide()
	
	add_part("DisplayNode")
	add_part("ConditionNode")
	add_part("ValueNode")
	add_part("ValueNode")
	
	for btn in BtnContainer.get_children():
		btn.add_node.connect(add_part)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_menu_item(id):
	if id == 0: # new
		clear_graph()
		return
		
	if (id == 1 and filename == "") or id == 2: # save as
		var dialog = FileDialog.new()
		dialog.access = FileDialog.ACCESS_FILESYSTEM
		dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
		dialog.add_filter("*.res,*.tres", "Visual program (binary or text)")
		dialog.use_native_dialog = true
		add_child(dialog)
		dialog.popup_centered_ratio()
		filename = await dialog.file_selected
		save_data(filename)
		return
		
	if id == 1: # save
		save_data(filename)
		return
	
	if id == 3: # open
		var dialog = FileDialog.new()
		dialog.access = FileDialog.ACCESS_FILESYSTEM
		dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
		dialog.add_filter("*.res,*.tres", "Visual program (binary or text)") 
		dialog.use_native_dialog = true
		add_child(dialog)
		dialog.popup_centered_ratio()
		filename = await dialog.file_selected
		load_data(filename)
		return
	
func add_part(node_name: String):
	var part: GraphNode = NodesLibrary.get_node(node_name).duplicate()
	Graph.add_child(part, true) # Use a friendly node name to help with save/load later
	part.position_offset.x = get_viewport().get_mouse_position().x

func init_graph(graph_data: GraphData):
	clear_graph()
	for node in graph_data.nodes:
		# Get new node from factory autoload (singleton)
		var gnode = NodesLibrary.get_node(node.type).duplicate()
		gnode.position_offset = node.offset
		gnode.name = node.name
		gnode.set_data(node.data)
		Graph.add_child(gnode)
	for con in graph_data.connections:
		var _e = Graph.connect_node(con.from_node, con.from_port, con.to_node, con.to_port)

func clear_graph():
	Graph.clear_connections()
	var nodes = Graph.get_children()
	for node in nodes:
		if node is GraphNode:
			node.queue_free()
			
func save_data(file_name):
	var graph_data = GraphData.new()
	graph_data.connections = Graph.get_connection_list()
	for node in Graph.get_children():
		if node is GraphNode:
			var node_data = NodeData.new()
			node_data.name = node.name
			node_data.type = node.type
			node_data.offset = node.position_offset
			node_data.data = node.get_data()
			graph_data.nodes.append(node_data)
	var res = ResourceSaver.save(graph_data, file_name)
	if res == OK:
		print("saved")
	else:
		print("Error saving graph_data")

func load_data(file_name):
	if ResourceLoader.exists(file_name):
		var graph_data = ResourceLoader.load(file_name)
		if graph_data is GraphData:
			init_graph(graph_data)
		else:
			# Error loading data
			pass
	else:
		# File not found
		pass

func execute_graph():
	print("go go go")
