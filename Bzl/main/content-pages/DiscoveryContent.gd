extends Control


var current_keywords: Array[String]

@onready var buzz_container := $VBoxContainer/ScrollContainer/BuzzContainer
@onready var search_timout_timer := $SearchTimeout


func _on_searchbar_search_entered(keywords: Array[String]):
	current_keywords = keywords
	search_timout_timer.stop()
	search_timout_timer.start()
	

func _on_search_timeout_timeout():
	buzz_container.display(await BuzzManager.fetch(current_keywords))
