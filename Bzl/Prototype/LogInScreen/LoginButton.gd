extends Button

func _on_LoginButton_pressed():
	# Get the email and password from the input fields
	var email = get_node("../EnterEmail").text
	var password = get_node("../EnterPassword").text

	# Try to login with the email and password
	Firebase.Auth.login_with_email_and_password(email, password)

func _on_EnterApp_pressed():
	get_node("../../..").visible = false

# Connect to Firebase.Auth signals
func _ready():
	Firebase.Auth.connect("login_succeeded", self, "_on_login_succeeded")
	Firebase.Auth.connect("login_failed", self, "_on_login_failed")

# Handle login success
func _on_login_succeeded(auth_info):
	# Show a success message
	get_node("../../UserDataMessagePanel/Message").text = "Login successful"
	get_node("../../UserDataMessagePanel/Message").visible = true
	get_node("../../EnterApp").visible = true

	# Retrieve the user's information using the auth_info dictionary
	# (e.g. auth_info["localId"], auth_info["email"], etc.)

# Handle login failure
func _on_login_failed(code, message):
	# Show an error message
	get_node("../../UserDataMessagePanel/Message").text = "Incorrect email or password"
	get_node("../../UserDataMessagePanel/Message").visible = true

