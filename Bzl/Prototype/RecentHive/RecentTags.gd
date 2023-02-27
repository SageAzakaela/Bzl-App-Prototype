extends ScrollContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Buzz feed
onready var Buzz_Feed = get_node("../ScrollContainer/BuzzContainer")
onready var RecentHiveContainer = $RecentHiveContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_recent_hives():
	print("Checking Recent Hives")
	for child in RecentHiveContainer.get_children():
		# Remove the current child from the RecentHiveContainer node
		RecentHiveContainer.remove_child(child)
	# Create a dictionary to store the count of each keyword
	var keyword_counts = {}

	# Loop through all the children of the BuzzContainer
	for child in Buzz_Feed.get_children():
		# Check if the child has nodes for each keyword
		if child.has_node("Keyword1") and child.has_node("Keyword2") and child.has_node("Keyword3") and child.has_node("Keyword4") and child.has_node("Keyword5") and child.has_node("Keyword6"):
			# Get the keyword nodes
			var keyword1 = child.get_node("Keyword1")
			var keyword2 = child.get_node("Keyword2")
			var keyword3 = child.get_node("Keyword3")
			var keyword4 = child.get_node("Keyword4")
			var keyword5 = child.get_node("Keyword5")
			var keyword6 = child.get_node("Keyword6")

			# Get the text of each keyword node
			var keyword_text1 = keyword1.text.to_lower()
			var keyword_text2 = keyword2.text.to_lower()
			var keyword_text3 = keyword3.text.to_lower()
			var keyword_text4 = keyword4.text.to_lower()
			var keyword_text5 = keyword5.text.to_lower()
			var keyword_text6 = keyword6.text.to_lower()

			# Update the count for each keyword
			if keyword_text1 != "":
				if keyword_text1 in keyword_counts:
					keyword_counts[keyword_text1] += 1
				else:
					keyword_counts[keyword_text1] = 1
			if keyword_text2 != "":
				if keyword_text2 in keyword_counts:
					keyword_counts[keyword_text2] += 1
				else:
					keyword_counts[keyword_text2] = 1
			if keyword_text3 != "":
				if keyword_text3 in keyword_counts:
					keyword_counts[keyword_text3] += 1
				else:
					keyword_counts[keyword_text3] = 1
			if keyword_text4 != "":
				if keyword_text4 in keyword_counts:
					keyword_counts[keyword_text4] += 1
				else:
					keyword_counts[keyword_text4] = 1
			if keyword_text5 != "":
				if keyword_text5 in keyword_counts:
					keyword_counts[keyword_text5] += 1
				else:
					keyword_counts[keyword_text5] = 1
			if keyword_text6 != "":
				if keyword_text6 in keyword_counts:
					keyword_counts[keyword_text6] += 1
				else:
					keyword_counts[keyword_text6] = 1
	# Loop through each keyword in the keyword_counts dictionary
	for keyword in keyword_counts:
		# Create a new RecentHive node for each keyword
		var new_hive = load("res://Prototype/RecentHive/RecentHive.tscn").instance()
		RecentHiveContainer.add_child(new_hive)

		# Set the text of each RecentHive node to the corresponding keyword
		new_hive.RecentHiveName.text = keyword + " (" + str(keyword_counts[keyword]) + ")"







func _on_BrowseRecent_pressed():
		update_recent_hives()
