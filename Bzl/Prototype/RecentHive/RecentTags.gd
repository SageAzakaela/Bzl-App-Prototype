extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#lol buzz feed
onready var Buzz_Feed = get_node("../ScrollContainer/BuzzContainer")
onready var RecentHiveContainer = $RecentHiveContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_recent_hives(keywords):
	# Remove any existing children from the RecentHiveContainer
	RecentHiveContainer.clear()
	# Iterate over the list of keywords
	# Loop through all the children of the BuzzContainer
	for child in Buzz_Feed.get_children():
		# Cast the child to a Buzz node
		var buzz = cast(child, Buzz)

		# If the child is a Buzz node and has keywords
		if buzz and buzz.keywords.size() > 0:
			# Loop through the keywords in the buzz
			for keyword in buzz.keywords:
				# Create a new RecentHive node
				var recent_hive = recent_hive_container.instance()

				# Set the text of the RecentHive node to the keyword
				recent_hive.text = keyword

				# Add the RecentHive node to the RecentHiveContainer
				RecentHiveContainer.add_child(recent_hive)
