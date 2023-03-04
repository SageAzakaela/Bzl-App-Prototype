extends Button


func _ready():
	# Connect to the signup_succeeded signal
	Firebase.Auth.connect("signup_succeeded", self, "_on_signup_succeeded")


func _on_CreateUserButton_pressed():
	# Get the email, and password from the input fields
	var email = get_node("../EnterEmail").text as String
	var password = get_node("../EnterPassword").text as String
	var password_confirmation = get_node("../EnterPasswordConfirmation").text

	# Check if the password and password confirmation match
	if password != password_confirmation:
		# Show an error message if the passwords don't match
		get_node("../../UserDataMessagePanel/Message").text = "Passwords do not match"
		get_node("../../UserDataMessagePanel/Message").visible = true
		return

	# Create the user with Firebase Authentication
	Firebase.Auth.signup_with_email_and_password(email, password)
	
func _on_signup_succeeded(auth_info: Dictionary):
	# Get the email and username from the Firebase Authentication result
	var email = auth_info["email"]

	# Create a new user in the database
	UserData.CreateUser(email)

	# Show a success message
	get_node("../../UserDataMessagePanel/Message").text = "Account created successfully"
	get_node("../../UserDataMessagePanel/Message").visible = true


