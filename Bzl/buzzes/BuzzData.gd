extends Resource
class_name BuzzData


@export var bid: String
@export var title: String
@export var author: UserData
@export var keywords: Array[String]
@export var timestamp: int
@export_multiline var content: String


#------< functions >------#
func get_as_dict() -> Dictionary:
	var data: Dictionary = {
		"bid": bid,
		
		"title": title, 
		"author": author, 
		"keywords": keywords, 
		"timestamp": timestamp,
		"content": content 
	}
	
	return data

func set_with_dict(data: Dictionary):
	var get_value_or_fallback = func(key, fallback): return data[key] if key in data else fallback
	
	bid = get_value_or_fallback.call("bid", "")
	title = get_value_or_fallback.call("title", "")
	var author_uid = get_value_or_fallback.call("author", "")
	keywords = get_value_or_fallback.call("keywords", [])
	timestamp = get_value_or_fallback.call("timestamp", {})
	content = get_value_or_fallback.call("content", "")
	
	# TODO: get UserData with athor uid

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
