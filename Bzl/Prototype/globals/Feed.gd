extends Node

var post_id = 0
var user_id = ""
var buzz_content = ""
var keywords = []
var time_created = 0
var duration = 0 #duration in seconds
var boosters = []
var comments = {} #contains user ID and content of the comment made
var username = ""

var post_data = {}
var feed_ref

func create_feed_ref(user_id):
	# Create the reference to the /feed/ node
	feed_ref = Firebase.Database.get_database_reference("/feed/")
	
	UpdateFeed()
	# Return the `feed_ref` reference so it can be used later
	return feed_ref


func CreatePost(user_id: String, buzz_content: String, keywords: Array, duration: int):
	# Increment the post_id for each new post
	post_id += 1
	
	# Set the time_created to the current time
	var time_created = OS.get_system_time_secs()
	
	# Set the boosters and comments to empty dictionaries
	var boosters = {}
	var comments = {}
	
	#set the username of the post!
	username = CurrentLogIn.logged_in_username
	# Create a dictionary with the post metadata
	post_data = {
		"user_id": user_id,
		"buzz_content": buzz_content,
		"keywords": keywords,
		"time_created": time_created,
		"duration": duration,
		"boosters": {},  # Initialize with empty dictionary
		"comments": {},
		"username": username
	}

	
	# Push the post_data dictionary to the feed_ref
	feed_ref.push(post_data)
	UpdateFeed()
	
func UpdateFeed():
	# Connect to the new_data_update signal of the feed_ref database reference
	feed_ref.connect("new_data_update", self, "_on_feed_updated")

func _on_feed_updated(update):
	# Get the new post data from the update
	var post_data = update.data
	# Get a reference to the BuzzContainer node
	var buzz_container = get_node("/root/Main/Background/HBoxContainer/FeedAndPost/VBoxContainer/FeedBackground/ScrollContainer/BuzzContainer")

	# Create a new Buzz scene instance and set its properties
	var buzz = load("res://Prototype/Buzzes/NewBuzz.tscn").instance()
	buzz.post_id = post_id
	buzz.user_id = post_data["user_id"]
	buzz.buzz_content = post_data["buzz_content"]
	buzz.keywords = post_data["keywords"]
	buzz.duration = post_data["duration"]
	
	# Check if the 'boosters' key exists in the 'post_data' dictionary
	if "boosters" in post_data:
		buzz.boosters = post_data["boosters"]
	else:
		buzz.boosters = {}
	
	if "comments" in post_data:
		buzz.comments = post_data["comments"]
	else:
		buzz.comments = {}
	
	buzz_container.add_child(buzz)
