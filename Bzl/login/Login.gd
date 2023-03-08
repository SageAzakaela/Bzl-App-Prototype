extends Control


signal successfully_authenticated

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


func _ready():
	#Firebase.Auth.connect("signup_succeeded", _on_signup_succeeded)
	#Firebase.Auth.connect("login_succeeded", _on_signin_succeeded)
	pass


func sign_in():
	if sign_in_mail_input.text.length() == 0 or sign_in_password_input.text.length() == 0:
		return
	
	print("Signing in")
	
	temporary_email = sign_up_mail_input.text
	temporary_username = sign_up_username_input.text
	temporary_password = sign_up_password_input.text
	
	#Firebase.Auth.login_with_email_and_password(temporary_email, temporary_password)


func _on_sign_in_button_pressed():
	#sign_in()
	pass


func _on_sign_up_button_pressed():
	if sign_up_mail_input.text.length() == 0 or sign_up_username_input.text.length() == 0 or sign_up_password_input.text.length() == 0 or sign_up_password_confirmation_input.text.length() == 0:
		return
		
	if sign_up_password_input.text != sign_up_password_confirmation_input.text:
		print("Password confirmation does not match")
		return
	
	print("Signing up")
	
	temporary_email = sign_up_mail_input.text
	temporary_username = sign_up_username_input.text
	temporary_password = sign_up_password_input.text
	
	#Firebase.Auth.signup_with_email_and_password(temporary_email, temporary_password)


func _on_signup_succeeded(data):
	print("Signed up")
	
	var user := User.new()
	user.email = temporary_email
	user.username = temporary_username
	user.db_id = UserManager.calculate_hash(temporary_email, temporary_password)
	
	UserManager.user = user
	UserManager.create_user()
	
	sign_in()


func _on_signin_succeeded(data):
	print("Signed in") 
	
	UserManager.user = await UserManager.get_user(UserManager.calculate_hash(temporary_email, temporary_password))
	
	emit_signal("successfully_authenticated")


func _on_switch_to_sign_up_pressed():
	sign_in_form.hide()
	sign_up_form.show()
	

func _on_switch_to_sign_in_pressed():
	sign_up_form.hide()
	sign_in_form.show()
