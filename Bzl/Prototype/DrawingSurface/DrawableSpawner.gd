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
onready var drawable_triangle = preload("res://Prototype/DrawingSurface/Drawable/DrawableTriangle.tscn")
onready var drawable_bolt = preload("res://Prototype/DrawingSurface/Drawable/DrawableBolt.tscn")
onready var drawable_heart = preload("res://Prototype/DrawingSurface/Drawable/DrawableHeart.tscn")
onready var drawable_moon = preload("res://Prototype/DrawingSurface/Drawable/DrawableMoon.tscn")
onready var drawable_star = preload("res://Prototype/DrawingSurface/Drawable/DrawableStar.tscn")


func spawn_drawable(drawable):
	var instance = drawable.instance()
	instance.disable()
	instance.drawable_spawner = self
	_push_to_back(drawables, instance)
	_update_z_index(drawables, instance)
	add_child(instance)


func _input(event):
	if event.is_action_pressed("left_click"):
		if active_drawable != null:
			return
			
		active_drawable = _get_last(hovered_drawables)
		
		if active_drawable == null:
			return
			
		_push_to_back(drawables, active_drawable)
		_update_z_indecies(drawables)
		
		active_drawable.enable()
		
	elif event.is_action_released("left_click"):
		if active_drawable == null:
			return
			
		active_drawable.disable()
		active_drawable = null
		
	if event.is_action_released("right_click"):
		if active_drawable != null:
			return
			
		var drawable = _get_last(hovered_drawables)
		
		if drawable == null:
			return
			
		_remove_from_hovered(drawable)
		_remove_from_drawables(drawable)
		drawable.queue_free()


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


func _remove_from_drawables(drawable):
	var index = drawables.find(drawable)
	
	if index < 0:
		return

	drawables.remove(index)
	_sort_by_z_index(drawables)


func _get_last(array: Array):
	if array.size() == 0:
		return
		
	return array[array.size() - 1]


func _push_to_back(array: Array, drawable):
	var index = array.find(drawable)
	
	if index >= 0:
		array.remove(index)
	
	array.push_back(drawable)


func _on_spawn_square_buttom_pressed():
	spawn_drawable(drawable_square)


func _on_spawn_cirlce_buttom_pressed():
	spawn_drawable(drawable_circle)

func _on_spawn_triangle_buttom_pressed():
	spawn_drawable(drawable_triangle)
	
func _on_spawn_bolt_buttom_pressed():
	spawn_drawable(drawable_bolt)
	
func _on_spawn_heart_buttom_pressed():
	spawn_drawable(drawable_heart)
	
func _on_spawn_moon_buttom_pressed():
	spawn_drawable(drawable_moon)
	
func _on_spawn_star_buttom_pressed():
	spawn_drawable(drawable_star)
