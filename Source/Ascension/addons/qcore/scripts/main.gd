class_name QCore
extends Object

static func snap(value: float, size: float) -> float:
	return round(value / size) * size

static func array_create(size := 0, fill = null) -> Array:
	var arr = []
	
	if size > 0:
		arr.resize(size)
	
	if fill != null:
		array_fill(arr, fill)
	
	return arr

static func multi_array(dimensions := 1, size := 0, fill = null):
	var current
	for i in dimensions:
		current = []
		current.resize(size)

static func array_fill(array: Array, value, start := 0, end := 0) -> void:
	end = array.size()
	
	for i in range(start, end):
		array[i] = value

static func foreach_file(path: String, function: FuncRef) -> void:
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var filename = dir.get_next()
		while filename != "":
			var file_path = dir.get_current_dir() + "/" + filename
			if dir.file_exists(file_path):
				function.call_funcv([file_path])
			
			filename = dir.get_next()

static func flags(names: Array) -> Dictionary:
	var dict = {}
	
	var prev = 1
	for i in names.size():
		dict[names[i]] = prev
		prev *= 2
	
	var all = 1
	for i in range(1, names.size()):
		all = all | dict.values()[i]
	dict["all"] = all
	
	return dict

static func enum_flags(_enum: Dictionary) -> void:
	var prev = 1
	for key in _enum:
		_enum[key] = prev
		prev *= 2
	
	var all = 1
	for i in range(1, _enum.size()):
		all = all | _enum.values()[i]
	_enum.ALL = all
