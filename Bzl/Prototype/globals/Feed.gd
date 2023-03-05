extends Node

var buzz_content = ""
var keywords = []
var duration = 0 #duration in seconds
var boosters = []
var comments = {} #contains user ID and content of the comment made
var username = ""

var post_data = {}
var feed_ref
var new_post_ref
var _posts = {}
var _comments = {}
var _comments_refs

func create_feed_ref(user_id):
	# Create the reference to the /feed/ node
	feed_ref = Firebase.Database.get_database_reference("/feed/")
	
	# Connect the new_data_update signal of the feed_ref database reference
	feed_ref.connect("new_data_update", self, "_on_feed_updated")

#	# Create a new reference to the /feed/ node for _on_new_post
#	new_post_ref = Firebase.Database.get_database_reference("/feed/")
#	new_post_ref.connect("new_data_update", self, "_on_new_post")
	
	# Return the `feed_ref` reference so it can be used later
	return feed_ref
#
#func _on_new_post(resource):
#	var key = resource.key
#	var post_data = resource.data
#	_posts[key] = post_data
#	_comments[key] = {}
#
#	# Check if the comments reference exists
#	var comments_ref_path = "/feed/" + key as String + "/comments/"
#	print("Comments ref path:", comments_ref_path)
#	if _posts.has(key) and resource.data.has("comments"):
#		if _comments.has(key):
#			var comments_ref = Firebase.Database.get_database_reference(comments_ref_path)
#			comments_ref.connect("new_data_update", self, "_on_new_comment")
#		# Set the buzz_key for the buzz scene
#		var buzz_key = key
#		var buzz_container = get_node("/root/Main/Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer/BuzzContainer")
#		for child in buzz_container.get_children():
#			if child.name == "Buzz":
#				child.buzz_key = buzz_key
#	else:
#		pass



#
#func _on_new_comment(comment_resource):
#	# Get the key of the post from the comment resource
#	print("New comment fired")
#	var post_key = comment_resource.key
#
#	# Get the comment data from the comment resource
#	var comment_data = comment_resource.data
#
#	# Add the comment to the dictionary of comments for this post
#	_comments[post_key] = comment_data
#
#	# Add the comment to the post node in the tree view
#	_add_comment_to_post(post_key, comment_data)
#
#
#func _add_comment_to_post(post_key, comment_data):
#	# Find the buzz instance that corresponds to the post_key
#	var buzz = null
#	var buzz_container = get_node("/root/Main/Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer/BuzzContainer")
#
#	for child in buzz_container.get_children():
#		if "buzz_key" in child and child.buzz_key == post_key:
#			buzz = child
#
#	if buzz != null:
#		# Add the comment to the dictionary of comments for this post
#		if post_key in buzz.comments:
#			buzz.comments[post_key].append(comment_data)
#		else:
#			buzz.comments[post_key] = [comment_data]
#
#		# Update the UI to show the new comment
#		var comments_section = buzz.get_node("VBoxContainer/CommentsSection/VBoxContainer")
#		var comment = load("res://Prototype/Buzzes/Comment.tscn").instance()
#		comment.comment_text = comment_data.content
#		comments_section.add_child(comment)
#	else:
#		print("Buzz is null:", buzz)
#
func CreatePost(user_id: String, buzz_content: String, keywords: Array, duration: int):

	# Set the boosters and comments to empty dictionaries
	var boosters = {}
	var comments = {}

	#set the username of the post!
	username = user_id
	# Create a dictionary with the post metadata
	post_data = {
		"buzz_content": buzz_content,
		"keywords": keywords,
		"duration": duration,
		"boosters": {},  # Initialize with empty dictionary
		"comments": {},
		"username": username
	}


	# Push the post_data dictionary to the feed_ref
	feed_ref.push(post_data)

func _on_feed_updated(update):
	# Get the new post data from the update
	var post_data = update.data
	
	if post_data != null:  # Check if post_data is not null or nil
		# Get a reference to the BuzzContainer node
		var buzz_container = get_node("/root/Main/Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer/BuzzContainer")

		# Create a new Buzz scene instance and set its properties
		var buzz = load("res://Prototype/Buzzes/NewBuzz.tscn").instance()

		# Pass the corresponding key as an argument
		print("buzzkey is: ", update.key)
		buzz.buzz_key = update.key
		
		# Check if the 'buzz_content' key exists in the 'post_data' dictionary
		if "username" in post_data:
			buzz.username = post_data["username"]
		else:
			buzz.username = "Random Bzl"
		if "buzz_content" in post_data:
			buzz.buzz_content = post_data["buzz_content"]
		else:
			buzz.buzz_content = ""
		
		if "keywords" in post_data:
			buzz.keywords = post_data["keywords"]
		else:
			buzz.keywords = ""
		
		if "duration" in post_data:
			buzz.duration = post_data["duration"]
		else:
			buzz.duration = 0 # Or whatever default value you want to use

		# Check if the 'boosters' key exists in the 'post_data' dictionary
		if "boosters" in post_data:
			buzz.boosters = post_data["boosters"]
		else:
			buzz.boosters = {}
		
		if "comments" in post_data:
			buzz.comments = post_data["comments"]
		else:
			buzz.comments = {}
		
		print("Buzz instance created:", buzz)
		print("buzz_key set to:", buzz.buzz_key)
		print("buzz_content set to:", buzz.buzz_content)
		print("keywords set to:", buzz.keywords)

		buzz_container.add_child(buzz)
	else:
		print("post_data is null or nil")  # Print a message for debugging purposes
