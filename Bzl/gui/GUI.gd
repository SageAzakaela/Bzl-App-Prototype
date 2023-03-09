extends Control


var current_keywords: Array[String]

@onready var buzz_container := $VBoxContainer/Main/Content/MarginContainer/ScrollContainer/BuzzContainer
@onready var search_timout_timer := $SearchTimout


func _on_searchbar_search_entered(keywords: Array[String]):
	current_keywords = keywords
	search_timout_timer.stop()
	search_timout_timer.start()


func _on_search_timout_timeout():
	var buzz := BuzzData.new()
	
	buzz.author = UserManager.get_active_user().uid
	buzz.title = "Whooooo hooo!! It works"
	buzz.content = "I finally got buzz posting to work!!!"
	buzz.keywords = ["update", "bzl", "news", "test"]
	buzz.timestamp = Time.get_unix_time_from_system()
	
	#BuzzManager.create_buzz(buzz)
	
	buzz_container.display(await BuzzManager.fetch(current_keywords))
