extends Control


var keywords_input : Array[String]

@onready var title_input := $VBoxContainer/MarginContainer3/TitleInput
@onready var text_input := $VBoxContainer/MarginContainer2/TextInput
@onready var post_button := $VBoxContainer/MarginContainer4/PostButton


func _on_post_button_pressed():
	if keywords_input.count("") == keywords_input.size():
		print("No keywords provided!")
		
	for keyword in keywords_input:
		if keyword.begins_with(" "):
			print("Invalid keywords provided!")
		
	if title_input.text == "":
		print("No title provided")
		
	if text_input.text == "":
		print("No content provided!")
	
	BuzzManager.create_buzz(title_input.text, text_input.text, keywords_input)
	
	
func _on_tag_input_search_entered(keywords):
	keywords_input = keywords
