extends Panel


@onready var item_container = $MarginContainer/ScrollContainer/ItemContainer


func _ready():
	# create item instances and set their properties
	var data_fragment = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	data_fragment.item_name = "Data Fragment"
	data_fragment.item_description = "What data this used to contain is a mystery, and how it came to be separated from it's cluster and how it exists by itself in this state is an enigma on top of that. Bzls love Data Fragments as decoration, they don't have much use outside of this however."
	data_fragment.item_price = 10
	item_container.add_child(data_fragment)

	var code_crystal_white = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	code_crystal_white.item_name = "White Code Crystal"
	code_crystal_white.item_description = "Crystalized Code exists in many places in the HiveNet and comes in a vareity of different colors. Each have their own use: White Code Crystals are often used by Bzls to contain and manipulate Strings."
	code_crystal_white.item_price = 30
	item_container.add_child(code_crystal_white)

	var code_crystal_red = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	code_crystal_red.item_name = "Red Code Crystal"
	code_crystal_red.item_description = "Allows the user to manipulate numeric values in code, making it a popular choice for Bzls who enjoy working with math-based code."
	code_crystal_red.item_price = 50
	item_container.add_child(code_crystal_red)

	var code_crystal_blue = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	code_crystal_blue.item_name = "Blue Code Crystal"
	code_crystal_blue.item_description = "Gives the user the ability to manipulate object properties and their states within code, making it ideal for working with graphical user interfaces."
	code_crystal_blue.item_price = 80
	item_container.add_child(code_crystal_blue)

	var code_crystal_green = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	code_crystal_green.item_name = "Green Code Crystal"
	code_crystal_green.item_description = "Allows the user to manipulate code structures such as loops and conditionals, making it a powerful tool for Bzls who enjoy automating tasks."
	code_crystal_green.item_price = 70
	item_container.add_child(code_crystal_green)

	var code_crystal_yellow = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	code_crystal_yellow.item_name = "Yellow Code Crystal"
	code_crystal_yellow.item_description = "Gives the user the ability to manipulate the flow of code, allowing them to skip over certain sections or repeat others as needed."
	code_crystal_yellow.item_price = 90
	item_container.add_child(code_crystal_yellow)

	var code_crystal_purple = load("res://Prototype/Items_and_Shop/ShopItem.tscn").instantiate()
	code_crystal_purple.item_name = "Purple Code Crystal"
	code_crystal_purple.item_description = "Allows the user to manipulate memory usage in code, making it a valuable tool for optimizing performance and reducing overhead."
	code_crystal_purple.item_price = 100
	item_container.add_child(code_crystal_purple)


func _on_ExitShop_pressed():
	self.visible = false
