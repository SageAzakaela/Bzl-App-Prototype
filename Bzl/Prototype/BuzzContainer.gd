extends VBoxContainer

func _process(delta):
	delete_expired_buzzes()
	

func delete_expired_buzzes():
	if CurrentLogIn.logged_in == true:
		for child in get_children():
			if child.Time_Remaining <= 0:
				var post_id = child.post_id
				var path = ("/feed/" + post_id as String)
				var db_ref = Firebase.Database.get_database_reference(path)
				db_ref.delete("/")
