extends Node

var users = {}

func _ready():
	# Load the JSON file containing the usernames and passwords
	var file := FileAccess.open("userdata.json", FileAccess.READ_WRITE)
	var data = file.get_as_text()
	file.close()
	
	# Initialize the users dictionary as an empty dictionary
	users = {}
	
	# If the file is not empty, parse the JSON data
	if data != "":
		var test_json_conv = JSON.new()
		test_json_conv.parse(data)
		var parsed_data = test_json_conv.get_data()
		if parsed_data:
			users = parsed_data.result

func save_to_file():
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func add_user(username, password):
	# Add the new username and password to the dictionary
	users[str(username)] = {"password": str(password), "pronouns": "They/Them", "bio": "No bio written yet! :(", "nectar": 0, "inventory": []}
	
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_user_inventory(username):
	if username in users:
		return users[username].get("inventory")
	else:
		return 0
		
func add_item_to_inventory(username, item):
	# Add the item to the user's inventory
	users[username]["inventory"].append(item)
#	CurrentLogIn.logged_in_inventory.append(item)
	# Save the updated dictionary to the JSON file
	save_to_file()
	
	print("Item added to inventory:", item)


func remove_item_from_inventory(username, item):
	# Remove the item from the user's inventory
	users[username]["inventory"].remove(item)
#	CurrentLogIn.logged_in_inventory.remove(item)
	# Save the updated dictionary to the JSON file
	save_to_file()
	

func get_user_points(username):
	if username in users:
		return users[username].get("nectar")
	else:
		return 0
		
func set_user_points(username, points):
	# Update the user's pronouns in the dictionary
	users[username]["nectar"] = points
	# Update the CurrentLogIn.logged_in_pronouns value
	CurrentLogIn.logged_in_nectar = points
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()
	
	
func add_user_points(username, points):
	# Add points to the user's nectar total
	users[username]["nectar"] += points
	CurrentLogIn.logged_in_nectar += points
	# Save the updated dictionary to the JSON file
	save_to_file()


func remove_user_points(username, points):
	# Add points to the user's nectar total
	users[username]["nectar"] -= points
	CurrentLogIn.logged_in_nectar -= points
	# Save the updated dictionary to the JSON file
	save_to_file()
	

func set_user_pronouns(username, pronouns):
	# Update the user's pronouns in the dictionary
	users[username]["pronouns"] = pronouns
	# Update the CurrentLogIn.logged_in_pronouns value
	CurrentLogIn.logged_in_pronouns = pronouns
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func set_user_bio(username, bio):
	# Update the user's bio in the dictionary
	users[username]["bio"] = bio
	# Update the CurrentLogIn.logged_in_pronouns value
	CurrentLogIn.logged_in_bio = bio
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
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
		
		


### AVATAR NONSENSE


func set_avatar_color(username, color):
	# Update the user's avatar color in the dictionary
	users[username]["avatar_color"] = color
	# Update the CurrentLogIn.avatar_color value
	CurrentLogIn.avatar_color = color
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()


func get_avatar_color(username):
	if username in users:
		return users[str(username)].get("avatar_color", 0)
	else:
		return 0

func set_avatar_eyes(username, eyes):
	# Update the user's eye value in the dictionary
	users[username]["avatar_eyes"] = eyes
	# Update the CurrentLogIn.avatar_eyes value
	CurrentLogIn.avatar_eyes = eyes
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()


func get_avatar_eyes(username):
	if username in users:
		return users[str(username)].get("avatar_eyes", 0)
	else:
		return 0

func set_avatar_eye_color(username, eye_color):
	users[username]["avatar_eye_color"] = eye_color
	CurrentLogIn.avatar_eye_color = eye_color
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_avatar_eye_color(username):
	if username in users:
		return users[str(username)].get("avatar_eye_color", 0)
	else:
		return 0

func set_avatar_wing_color(username, wing_color):
	users[username]["avatar_wing_color"] = wing_color
	CurrentLogIn.avatar_wing_color = wing_color
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_avatar_wing_color(username):
	if username in users:
		return users[str(username)].get("avatar_wing_color", 0)
	else:
		return 0

func set_avatar_stripe(username, stripe):
	users[username]["avatar_stripe"] = stripe
	CurrentLogIn.avatar_stripe = stripe
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_avatar_stripe(username):
	if username in users:
		return users[str(username)].get("avatar_stripe", 0)
	else:
		return 0

func set_avatar_stripe_color(username, stripe_color):
	users[username]["avatar_stripe_color"] = stripe_color
	CurrentLogIn.avatar_stripe_color = stripe_color
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_avatar_stripe_color(username):
	if username in users:
		return users[str(username)].get("avatar_stripe_color", 0)
	else:
		return 0

func set_avatar_antennae(username, antennae_value):
	# Update the user's antennae value in the dictionary
	users[username]["antennae"] = antennae_value
	# Update the CurrentLogIn.avatar_antennae value
	CurrentLogIn.avatar_antennae = antennae_value
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_avatar_antennae(username):
	if username in users:
		return users[str(username)].get("antennae", 0)
	else:
		return 0

func set_avatar_stinger(username, stinger_value):
	# Update the user's stinger value in the dictionary
	users[username]["stinger"] = stinger_value
	# Update the CurrentLogIn.avatar_stinger value
	CurrentLogIn.avatar_stinger = stinger_value
	# Save the updated dictionary to the JSON file
	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(users))
	file.close()

func get_avatar_stinger(username):
	if username in users:
		return users[str(username)].get("stinger", 0)
	else:
		return 0

