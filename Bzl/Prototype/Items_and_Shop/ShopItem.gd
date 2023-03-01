extends Panel


export var item_name = ""
export var item_description = ""
export var item_price = 0

func _ready():
	$HBoxContainer/ItemName.text = item_name
	$HBoxContainer/ItemDescription.text = item_description
	$HBoxContainer/ItemPrice.text = item_price as String + " Nectar"

func _process(_delta):
		# Check if the user has enough nectar to buy the item
	if CurrentLogIn.logged_in_nectar < item_price:
		# Disable the buy button
		$HBoxContainer/Buy.disabled = true
		return
	else:
		$HBoxContainer/Buy.disabled = false

func _on_Buy_pressed():
	# Subtract the item price from the user's nectar balance
	UserData.remove_user_points(CurrentLogIn.logged_in_username, item_price)
	
	# Add the item to the user's inventory
	var item = {"item_name": item_name, "item_description": item_description}
	UserData.add_item_to_inventory(CurrentLogIn.logged_in_username, item)
	
#	# Remove the item from the shop
#	queue_free()
	$HBoxContainer/Buy.disabled = true
	$HBoxContainer/Buy.text = "Purchased!"
