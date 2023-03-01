extends Panel

var items = []

onready var item_container = $MarginContainer/ScrollContainer/ItemContainer


func _on_ExitInventory_pressed():
	self.visible = false


func _on_Inventory_pressed():
	# Clear existing items
	for child in item_container.get_children():
		child.queue_free()
	items.clear()
	
	# create dictionaries for each item and append to the items list
	for item in CurrentLogIn.logged_in_inventory:
		var item_instance = load("res://Prototype/Items_And_Shop/Item.tscn").instance()
		item_instance.item_name = item["item_name"]
		item_instance.item_description = item["item_description"]
		item_container.add_child(item_instance)
		items.append(item)
