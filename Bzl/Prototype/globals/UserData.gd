extends Node

var user_email = ""
var user_name = ""
var user_pronouns = ""
var user_bio = ""
var user_points = 0
var user_inventory = []
var user_data = {}

# Connect to the UserData signals
func _ready():
	UserData.connect("RetrieveUserData", self, "_on_user_data_retrieved")

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
	db_ref.push(user_data)

# Function to update a user's data in the database
func UpdateUserData(email, data):
	# Get a reference to the database path for this user
	var db_ref = Firebase.Database.get_database_reference("/users/" + email.replace(".", "_")).push(data)

# Function to retrieve a user's data from the database
func RetrieveUserData(email):
	# Get a reference to the database path for this user
	var db_ref = Firebase.Database.get_database_reference("/users/" + email.replace(".", "_"))

	# Retrieve the user data from the database
	db_ref.connect("new_data_update", self, "on_new_update")
	
# Handle new data updates
func on_new_update(data):
	if data.data:
		# Emit a signal with the user data dictionary
		emit_signal("user_data_retrieved", data.data)

# Handle user data retrieved signal
func _on_user_data_retrieved(data) -> Dictionary:
	# Extract the user data from the dictionary
	var user_data = {
		"name": data["name"],
		"pronouns": data["pronouns"],
		"bio": data["bio"],
		"points": data["points"],
		"inventory": data["inventory"]
	}
	return user_data
