extends Panel
class_name Buzz


@export var update_on_startup := true

@export var buzz_data: BuzzData

@onready var title_label = $MarginContainer/VBoxContainer/Header/InfoMargins/Info/Title
@onready var author_label = $MarginContainer/VBoxContainer/Header/InfoMargins/Info/HBoxContainer/Author
@onready var lifetime_label = $MarginContainer/VBoxContainer/Header/InfoMargins/Info/HBoxContainer/Lifetime
@onready var text_label = $MarginContainer/VBoxContainer/Text
@onready var keywords_label = $MarginContainer/VBoxContainer/Keywords


func _ready():
	if update_on_startup:
		update_values()


func update_values():	
	if buzz_data == null or buzz_data.author == null:
		return
	
	title_label.text = buzz_data.title
	author_label.text = buzz_data.author.username
	lifetime_label.text = Time.get_date_string_from_unix_time(buzz_data.timestamp)
	text_label.text = buzz_data.content
	
	keywords_label.text = ""
	
	for i in range(0, buzz_data.keywords.size()):
		if buzz_data.keywords[i] == "":
			continue
		
		keywords_label.text += "#" + buzz_data.keywords[i]
		
		if i != buzz_data.keywords.size() - 1:
			keywords_label.text += " "
