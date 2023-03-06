extends Panel


@export var text = ""
@export var keywords = ["hello", "kitty"]
@export var remaining_time = 0
@export var author = ""

@onready var keywords_label = $MarginContainer/VBoxContainer/Keywords


func _ready():
	keywords_label.text = ""
	
	for i in range(0, keywords.size()):
		keywords_label.text += "#" + keywords[i]
		
		if i != keywords.size() - 1:
			keywords_label.text += " "
