extends Button

func _on_CreateUserButton_pressed():
	# Get the username, password, and password confirmation from the input fields
	var username = get_node("../EnterUsername").text as String
	var password = get_node("../EnterPassword").text as String
	var password_confirmation = get_node("../EnterPasswordConfirmation").text

	# Check if the password and password confirmation match
	if password != password_confirmation:
		# Show an error message if the passwords don't match
		get_node("../../UserDataMessagePanel/Message").text = "Passwords do not match"
		get_node("../../UserDataMessagePanel/Message").visible = true
		return
	
	# Check if the username is already taken
	if UserData.check_user(username, password):
		# Show an error message if the username is already taken
		get_node("../../UserDataMessagePanel/Message").text = "Username is already taken"
		get_node("../../UserDataMessagePanel/Message").visible = true
		return

	# Add the new user to the UserData script
	UserData.add_user(username, password)

	# Show a success message
	get_node("../../UserDataMessagePanel/Message").text = "Account created successfully"
	get_node("../../UserDataMessagePanel/Message").visible = true
