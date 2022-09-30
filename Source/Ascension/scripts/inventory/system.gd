extends Node

onready var cursor_item = $CanvasLayer/CursorItem

var items := {}
var cursor_slot := InvSlot.new()

func _process(delta):
	cursor_item.texture = null
	cursor_item.rect_position = get_viewport().get_mouse_position() - (cursor_item.rect_size * cursor_item.rect_scale / 2)
	
	if cursor_slot.item_data != null:
		cursor_item.texture = Inventory.items[cursor_slot.item_data.item_id].icon

func item_exchange(from: InvSlot, to: InvSlot):
	var temp = to.item_data
	to.item_data = from.item_data
	from.item_data = temp
