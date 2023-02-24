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
	users[str(username)] = str(password)
	
	# Save the updated dictionary to the JSON file
	var file = File.new()
	file.open("userdata.json", File.WRITE)
	file.store_string(JSON.print(users))
	file.close()



func check_user(username, password):
	# Check if the username and password combination is valid
	if username in users and users[username] == str(password):
		return true
	else:
		return false
