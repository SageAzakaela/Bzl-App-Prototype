extends Control


signal sign_in_succeeded

var temporary_email: String
var temporary_username: String
var temporary_password: String

@onready var sign_in_form := $SignIn
@onready var sign_up_form := $SignUp

@onready var sign_in_mail_input := $SignIn/MailHBox/Mail
@onready var sign_in_password_input := $SignIn/PasswordHBox/Password

@onready var sign_up_mail_input := $SignUp/MailHBox/Mail
@onready var sign_up_username_input := $SignUp/UsernameHBox/Username
@onready var sign_up_password_input := $SignUp/PasswordHBox/Password
@onready var sign_up_password_confirmation_input := $SignUp/PasswordConfirmationHBox/PasswordConfirmation


# -----< Connecting Signals >----- #
func _ready():
	UserManager.connect("sign_up_succeeded", _on_sign_up_succeeded)
	UserManager.connect("sign_in_succeeded", _on_sign_in_succeeded)
	UserManager.connect("sign_up_failed", _on_sign_up_failed)
	UserManager.connect("sign_in_failed", _on_sign_in_failed)


# -----< Helpers >----- #
func _switch_to_sign_up():
	sign_in_form.hide()
	sign_up_form.show()
	
func _switch_to_sign_in():
	sign_up_form.hide()
	sign_in_form.show()


# -----< Signals >----- #
func _on_sign_in_button_pressed():
	if sign_in_mail_input.text.length() == 0 or sign_in_password_input.text.length() == 0:
		return
	
	UserManager.signin_user(sign_in_mail_input.text, sign_in_password_input.text)

func _on_sign_up_button_pressed():
	if sign_up_mail_input.text.length() == 0 or sign_up_username_input.text.length() == 0 or sign_up_password_input.text.length() == 0 or sign_up_password_confirmation_input.text.length() == 0:
		return
		
	if sign_up_password_input.text != sign_up_password_confirmation_input.text:
		return
	
	UserManager.signup_user(sign_up_mail_input.text, sign_up_password_input.text)


func _on_switch_to_sign_up_pressed():
	_switch_to_sign_up()

func _on_switch_to_sign_in_pressed():
	_switch_to_sign_in()


func _on_sign_up_succeeded():
	_switch_to_sign_in()

func _on_sign_in_succeeded():
	emit_signal("sign_in_succeeded")

func _on_sign_up_failed(code: String, message: String):
	pass

func _on_sign_in_failed(code: String, message: String):
	pass
