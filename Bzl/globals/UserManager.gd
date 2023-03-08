extends Node


signal sign_up_succeeded
signal sign_in_succeeded
signal sign_up_failed(code: float, message: String)
signal sign_in_failed(code: float, message: String)

var _active_user: User : get = get_active_user


# -----< Getter / Setter >----- #
func get_active_user() -> User:
	return _active_user


# -----< Connecting Signals >----- #
func _ready():
	Firebase.Auth.connect("signup_succeeded", on_sign_up_succeeded)
	Firebase.Auth.connect("login_succeeded", on_sign_in_succeeded)
	
	Firebase.Auth.connect("signup_failed", on_sign_up_failed)
	Firebase.Auth.connect("login_failed", on_sign_in_failed)
	
	#signin_user("testmail0@gmail.com", "test1234")
	#var user := await get_user(calculate_hash("testmail0@gmail.com", "test1234"))
	#print(user.get_as_dict())


# -----< Authentication >----- #
func signup_user(email: String, password: String):
	_active_user = User.new()
	
	_active_user.uid = calculate_hash(email, password)
	_active_user.email = email
	
	Firebase.Auth.signup_with_email_and_password(email, password)

func signin_user(email: String, password: String):
	_active_user = User.new()
	_active_user.uid = calculate_hash(email, password)
	_active_user.email = email
	
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
func on_sign_up_succeeded(auth_info: Dictionary):
	var add_task : FirestoreTask = DBManager.users_collection.add(_active_user.uid, _active_user.get_as_dict())
	var document : FirestoreTask = await add_task.task_finished
	
	emit_signal("sign_up_succeeded")

func on_sign_in_succeeded(auth_info: Dictionary):
	_active_user = await get_user(_active_user.uid)
	
	emit_signal("sign_in_succeeded")

func on_sign_up_failed(code: float, message: String):
	emit_signal("sign_up_failed", code, message)
	_active_user = null

func on_sign_in_failed(code: float, message: String):
	emit_signal("sign_in_failed", code, message)
	_active_user = null
