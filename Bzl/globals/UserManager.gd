extends Node


signal on_user_signup_succeeded(user: User)
signal on_user_signin_succeeded(user: User)
signal on_user_signup_failed(code: float, message: String)
signal on_user_signin_failed(code: float, message: String)

var _temporary_user_data: User


func _ready():
	Firebase.Auth.connect("signup_succeeded", _on_signup_succeeded)
	Firebase.Auth.connect("login_succeeded", _on_signin_succeeded)
	
	Firebase.Auth.connect("signup_failed", _on_signup_failed)
	Firebase.Auth.connect("login_failed", _on_signin_failed)
	
	#signin_user("testmail0@gmail.com", "test1234")
	#var user := await get_user(calculate_hash("testmail0@gmail.com", "test1234"))
	#print(user.get_as_dict())


func signup_user(email: String, password: String):
	_temporary_user_data = User.new()
	
	_temporary_user_data.db_id = calculate_hash(email, password)
	_temporary_user_data.email = email
	
	Firebase.Auth.signup_with_email_and_password(email, password)


func signin_user(email: String, password: String):
	Firebase.Auth.login_with_email_and_password(email, password)


func get_user(uid: String) -> User:
	var document_task : FirestoreTask = DBManager.users_collection.get_doc(uid)
	var document : FirestoreDocument = await document_task.get_document
	
	var user_data := FirestoreDocument.fields2dict(document.document)
	var user := User.new()
	user.set_with_dict(user_data)
	
	return user


# -----< Helpers >----- #
func calculate_hash(email: String, password: String) -> String:
	return "uid" + str(hash(email + password))


# -----< Signals >----- #
func _on_signup_succeeded(auth_info: Dictionary):
	var add_task : FirestoreTask = DBManager.users_collection.add(_temporary_user_data.db_id, _temporary_user_data.get_as_dict())
	var document : FirestoreTask = await add_task.task_finished
	
	emit_signal("on_user_signup_succeeded", _temporary_user_data)
	_temporary_user_data = null

func _on_signup_failed(code: float, message: String):
	emit_signal("on_user_signup_failed", code, message)
	_temporary_user_data = null

func _on_signin_succeeded(auth_info: Dictionary):
	emit_signal("on_user_signin_succeeded", _temporary_user_data)
	_temporary_user_data = null
	
func _on_signin_failed(code: float, message: String):
	emit_signal("on_user_signin_failed", code, message)
	_temporary_user_data = null
