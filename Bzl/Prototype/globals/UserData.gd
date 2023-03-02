extends Node

var user_email = ""
var user_name = ""
var user_pronouns = ""
var user_bio = ""
var user_points = 0
var user_inventory = []


# Function to create a new user in the database
func CreateUser(email, username):
	# Set the user data
	var user_data = {
		"email": email,
		"name": username,
		"pronouns": "They/Them",
		"bio": "No Bio Defined",
		"points": 0,
		"inventory": []
	}

	# Get a reference to the database path for this user
	var db_ref = Firebase.Database.get_database_reference("/users/" + email.replace(".", "_"))

	# Add the user data to the database
	db_ref.push(user_data)

