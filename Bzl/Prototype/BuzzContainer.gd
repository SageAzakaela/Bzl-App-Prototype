extends VBoxContainer

func _process(delta):
	delete_expired_buzzes()
	

func delete_expired_buzzes():
	if CurrentLogIn.logged_in == true:
		for child in get_children():
			if child.Time_Remaining <= 0:
				var buzz_key = child.buzz_key
				var path = ("/feed/" + buzz_key + "/")
				var db_ref = Firebase.Database.get_database_reference(path)
				child.queue_free()
				remove_child(child)
				Feed._posts.erase(buzz_key)
				db_ref.delete("/")

