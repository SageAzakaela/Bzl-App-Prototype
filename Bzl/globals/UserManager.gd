extends Node


var user: User


func create_user():
	if user == null:
		push_warning("No active user assigned")
		return
	
	# Get a reference to the user database path
	var db_ref = Firebase.Database.get_database_reference("/test/users/" + user.db_id)
	
	db_ref.connect("new_data_update", func(data): user.db_id = data["db_id"])
	db_ref.connect("patch_data_update", func(data): user.set_with_dict(data))
	
	# Add user to the data base
	db_ref.update("/", user.get_as_dict())


func get_user(db_id: String) -> User:
	var db_ref = Firebase.Database.get_database_reference("/test/users/" + db_id)
	
	return User.new().set_with_dict(db_ref.get_data())
	

func calculate_hash(email: String, password: String) -> String:
	return "uid" + str(hash(email + password))


func update_user():
	if user == null:
		push_warning("No active user assigned")
		return
	
	# Get a reference to the database path for this user
	var db_ref = Firebase.Database.get_database_reference("/test/users/" + user.db_id)
	
	# Update the user's data in the database
	db_ref.update("/", user.get_as_dict())
