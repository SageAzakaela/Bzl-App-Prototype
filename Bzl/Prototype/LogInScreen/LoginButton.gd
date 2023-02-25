extends Button

func _on_LoginButton_pressed():
	# Get the username and password from the input fields
	var username = get_node("../EnterUsername").text
	var password = get_node("../EnterPassword").text

	# Check if the username and password combination is valid
	if UserData.check_user(username, password):
		# Show a success message
		get_node("../../UserDataMessagePanel/Message").text = "Login successful"
		get_node("../../UserDataMessagePanel/Message").visible = true
		get_node("../../EnterApp").visible = true

		# Retrieve the user's pronoun and bio information
		CurrentLogIn.logged_in_username = username
		CurrentLogIn.logged_in_pronouns = UserData.get_user_pronouns(username)
		CurrentLogIn.logged_in_bio = UserData.get_user_bio(username)
	else:
		# Show an error message
		get_node("../../UserDataMessagePanel/Message").text = "Incorrect username or password"
		get_node("../../UserDataMessagePanel/Message").visible = true



func _on_EnterApp_pressed():
	get_node("../../..").visible = false
