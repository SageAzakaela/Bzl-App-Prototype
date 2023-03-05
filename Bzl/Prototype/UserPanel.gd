extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Username = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/Username
onready var Pronouns = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/Pronouns
onready var Bio = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/Bio

onready var edit_bio_panel = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/Bio/EditBioPanel
onready var edit_bio_text_entry = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/Bio/EditBioPanel/EditBioText
onready var bio_button = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/EditBioButton

onready var edit_pronouns_button = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/EditPronouns
onready var edit_prnouns_field = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/EditPronounsField

onready var edit_name_field = $UserPanelBox/VBoxContainer/HBoxContainer/UserInfo2/VBoxContainer/EditNameField


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	Username.text = str(CurrentLogIn.logged_in_username)
	Pronouns.text = str(CurrentLogIn.logged_in_pronouns)
	Bio.text = str(CurrentLogIn.logged_in_bio)

func _on_EditBioButton_toggled(button_pressed):
	if button_pressed == true:
		edit_bio_panel.visible = true
		edit_bio_text_entry.visible = true
		bio_button.text = "Save Bio"
	else:
		edit_bio_panel.visible = false
		edit_bio_text_entry.visible = false
		bio_button.text = "Edit Bio"
		# Get the updated bio text
		var updated_bio = {"bio": edit_bio_text_entry.text}
		CurrentLogIn.logged_in_bio = edit_bio_text_entry.text
		# Update the user's bio in the database
		UserData.UpdateUserData(CurrentLogIn.logged_in_email, updated_bio)


func _on_EditPronouns_toggled(button_pressed):
	var new_text = edit_prnouns_field.text
	var name_text = edit_name_field.text
	if button_pressed == true:
		edit_prnouns_field.visible = true
		edit_pronouns_button.text = "Save Name and Pronouns"
		edit_name_field.visible = true
	else:
		edit_prnouns_field.visible = false
		edit_name_field.visible = false
		edit_pronouns_button.text = "Edit Name and Pronouns"
		# Get the updated pronouns text
		var updated_pronouns = {"pronouns": new_text}
		var updated_name = {"name": name_text}
		CurrentLogIn.logged_in_pronouns = new_text
		CurrentLogIn.logged_in_username = name_text
		# Update the user's pronouns in the database
		UserData.UpdateUserData(CurrentLogIn.logged_in_email, updated_pronouns)
		UserData.UpdateUserData(CurrentLogIn.logged_in_email, updated_name)
		


func _on_ExitUserPanel_pressed():
	self.visible = false
