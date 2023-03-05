extends PanelContainer


# Declare member variables here. Examples:
export var Buzz_Text = ""
export var Keywords = []
export var Time_Remaining = 0
export var User = ""
export var User_Type = ""


export var buzz_key = ""

var buzz_content = ""
var keywords = []
var time_created = 0
var duration = 120 #duration in seconds
var boosters = []
var comments = {} #contains user ID and content of the comment made
var username = ""


var comments_ref
# Called when the node enters the scene tree for the first time.
func _ready():
	print(buzz_key)
	#set the buzz stuff
	Buzz_Text = buzz_content
	Keywords = keywords
	Time_Remaining = duration
	
	comments_ref = Firebase.Database.get_database_reference("/feed/" + buzz_key + "/comments")
	comments_ref.connect("new_data_update", self, "_on_new_comment")
	print("Buzz Text = ", Buzz_Text)
	print("Keywords for Buzz: ", Keywords)
	$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzText.text = Buzz_Text

	$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/Username.text = username
	
	
	## Lets export the Keywords to Labels for future yoinking
	if Keywords.size() > 0:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzTest2/Keyword1.text = ("#" + Keywords[0])
		$Keyword1.text = Keywords[0]
	if Keywords.size() > 1:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzTest2/Keyword2.text = ("#" + Keywords[1])
		$Keyword2.text = Keywords[1]
	if Keywords.size() > 2:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzTest2/Keyword3.text = ("#" + Keywords[2])
		$Keyword3.text = Keywords[2]
	if Keywords.size() > 3:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzTest2/Keyword4.text = ("#" + Keywords[3])
		$Keyword4.text = Keywords[3]
	if Keywords.size() > 4:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzTest2/Keyword5.text = ("#" + Keywords[4])
		$Keyword5.text = Keywords[4]
	if Keywords.size() > 5:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzTest2/Keyword6.text = ("#" + Keywords[5])
		$Keyword6.text = Keywords[5]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$VBoxContainer/Panel/HBoxContainer/PanelContainer3/TimeRemaining.text = Time_Remaining as String
	if Time_Remaining <= 0:
		Time_Remaining = 0


func _on_Timer_timeout():
	Time_Remaining -= 1


func _on_ExtendButton_pressed():
	Time_Remaining += 120
	$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/ExtendButton.disabled = true

	var user = CurrentLogIn.logged_in_username
#	UserData.add_user_points(user, 5)


func _on_Comments_toggled(button_pressed):
	if button_pressed == true:
		$VBoxContainer/CommentsSection.visible = true
	else:
		$VBoxContainer/CommentsSection.visible = false
		
func _on_BuzzBack_pressed():
	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment.visible = true

func _on_Submit_pressed():
	print("new comment")
	var comment_text = $VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment/CommentTextEntry.text
	var user_id = CurrentLogIn.logged_in_username
	var comment_data = {
		"content": comment_text,
		"user_id": user_id
	}
	
	# Add the comment to the database
	var db_ref = Firebase.Database.get_database_reference("/feed/" + buzz_key + "/comments")
	db_ref.push(comment_data)

	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment.visible = false
	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment/CommentTextEntry.clear()

func _on_Cancel_pressed():
	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment.visible = false
	
	

func _on_new_comment(resource):
	var comment_key = resource.key
	var comment_content = resource.data
	var specific_comment_ref = Firebase.Database.get_database_reference("/feed/" + buzz_key + "/comments/" + comment_key)
	
	var comment_instance = load("res://Prototype/Buzzes/Comment.tscn").instance()
	comment_instance.comment_text = comment_content.content
	comment_instance.user_id = comment_content.user_id
	$VBoxContainer/CommentsSection/VBoxContainer.add_child(comment_instance)
