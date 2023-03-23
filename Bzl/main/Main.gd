extends Control


@onready var discover_content := $VBoxContainer/Main/Content/MarginContainer/DiscoverContent
@onready var creation_content := $VBoxContainer/Main/Content/MarginContainer/CreationContent


func _on_discover_pressed():
	creation_content.hide()
	discover_content.show()


func _on_create_pressed():
	discover_content.hide()
	creation_content.show()
