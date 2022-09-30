extends Node

onready var console = $Console

func _ready():
	QCore.foreach_file("res://resources/items/", funcref(self, "load_items"))

func _input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if event.is_action_pressed("console"):
		console.show()

func load_items(filename):
	Inventory.items[filename.get_file().get_basename()] = load(filename)
