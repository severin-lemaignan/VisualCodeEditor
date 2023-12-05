extends Node

enum Type {ANY=0,
		VECTOR     =0b10000000, 
		BOOL       =0b00000001,
		NUMERICAL  =0b00000010, 
		STRING     =0b00000011,  
		TF_FRAME   =0b00000100, 
		PERSON     =0b00001000
		}

var TypeColors = {
	Type.ANY: Color.WHITE,
	Type.VECTOR: Color.BLUE_VIOLET,
	Type.BOOL: Color.CORAL,
	Type.NUMERICAL: Color.DARK_SEA_GREEN,
	Type.STRING: Color.CORNFLOWER_BLUE,
	Type.TF_FRAME: Color.ORANGE,
	Type.PERSON: Color.BURLYWOOD
}

func is_vector(type):
	return type & Type.VECTOR

func type_color(type):
	if is_vector(type):
		return TypeColors[Type.VECTOR]
	else:
		return TypeColors[type]

func type_icon(type):
	return null
	
# list possible input types for a given input port: the keys of the dictionary 
# are the input port type, the values are the possible types of the output ports connected
# to this input port.
# Connection of matching types are implicit and do not need to be specified.
var COMPATIBLE_PORTS_TYPE = {Type.TF_FRAME: [Type.PERSON]}
