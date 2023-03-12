extends Control


var current_keywords: Array[String]

@onready var buzz_container := $VBoxContainer/Main/Content/MarginContainer/ScrollContainer/BuzzContainer
@onready var search_timout_timer := $SearchTimout


func _on_searchbar_search_entered(keywords: Array[String]):
	current_keywords = keywords
	search_timout_timer.stop()
	search_timout_timer.start()


func _on_search_timout_timeout():
	buzz_container.display(await BuzzManager.fast_fetch(current_keywords))
