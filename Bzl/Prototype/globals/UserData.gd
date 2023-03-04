extends Node

var user_email = ""
var user_name = ""
var user_pronouns = ""
var user_bio = ""
var user_points = 0
var user_inventory = []
var user_data = {}

# Function to create a new user in the database
func CreateUser(email):
	# Set the user data
	user_data = {
		"email": email,
		"name": "RandomBzl",
		"pronouns": "They/Them",
		"bio": "No Bio Defined",
		"points": 0,
		"inventory": []
	}

	# Get a reference to the database path for this user
	var db_ref = Firebase.Database.get_database_reference("/users/" + email.replace(".", "_"))

	# Add the user data to the database
	db_ref.update("/", user_data)


# Function to update a user's data in the database
func UpdateUserData(email: String, data: Dictionary):
	# Replace the period in the email with an underscore to create a valid path
	var path = "/users/" + email.replace(".", "_")
	# Get a reference to the database path for this user
	var db_ref = Firebase.Database.get_database_reference("/")
	# Update the user's data in the database
	db_ref.update(path, data)
