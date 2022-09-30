class_name InvUISlot
extends Control

onready var label_count = $Count
onready var icon = $Icon

var slot: InvSlot

func _process(delta):
	label_count.text = ""
	icon.texture = null
	
	if slot != null && slot.item_data != null:
		icon.texture = Inventory.items[slot.item_data.item_id].icon
	
	if slot != null && slot.item_data != null:
		var count = slot.item_data.count
		
		if count > 1:
			label_count.text = str(count)
		
		if count > 999:
			label_count.text = "999+"

func _gui_input(event):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
		Inventory.item_exchange(Inventory.cursor_slot, slot)
