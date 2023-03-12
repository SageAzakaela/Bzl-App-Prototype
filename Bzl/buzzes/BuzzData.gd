extends Resource
class_name BuzzData


@export var bid: String
@export var title: String
@export var author: UserData = UserData.new()
@export var keywords: Array[String]
@export var timestamp: float
@export_multiline var content: String


func equals(buzz_data: BuzzData) -> bool:
	if bid != buzz_data.bid:
		return false
		
	if title != buzz_data.title:
		return false
		
	if author != buzz_data.author:
		return false
		
	for i in range(0, min(keywords.size(), buzz_data.keywords.size())):
		if keywords[i] != buzz_data.keywords[i]:
			return false
		
	if timestamp != buzz_data.timestamp:
		return false
		
	if content != buzz_data.content:
		return false
		
	return true

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
	
	var array_to_string_array = func(array): 
		var new: Array[String]
		for i in array: 
			new.append(i as String)
		return new
	
	var author_data = get_value_or_fallback.call("author", {})
	
	if author_data != {}:
		author.uid = author_data["uid"]
		author.username = author_data["username"]
	
	bid = get_value_or_fallback.call("bid", "")
	title = get_value_or_fallback.call("title", "")
	keywords = array_to_string_array.call(get_value_or_fallback.call("keywords", []))
	timestamp = get_value_or_fallback.call("timestamp", 0.0)
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
