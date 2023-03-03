extends Node
class_name DrawableSpawner


# every drawable currently spawned
var drawables := []

# drawables the mouse is hovering over
var hovered_drawables := []

# drawable which is currently being draged
var active_drawable

onready var drawable_square = preload("res://Prototype/DrawingSurface/Drawable/DrawableSquare.tscn")
onready var drawable_circle = preload("res://Prototype/DrawingSurface/Drawable/DrawableCircle.tscn")


func spawn_drawable(drawable):
	var instance = drawable.instance()
	instance.disable()
	instance.drawable_spawner = self
	drawables.push_back(instance)
	_update_z_index(drawables, instance)
	add_child(instance)


func _input(event):
	if event.is_action_pressed("left_click"):
		if active_drawable != null:
			return
			
		active_drawable = _get_last(hovered_drawables)
		
		if active_drawable == null:
			return
		
		active_drawable.enable()
		
	elif event.is_action_released("left_click"):
		if active_drawable == null:
			return
			
		active_drawable.disable()
		active_drawable = null


func _update_z_index(array: Array, drawable):
	drawable.z_index = array.find(drawable)

	
func _update_z_indecies(array: Array):
	for i in range(0, array.size()):
		array[i].z_index = i


func _sort_by_z_index(array: Array):
	array.sort_custom(self, "_sort_by_z_index_ascent")
	
	
func _sort_by_z_index_ascent(a, b):
	if a.z_index < b.z_index:
		return true
	return false


func _add_to_hovered(drawable):
	if hovered_drawables.find(drawable) >= 0:
		return
	
	hovered_drawables.push_back(drawable)
	_sort_by_z_index(hovered_drawables)
	
	print(hovered_drawables)


func _remove_from_hovered(drawable):
	var index = hovered_drawables.find(drawable)
	
	if index < 0:
		return

	hovered_drawables.remove(index)
	_sort_by_z_index(hovered_drawables)
	
	
func _get_last(array: Array):
	if array.size() == 0:
		return
		
	return array[array.size() - 1]


func _on_spawn_square_buttom_pressed():
	spawn_drawable(drawable_square)


func _on_spawn_cirlce_buttom_pressed():
	spawn_drawable(drawable_circle)
