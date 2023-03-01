extends Panel


export var item_name = ""
export var item_description = ""


func _ready():
	$HBoxContainer/ItemName.text = item_name
	$HBoxContainer/ItemDescription.text = item_description
