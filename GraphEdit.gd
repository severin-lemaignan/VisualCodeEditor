extends GraphEdit

var selected_nodes = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for t in Constants.Type:
			add_valid_connection_type(Constants.Type[t] | Constants.Type.VECTOR, Constants.Type.VECTOR)
			add_valid_connection_type(Constants.Type[t], Constants.Type.ANY)
			
	for i in Constants.COMPATIBLE_PORTS_TYPE.keys():
		for o in Constants.COMPATIBLE_PORTS_TYPE[i]:
			add_valid_connection_type(o, i)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_connection_request(from_node, from_port, to_node, to_port):
	# Don't connect to input that is already connected
	for con in get_connection_list():
		if con.to_node == to_node and con.to_port == to_port:
			return
		
	connect_node(from_node, from_port, to_node, to_port)
	get_node(NodePath(to_node)).on_connected(from_node, get_node(NodePath(from_node)).get_output_port_type(from_port), to_port)

func _on_disconnection_request(from_node, from_port, to_node, to_port):
	disconnect_node(from_node, from_port, to_node, to_port)
	get_node(NodePath(to_node)).on_disconnected(from_node, get_node(NodePath(from_node)).get_output_port_type(from_port), to_port)

func _on_Graph_node_selected(node):
	selected_nodes[node] = true

func _on_Graph_node_deselected(node):
	selected_nodes[node] = false

func remove_connections_to_node(node):
	for con in get_connection_list():
		if con.to_node == node.name or con.from_node == node.name:
			disconnect_node(con.from_node, con.from_port, con.to_node, con.to_port)


# _nodes is a list of nodes that have a close button
func _on_Graph_delete_nodes_request(_nodes):
	for node in selected_nodes.keys():
		if selected_nodes[node]:
			remove_connections_to_node(node)
			node.queue_free()
	selected_nodes = {}
