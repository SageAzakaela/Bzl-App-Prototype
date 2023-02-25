extends Node

var users = {}

func _ready():
	# Load the JSON file containing the usernames and passwords
	var file = File.new()
	file.open("userdata.json", File.READ)
	var data = file.get_as_text()
	file.close()
	
	# Initialize the users dictionary as an empty dictionary
	users = {}
	
	# If the file is not empty, parse the JSON data
	if data != "":
		var parsed_data = JSON.parse(data)
		if parsed_data:
			users = parsed_data.result


func add_user(username, password):
	# Add the new username and password to the dictionary
	users[str(username)] = {"password": str(password), "pronouns": "They/Them", "bio": "No bio written yet! :("}
	
	# Save the updated dictionary to the JSON file
	var file = File.new()
	file.open("userdata.json", File.WRITE)
	file.store_string(JSON.print(users))
	file.close()

func set_user_pronouns(username, pronouns):
	# Update the user's pronouns in the dictionary
	users[username]["pronouns"] = pronouns
	# Update the CurrentLogIn.logged_in_pronouns value
	CurrentLogIn.logged_in_pronouns = pronouns
	# Save the updated dictionary to the JSON file
	var file = File.new()
	file.open("userdata.json", File.WRITE)
	file.store_string(JSON.print(users))
	file.close()

func set_user_bio(username, bio):
	# Update the user's bio in the dictionary
	users[username]["bio"] = bio
	# Update the CurrentLogIn.logged_in_pronouns value
	CurrentLogIn.logged_in_bio = bio
	# Save the updated dictionary to the JSON file
	var file = File.new()
	file.open("userdata.json", File.WRITE)
	file.store_string(JSON.print(users))
	file.close()

func check_user(username, password):
	# Check if the username and password combination is valid
	if username in users and users[username]["password"] == str(password):
		return true
	else:
		return false

func get_user_pronouns(username):
	if username in users:
		return users[username].get("pronouns")
	else:
		return "They/Them"


func get_user_bio(username):
	if username in users:
		return users[username].get("bio")
	else:
		return "No bio written yet! :("
