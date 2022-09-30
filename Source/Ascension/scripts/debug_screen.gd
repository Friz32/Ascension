extends Control

onready var info = $"%Info"

func _process(delta):
	var text = ""
	text += "FPS: %s\n" % Engine.get_frames_per_second()
	info.bbcode_text = text
