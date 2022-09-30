extends Node

func _input(event):
	if event.is_action_pressed("debug_mouse_mode"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE)
	
	if event.is_action_pressed("debug_reload_scene"):
		get_tree().reload_current_scene()
	
	if event.is_action_pressed("debug_first_scene"):
		get_tree().change_scene(ProjectSettings["application/run/main_scene"])
	
	if event.is_action_pressed("debug_quit"):
		get_tree().quit()
