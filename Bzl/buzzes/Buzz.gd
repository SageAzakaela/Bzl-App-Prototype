extends Panel
class_name Buzz


@export var update_on_startup := true

@export var title := ""
@export var author := ""
@export var lifetime := 0
@export_multiline var text := ""
@export var keywords: Array[String]

@onready var title_label = $MarginContainer/VBoxContainer/Header/InfoMargins/Info/Title
@onready var author_label = $MarginContainer/VBoxContainer/Header/InfoMargins/Info/HBoxContainer/Author
@onready var lifetime_label = $MarginContainer/VBoxContainer/Header/InfoMargins/Info/HBoxContainer/Lifetime
@onready var text_label = $MarginContainer/VBoxContainer/Text
@onready var keywords_label = $MarginContainer/VBoxContainer/Keywords


func _ready():
	if update_on_startup:
		update_values()


func update_values():
	title_label.text = title
	author_label.text = author
	lifetime_label.text = str(lifetime)
	text_label.text = text
	
	keywords_label.text = ""
	
	for i in range(0, keywords.size()):
		keywords_label.text += "#" + keywords[i]
		
		if i != keywords.size() - 1:
			keywords_label.text += " "
