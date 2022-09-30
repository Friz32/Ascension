extends Control

onready var slots = $Panel/Slots

var items = InvContainer.new()

func _ready():
	for i in slots.get_child_count():
		var slot = InvSlot.new()
		items.slots.append(slot)
		slots.get_child(i).slot = slot
		
		if rand_range(0, 1) > 0.5:
			slot.item_data = InvItemData.new("potion", int(rand_range(1, 16)))
		if rand_range(0, 1) > 0.5:
			slot.item_data = InvItemData.new("feather", int(rand_range(1, 16)))
