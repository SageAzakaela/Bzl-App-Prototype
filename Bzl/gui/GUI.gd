extends Control


@onready var buzz_container := $VBoxContainer/Main/Content/MarginContainer/ScrollContainer/BuzzContainer


func _on_searchbar_search_entered(keywords: Array[String]):
	buzz_container.search(keywords)
