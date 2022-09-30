class_name InvContainer

var slots := [] # InvSlot

func add_item(item_id: String, count := 1) -> bool:
	for i in slots.size():
		if slots[i].item_data == null:
			slots[i].item_data = InvItemData.new(item_id, count)
			
			return true
	
	return false

func remove_item(item_id: String, count := 1) -> bool:
	return false

func clear():
	for i in slots.size():
		slots[i] = null
