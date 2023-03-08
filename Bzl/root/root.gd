extends Node


@export var min_window_size: Vector2
@export var max_window_size: Vector2


func _ready():
	var min_size := Vector2(min(min_window_size.x, max_window_size.x), min(min_window_size.y, max_window_size.y))
	var max_size := Vector2(max(min_window_size.x, max_window_size.x), max(min_window_size.y, max_window_size.y))
	
	get_window().min_size = min_size
	get_window().max_size = max_size


func _on_sign_in_succeeded():
	$GUI.visible = true
	$Login.visible = false
