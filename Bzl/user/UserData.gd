extends Resource
class_name UserData


@export var uid: String

@export var username: String
@export var email: String
@export var pronouns: String
@export var bio: String

@export var nectar: int


#------< avatar stuff >------#
signal avatar_color_changed
signal avatar_eyes_changed
signal avatar_eye_color_changed
signal avatar_wing_color_changed
signal avatar_stripe_changed
signal avatar_stripe_color_changed
signal avatar_antennae_changed
signal avatar_stinger_changed

@export var avatar_color 		:= 0 : set = set_avatar_color
@export var avatar_eyes 		:= 0 : set = set_avatar_eyes
@export var avatar_eye_color 	:= 0 : set = set_avatar_eye_color
@export var avatar_wing_color 	:= 0 : set = set_avatar_wing_color
@export var avatar_stripe 		:= 0 : set = set_avatar_stripe
@export var avatar_stripe_color := 0 : set = set_avatar_stripe_color
@export var avatar_antennae 	:= 0 : set = set_avatar_antennae
@export var avatar_stinger 		:= 0 : set = set_avatar_stinger


func set_avatar_color(value: int):
	avatar_color = value
	emit_signal("avatar_color_changed")

func set_avatar_eyes(value: int):
	avatar_eyes = value
	emit_signal("avatar_eyes_changed")
	
func set_avatar_eye_color(value: int):
	avatar_eye_color = value
	emit_signal("avatar_eye_color_changed")
	
func set_avatar_wing_color(value: int):
	avatar_wing_color = value
	emit_signal("avatar_wing_color_changed")
	
func set_avatar_stripe(value: int):
	avatar_stripe = value
	emit_signal("avatar_stripe_changed")
	
func set_avatar_stripe_color(value: int):
	avatar_stripe_color = value
	emit_signal("avatar_stripe_color_changed")

func set_avatar_antennae(value: int):
	avatar_antennae = value
	emit_signal("avatar_antennae_changed")
	
func set_avatar_stinger(value: int):
	avatar_stinger = value
	emit_signal("avatar_stinger_changed")


#------< functions >------#
func get_as_dict() -> Dictionary:
	var data: Dictionary = {
		"uid": uid,
		
		"username": username, 
		"email": email, 
		"pronouns": pronouns, 
		"bio": bio, 
		
		"nectar": nectar,
		
		"avatar_color": avatar_color,
		"avatar_eyes": avatar_eyes,
		"avatar_eye_color": avatar_eye_color,
		"avatar_wing_color": avatar_wing_color,
		"avatar_stripe": avatar_stripe,
		"avatar_stripe_color": avatar_stripe_color,
		"avatar_antennae": avatar_antennae,
		"avatar_stinger": avatar_stinger
	}
	
	return data

func set_with_dict(data: Dictionary):
	var get_value_or_fallback = func(key, fallback): return data[key] if key in data else fallback
	
	uid = get_value_or_fallback.call("uid", "")
	username = get_value_or_fallback.call("username", "")
	email = get_value_or_fallback.call("email", "")
	pronouns = get_value_or_fallback.call("pronouns", "")
	bio = get_value_or_fallback.call("bio", "")
	nectar = get_value_or_fallback.call("nectar", 0)
	avatar_color = get_value_or_fallback.call("avatar_color", 0)
	avatar_eyes = get_value_or_fallback.call("avatar_eyes", 0)
	avatar_eye_color = get_value_or_fallback.call("avatar_eye_color", 0)
	avatar_wing_color = get_value_or_fallback.call("avatar_wing_color", 0)
	avatar_stripe = get_value_or_fallback.call("avatar_stripe", 0)
	avatar_stripe_color = get_value_or_fallback.call("avatar_stripe_color", 0)
	avatar_antennae = get_value_or_fallback.call("avatar_antennae", 0)
	avatar_stinger = get_value_or_fallback.call("avatar_stinger", 0)

func get_as_json() -> String:
	return JSON.stringify(get_as_dict())
	
func set_with_json(data: String):
	var json := JSON.new()
	var error = json.parse(data)
	
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_DICTIONARY:
			set_with_dict(json.data)
			
		else:
			print("Unexpected user data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", data, " at line ", json.get_error_line())
