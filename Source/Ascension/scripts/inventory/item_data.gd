class_name InvItemData

var item_id: String
var count: int
var data := {}

func _init(item_id: String, count := 1):
	self.item_id = item_id
	self.count = count
