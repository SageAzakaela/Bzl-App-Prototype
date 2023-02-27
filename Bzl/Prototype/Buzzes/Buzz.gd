extends PanelContainer


# Declare member variables here. Examples:
export var Buzz_Text = ""
export var Keywords = []
export var Time_Remaining = 0
export var User = ""
export var User_Type = ""





# Called when the node enters the scene tree for the first time.
func _ready():
	print("Buzz Text = ", Buzz_Text)
	print("Keywords for Buzz: ", Keywords)
	$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/BuzzText.text = Buzz_Text

	if User_Type == "NPC":
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/Username.text = User
	else:
		$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/Username.text = CurrentLogIn.logged_in_username as String
	
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
		queue_free()

func _on_Timer_timeout():
	Time_Remaining -= 1


func _on_ExtendButton_pressed():
	Time_Remaining += 120
	$VBoxContainer/Panel/HBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/ExtendButton.disabled = true


func _on_Comments_toggled(button_pressed):
	if button_pressed == true:
		$VBoxContainer/CommentsSection.visible = true
	else:
		$VBoxContainer/CommentsSection.visible = false
		
func _on_BuzzBack_pressed():
	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment.visible = true

func _on_Submit_pressed():
	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment.visible = false
	var comment = load("res://Prototype/Buzzes/Comment.tscn").instance()
	comment.comment_text = $VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment/CommentTextEntry.text
	$VBoxContainer/CommentsSection/VBoxContainer.add_child(comment)

func _on_Cancel_pressed():
	$VBoxContainer/CommentsSection/VBoxContainer/LeaveAComment.visible = false



