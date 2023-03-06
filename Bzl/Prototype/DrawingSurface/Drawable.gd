extends Area2D


var drawable_spawner
var initial_click_offset: Vector2



func _ready():
	disable()
	

func _process(_delta):
	position = get_global_mouse_position() - initial_click_offset


func enable():
	set_process(true)
	initial_click_offset = get_global_mouse_position() - position


func disable():
	set_process(false)


func _on_Drawable_mouse_entered():
	if drawable_spawner != null:
		drawable_spawner._add_to_hovered(self)


func _on_Drawable_mouse_exited():
	if drawable_spawner != null:
		drawable_spawner._remove_from_hovered(self)
