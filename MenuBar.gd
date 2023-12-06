extends MenuBar

func get_shortcut(keycode:int,modifier:=[]) -> int:
	var i := InputEventKey.new()
	i.ctrl_pressed = modifier.has("ctrl")
	i.shift_pressed = modifier.has("shift")
	i.alt_pressed = modifier.has("alt")
	i.keycode = keycode
	return i.get_keycode_with_modifiers()

# Called when the node enters the scene tree for the first time.
func _ready():
	var file_menu = PopupMenu.new()
	file_menu.name = "File"
	
	file_menu.add_item("New", Constants.Actions.NEW, get_shortcut(KEY_N, ["ctrl"]))
	file_menu.add_separator()
	file_menu.add_item("Save", Constants.Actions.SAVE, get_shortcut(KEY_S, ["ctrl"]))
	file_menu.add_item("Save as...", Constants.Actions.SAVE_AS, get_shortcut(KEY_S, ["ctrl","shift"]))
	file_menu.add_separator()
	file_menu.add_item("Open...", Constants.Actions.OPEN, get_shortcut(KEY_O, ["ctrl"]))
	
	file_menu.id_pressed.connect(get_node("../..").on_menu_item)
	add_child(file_menu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
