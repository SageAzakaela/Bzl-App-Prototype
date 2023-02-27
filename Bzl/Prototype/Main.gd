extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Hive_Key_1 = ""
var Hive_Key_2 = ""
var Hive_Key_3 = ""
var Hive_Key_4 = ""
var Hive_Key_5 = ""
var Hive_Key_6 = ""

onready var hive_1 = $Background/HBoxContainer/Hives/HiveContainer/Hive1
onready var hive_2 = $Background/HBoxContainer/Hives/HiveContainer/Hive2
onready var hive_3 = $Background/HBoxContainer/Hives/HiveContainer/Hive3
onready var hive_4 = $Background/HBoxContainer/Hives/HiveContainer/Hive4
onready var hive_5 = $Background/HBoxContainer/Hives/HiveContainer/Hive5
onready var hive_6 = $Background/HBoxContainer/Hives/HiveContainer/Hive6


onready var buzz_key_1 = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzKeywords/KeywordContainer/KeywordEntry1
onready var buzz_key_2 = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzKeywords/KeywordContainer/KeywordEntry2
onready var buzz_key_3 = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzKeywords/KeywordContainer/KeywordEntry3
onready var buzz_key_4 = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzKeywords/KeywordContainer/KeywordEntry4
onready var buzz_key_5 = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzKeywords/KeywordContainer/KeywordEntry5
onready var buzz_key_6 = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzKeywords/KeywordContainer/KeywordEntry6

onready var buzz_text_entry = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzEntry/HBoxContainer/BuzzEntryField

onready var buzz_container = $Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer/BuzzContainer

onready var current_user_label = $Background/HBoxContainer/Hives/HiveContainer/UserPanel/VBoxContainer/Username

onready var UserPanel = $UserPanel
onready var UserPanelExit = $UserPanel/ExitUserPanel

onready var blip = $Background/HBoxContainer/FeedAndPost/VBoxContainer/BuzzEntry/Blip
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	## Lets make sure the Hive Keys match the text in the Hive Container
	Hive_Key_1 = hive_1.text.to_lower()
	Hive_Key_2 = hive_2.text.to_lower()
	Hive_Key_3 = hive_3.text.to_lower()
	Hive_Key_4 = hive_4.text.to_lower()
	Hive_Key_5 = hive_5.text.to_lower()
	Hive_Key_6 = hive_6.text.to_lower()
	# Get the list of children nodes in the Buzz Container
	var buzz_list = buzz_container.get_children()
	for buzz in buzz_list:
	# Assume that the Buzz is hidden by default
		buzz.hide()
		# Check if there are any Hive keywords defined
		if Hive_Key_1 != "" or Hive_Key_2 != "" or Hive_Key_3 != "" or Hive_Key_4 != "" or Hive_Key_5 != "" or Hive_Key_6 != "":
			# Check if the keywords of the Buzz match any of the Hive keywords
			for keyword in buzz.Keywords:
				if keyword != "" and (keyword == Hive_Key_1 or keyword == Hive_Key_2 or keyword == Hive_Key_3 or keyword == Hive_Key_4 or keyword == Hive_Key_5 or keyword == Hive_Key_6):
					# If there is a match, show the Buzz
					buzz.show()
	## Lets see who's currently logged in
	current_user_label.text = CurrentLogIn.logged_in_username as String





func _on_SubmitBuzz_pressed():
	blip.play()
	#instance the Buzz
	var buzz = load("res://Prototype/Buzzes/NewBuzz.tscn").instance()
	buzz.Buzz_Text = buzz_text_entry.text
	buzz.Keywords = [buzz_key_1.text.to_lower(), buzz_key_2.text.to_lower(), buzz_key_3.text.to_lower(), buzz_key_4.text.to_lower(), buzz_key_5.text.to_lower(), buzz_key_6.text.to_lower()]
	buzz.Time_Remaining = 120
	buzz_container.add_child(buzz)
	
	#clear the text entry field and keyword fields
	buzz_text_entry.clear()
	buzz_key_1.clear()
	buzz_key_2.clear()
	buzz_key_3.clear()
	buzz_key_4.clear()
	buzz_key_5.clear()
	buzz_key_6.clear()


func _on_UserPanelAccessButtom_pressed():
	UserPanel.visible = true
	UserPanelExit = true


func _on_BrowseRecent_toggled(button_pressed):
	if button_pressed == true:
		$Background/HBoxContainer/Hives/HiveContainer/BrowseRecent.text = "Return to Feed"
		$Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer.visible = false
		$Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/RecentTags.visible = true
	else:
		$Background/HBoxContainer/Hives/HiveContainer/BrowseRecent.text = "Browse Most Recent Hives"
		$Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer.visible = true
		$Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/RecentTags.visible = false
