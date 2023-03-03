extends Area2D


signal pressed(origin)
signal deleted(origin)


var mouse_over := false
var initial_click_offset: Vector2


func _ready():
	set_process(false)


func _input(event):
	# handle drag and drop
	if event.is_action_pressed("left_click") and mouse_over:
		print(name)
		emit_signal("pressed", self)
		set_process(true)
		initial_click_offset = get_global_mouse_position() - position
		get_tree().set_input_as_handled()
	elif event.is_action_released("left_click"):
		set_process(false)
		
	# handle deletion
	if event.is_action_pressed("right_click") and mouse_over:
		emit_signal("deleted", self)
		queue_free()
		get_tree().set_input_as_handled()


func _process(_delta):
	position = get_global_mouse_position() - initial_click_offset


func _on_Drawable_mouse_entered():
	mouse_over = true


func _on_Drawable_mouse_exited():
	mouse_over = false
