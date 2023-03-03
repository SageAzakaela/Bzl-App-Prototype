extends Node


var drawables := []

onready var drawable_square = preload("res://Prototype/DrawingSurface/Drawable/DrawableSquare.tscn")
onready var drawable_circle = preload("res://Prototype/DrawingSurface/Drawable/DrawableCircle.tscn")


func spawn_drawable(drawable):
	var instance = drawable.instance()
	drawables.push_back(instance)
	instance.connect("pressed", self, "on_drawable_pressed")
	instance.connect("deleted", self, "on_drawable_deleted")
	add_child(instance)
	

func on_drawable_pressed(origin):
	var index := drawables.find(origin)
	
	if index < 0:
		return
	
	drawables.remove(index)
	drawables.push_back(origin)
	
	for i in range(0, drawables.size()):
		drawables[i].z_index = i


func on_drawable_deleted(origin):
	var index := drawables.find(origin)
	
	if index < 0:
		return

	drawables.remove(index)


func _on_spawn_square_buttom_pressed():
	spawn_drawable(drawable_square)


func _on_spawn_cirlce_buttom_pressed():
	spawn_drawable(drawable_circle)
