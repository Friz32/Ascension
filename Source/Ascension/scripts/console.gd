extends Control

export var popup := true

onready var output = $"%Output"
onready var command = $"%Command"

func _ready():
	if popup:
		show()

func parse_command():
	if !command.text.empty():
		output.append_bbcode("\n" + command.text)
		
		var cmd = command.text.split(" ")
		match cmd[0]:
			"help":
				output.append_bbcode("\ngoto <scene>")
			"goto":
				get_tree().change_scene("res://scenes/" + cmd[1] + ".tscn")
			_:
				output.append_bbcode("\n[color=red]Unknown command[/color]")
		
		command.text = ""

func on_enter_pressed():
	parse_command()

func on_command_text_entered(new_text):
	parse_command()
