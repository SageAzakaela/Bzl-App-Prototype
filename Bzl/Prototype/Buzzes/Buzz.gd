extends Panel


# Declare member variables here. Examples:
export var Buzz_Text = ""
export var Keywords = []
export var Time_Remaining = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Buzz Text = ", Buzz_Text)
	print("Keywords for Buzz: ", Keywords)
	$HBoxContainer/BuzzText.text = Buzz_Text
	$HBoxContainer/User.text = CurrentLogIn.logged_in_username as String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HBoxContainer/TimeRemaining.text = Time_Remaining as String
	if Time_Remaining <= 0:
		queue_free()

func _on_Timer_timeout():
	Time_Remaining -= 1


func _on_ExtendButton_pressed():
	Time_Remaining += 120
	$HBoxContainer/ExtendButton.disabled = true


func _on_Comments_toggled(button_pressed):
	if button_pressed == true:
		$CommentsSection.visible = true
	else:
		$CommentsSection.visible = false
		
func _on_BuzzBack_pressed():
	$CommentsSection/VBoxContainer/LeaveAComment.visible = true

func _on_Submit_pressed():
	$CommentsSection/VBoxContainer/LeaveAComment.visible = false
	var comment = load("res://Prototype/Buzzes/Comment.tscn").instance()
	comment.comment_text = $CommentsSection/VBoxContainer/LeaveAComment/CommentTextEntry.text
	$CommentsSection/VBoxContainer.add_child(comment)

func _on_Cancel_pressed():
	$CommentsSection/VBoxContainer/LeaveAComment.visible = false



