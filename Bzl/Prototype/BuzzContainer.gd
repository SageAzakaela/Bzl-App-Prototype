extends VBoxContainer



	

func _process(delta):
	delete_expired_buzzes()
	
func delete_expired_buzzes():
	if CurrentLogIn.logged_in == true:
		for child in get_children():
			if child is Timer:
				continue  # skip timer node
			if child.Time_Remaining as int <= 0:
				var buzz_key = child.buzz_key
				var path = ("/feed/" + buzz_key + "/")
				var db_ref = Firebase.Database.get_database_reference(path)
				child.queue_free()
				remove_child(child)
				Feed._posts.erase(buzz_key)
				db_ref.delete("/")

func update_duration_of_buzzes():
	if CurrentLogIn.logged_in == true:
		for child in get_children():
			if child is Timer:
				continue  # skip timer node
			var buzz_key = child.buzz_key
			var current_time_remaining = {"duration": child.Time_Remaining}
			var buzz_ref = Firebase.Database.get_database_reference("/feed/")
			buzz_ref.update(buzz_key, current_time_remaining)

func _on_Timer_timeout():
	update_duration_of_buzzes()
