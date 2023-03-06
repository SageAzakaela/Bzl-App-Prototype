extends Control


signal successfully_authenticated


@onready var username_input := $VBoxContainer/UsernameHBox/Username
@onready var password_input := $VBoxContainer/PasswordHBox/Password


func _on_sign_in_button_pressed():
	if UserData.check_user(username_input.text, password_input.text):
		emit_signal("successfully_authenticated")


func _on_sign_up_button_pressed():
	if username_input.text.length() == 0 or password_input.text.length() == 0:
		return
	
	UserData.add_user(username_input.text, password_input.text)
