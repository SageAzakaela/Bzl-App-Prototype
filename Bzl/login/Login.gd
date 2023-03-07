extends Control


signal successfully_authenticated

var temporary_user: User

@onready var sign_in_mail_input := $SignIn/MailHBox/Mail
@onready var sign_in_password_input := $SignIn/PasswordHBox/Password

@onready var sign_up_mail_input := $SignUp/MailHBox/Mail
@onready var sign_up_username_input := $SignUp/UsernameHBox/Username
@onready var sign_up_password_input := $SignUp/PasswordHBox/Password
@onready var sign_up_password_confirmation_input := $SignUp/PasswordConfirmationHBox/PasswordConfirmation


func _ready():
	Firebase.Auth.connect("signup_succeeded", _on_signup_succeeded)


func sign_in():
	if UserData.check_user(sign_in_mail_input.text, sign_in_password_input.text):
		emit_signal("successfully_authenticated")


func _on_sign_in_button_pressed():
	sign_in()


func _on_sign_up_button_pressed():
	if sign_up_mail_input.text.length() == 0 or sign_up_username_input.text.length() == 0 or sign_up_password_input.text.size() == 0 or sign_up_password_confirmation_input.text.size() == 0:
		return
		
	if sign_up_password_input.text != sign_up_password_confirmation_input.text:
		print("Password confirmation does not match")
		return
	
	temporary_user = User.new()
	
	temporary_user.email = sign_up_mail_input.text
	temporary_user.username = sign_up_username_input.text
	
	Firebase.Auth.signup_with_email_and_password(sign_up_mail_input.text, sign_up_password_input.text)	


func _on_signup_succeeded(data):
	UserManager.user = temporary_user
	temporary_user = null
	
	UserManager.create_user()
	
	sign_in()
