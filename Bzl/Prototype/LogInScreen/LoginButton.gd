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
		CurrentLogIn.logged_in_nectar = UserData.get_user_points(username)
		CurrentLogIn.logged_in_inventory = UserData.get_user_inventory(username)
		CurrentLogIn.logged_in_pronouns = UserData.get_user_pronouns(username)
		CurrentLogIn.logged_in_bio = UserData.get_user_bio(username)
		CurrentLogIn.avatar_color = UserData.get_avatar_color(username)
		CurrentLogIn.avatar_eyes = UserData.get_avatar_eyes(username)
		CurrentLogIn.avatar_eye_color = UserData.get_avatar_eye_color(username)
		CurrentLogIn.avatar_stripe = UserData.get_avatar_stripe(username)
		CurrentLogIn.avatar_stripe_color = UserData.get_avatar_stripe_color(username)
		CurrentLogIn.avatar_wing_color = UserData.get_avatar_wing_color(username)
		CurrentLogIn.avatar_antennae = UserData.get_avatar_antennae(username)
		CurrentLogIn.avatar_stinger = UserData.get_avatar_stinger(username)
	else:
		# Show an error message
		get_node("../../UserDataMessagePanel/Message").text = "Incorrect username or password"
		get_node("../../UserDataMessagePanel/Message").visible = true



func _on_EnterApp_pressed():
	get_node("../../..").visible = false
