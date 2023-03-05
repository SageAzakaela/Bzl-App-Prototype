extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var comment_text = ""
export var user_id = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	$CommentPanel/CommentLabel.text = comment_text
	$CommentPanel/UserID.text = user_id

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
